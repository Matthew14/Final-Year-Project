using System;
using System.Collections.Concurrent;
using System.Net;
using System.Threading;
using Android.App;
using Android.Content.PM;
using Android.Graphics;
using Android.Hardware;
using Android.Media;
using Android.OS;
using Android.Views;
using Android.Widget;
using MoodStreamer.Shared;

namespace MoodStreamer.Activities
{
    
    [Activity(Label = "Mood Streamer", Theme = "@style/AppTheme")]
    public class PlayerActivity : Activity, ISensorEventListener
    {
        //accelerometer stuff
        bool _hasUpdated;
        DateTime _lastAccelerometerUpdate, _lastShakeSkip = DateTime.Now;
        float _lastX;
        float _lastY;
        float _lastZ;

        const int ShakeDetectionTimeLapse = 250;
        const double ShakeThreshold = 1000;


        private static MediaPlayer _player;

        private float _excitedness;
        private float _positivity;

        private const int PlayQueueSize = 5;
        
        private Thread _playerThread;

        private TrackManager _trackManager;

        private TextView _artistTextView, _trackTitleTextView;
        private ImageView _coverArt;
        private SeekBar _playerSeekBar;
        private ImageButton _playPauseButton, _backButton;

        private Track _currentTrack;

        private readonly ConcurrentStack<Track> _playedStack = new ConcurrentStack<Track>();
        private readonly ConcurrentQueue<Track> _playQueue = new ConcurrentQueue<Track>();

        public static PlayerActivity Instance { get; private set; }

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            SetContentView(Resource.Layout.Player);
            RequestedOrientation = ScreenOrientation.Portrait;

            Instance = this;

            if (_player == null)
            {
                _player = new MediaPlayer();
                _player.Prepared += (s, e) => _player.Start();
                _player.Completion += (s, e) => PlayTrack();
            }

            _excitedness = Intent.GetFloatExtra("excitedness", 0);
            _positivity = Intent.GetFloatExtra("positivity", 0);

            (_playerThread = new Thread(PlayerWorker) {IsBackground = true, Name = "Player Thread"}).Start();
            
            ActionBar.SetHomeButtonEnabled(true);
            ActionBar.SetDisplayHomeAsUpEnabled(true);
            
            SetupUiElements();

            StartCacheThread();


            PlayTrack();
        }

        private void StartCacheThread()
        {
            new Thread(() =>
            {
                for (;;)
                {
                    
                }
            }).Start();
        }

        private void PlayerSeekBarOnProgressChanged(object sender, SeekBar.ProgressChangedEventArgs progressChangedEventArgs)
        {
            if(progressChangedEventArgs.FromUser)
                _player.SeekTo(_playerSeekBar.Progress*1000);   
        }

        private void PlayerWorker()
        {
            for (;;)
            {
                RunOnUiThread(() => _backButton.Enabled = _playedStack.Count > 1);

                if (_playQueue.Count < PlayQueueSize)
                {
                    if (_trackManager == null)
                        _trackManager = new TrackManager();

                    var track = _trackManager.GetTrackByExcitednessAndPositivity(_excitedness, _positivity);

                    _playQueue.Enqueue(track);
                }

                Thread.Sleep(500);

                RunOnUiThread(() => _playerSeekBar.Progress = _player.CurrentPosition/1000 );
                
                var sensorManager = (SensorManager)GetSystemService(SensorService);
                var accelerometer = sensorManager.GetDefaultSensor(SensorType.Accelerometer);
                sensorManager.RegisterListener(this, accelerometer, SensorDelay.Game);
            }
        }

        private void SetupUiElements()
        {
            _artistTextView = FindViewById<TextView>(Resource.Id.artistTextView);
            _trackTitleTextView = FindViewById<TextView>(Resource.Id.trackTitleTextView);

            _coverArt = FindViewById<ImageView>(Resource.Id.artWorkImageView);
            _playerSeekBar = FindViewById<SeekBar>(Resource.Id.playerSeek);
            _playerSeekBar.ProgressChanged += PlayerSeekBarOnProgressChanged;
            _playPauseButton = FindViewById<ImageButton>(Resource.Id.playPauseButton);
            _backButton = FindViewById<ImageButton>(Resource.Id.backButton);
            _backButton.Click += BackPressed;
            _playPauseButton.Click += PlayPausedPressed;

            FindViewById<ImageButton>(Resource.Id.nextButton).Click += NextPressed;
        }

        private void BackPressed(object sender, EventArgs e)
        {
            Track track;
            _playedStack.TryPop(out track);
            PlayTrack(track);
            
        }

        private void NextPressed(object sender, EventArgs e)
        {
            PlayTrack();
        }

        private void PlayPausedPressed(object sender, EventArgs args)
        {
            var button = (ImageButton) sender;

            if (_player.IsPlaying)
                _player.Pause();
            else
                _player.Start();

            var newPic = _player.IsPlaying ? Resource.Drawable.pausewhite : Resource.Drawable.playwhite;
            button.SetImageResource(newPic);
        }
        
        public override bool OnKeyDown(Keycode keyCode, KeyEvent e)
        {
            if (e.KeyCode == Keycode.Back)
                OnBackPressed();

            return base.OnKeyDown(keyCode, e);
        }

        private void PlayTrack(Track track = null)
        {
            //Wait for the queue thread to put a track on the queue if not already
            while (track == null && (track = GetTrackOffQueue()) == null);
            
            _currentTrack = track;
            
            //Escape Spaces in the url for HTTP
            var fp = String.Format("{0}/{1}", Constants.ServiceUrl, track.FilePath.Replace(" ", "%20"));
            
            //Do this on new thread so music can play while waiting
            new Thread(() => LoadImageIntoImageView(track.AlbumArt)){Name="Artwork Loader Thread"}.Start();

            _player.SetAudioStreamType(Stream.Music);
            _player.Reset();
            _player.SetDataSource(fp);
            _player.PrepareAsync();

            _playerSeekBar.Max = track.Duration;
            
            _artistTextView.SetText(track.Artist, TextView.BufferType.Normal);
            _trackTitleTextView.SetText(track.Title, TextView.BufferType.Normal);


            _playPauseButton.SetImageResource(Resource.Drawable.pausewhite);

            _playedStack.Push(track);
        }

        private Track GetTrackOffQueue()
        {
            Track track;
            _playQueue.TryDequeue(out track);
            return track;
        }

        private Bitmap GetImageBitmapFromUrl(string url)
        {
            if (!url.Contains("http://"))
                url = "http://" + url;

            Bitmap imageBitmap = null;

            using (var webClient = new WebClient())
            {
                var imageBytes = webClient.DownloadData(url);
                if (imageBytes != null && imageBytes.Length > 0)
                    imageBitmap = BitmapFactory.DecodeByteArray(imageBytes, 0, imageBytes.Length);
            }
            
            return imageBitmap;
        }

        private void LoadImageIntoImageView(string url)
        {
            var bitmap = GetImageBitmapFromUrl(url);
            RunOnUiThread(() => _coverArt.SetImageBitmap(bitmap));
        }

        #region Overrides

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.player_activity_actions, menu);

            return base.OnCreateOptionsMenu(menu);
        }
        
        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
                case Android.Resource.Id.Home:
                    //TODO
                    Finish();
                    return true;
                case Resource.Id.action_vol:
                    var audio = (AudioManager) GetSystemService(AudioService); 
                    audio.AdjustStreamVolume(Stream.Music, Adjust.Same, VolumeNotificationFlags.ShowUi);
                    return true;
                case Resource.Id.action_disagree:
                    ShowDisagreePopUp();
                    return true;
                case Resource.Id.action_agree:
                    UserAgree();
                    return true;
                default:
                    return base.OnOptionsItemSelected(item);
            }
        }

        private void ShowDisagreePopUp()
        {
            const int menuItemView = Resource.Id.action_disagree;

            var layout = FindViewById<LinearLayout>(Resource.Id.disagree_popup);
            var inflater = (LayoutInflater) GetSystemService(LayoutInflaterService);

            var inflatedLayout = inflater.Inflate(Resource.Layout.disagree_popup_layout, layout);
            var popup = new PopupWindow(this)
            {
                ContentView = inflatedLayout,
                Width = 600,
                Height = 850,
                Focusable = true,
                
            };
            popup.ShowAsDropDown(FindViewById(menuItemView));

            Action<DisagreeType> theButtonHandler = dt =>
            {
                popup.Dismiss();
                ActOnDisagree(dt);
            };

            inflatedLayout.FindViewById<Button>(Resource.Id.more_positive_button).Click += ((o ,e) => theButtonHandler(DisagreeType.MorePositive));
            inflatedLayout.FindViewById<Button>(Resource.Id.less_positive_button).Click += ((o, e) => theButtonHandler(DisagreeType.LessPositive));
            inflatedLayout.FindViewById<Button>(Resource.Id.more_excited_button).Click += ((o, e) => theButtonHandler(DisagreeType.MoreExcited));
            inflatedLayout.FindViewById<Button>(Resource.Id.less_excited_button).Click += ((o, e) => theButtonHandler(DisagreeType.LessExcited));
        }

        void ActOnDisagree(DisagreeType dt)
        {
            _trackManager.Disagree(dt, _currentTrack);
            
            string message = String.Format("Sending {0} feedback!", dt.ToString().SplitPascal());
            Toast.MakeText(this, message, ToastLength.Short).Show();
        }
        
        private void UserAgree()
        {
            Toast.MakeText(this, "Thanks for the feedback!", ToastLength.Short).Show();
        }

        //SensorListener

        public void OnAccuracyChanged(Sensor sensor, SensorStatus accuracy){}
        
        /// <summary>
        /// The following shake detection method inspired by this stack overflow answer:
        /// http://stackoverflow.com/questions/23120186/can-xamarin-handle-shake-accelerometer-on-android
        /// </summary>
        /// <param name="e"></param>
        public void OnSensorChanged(SensorEvent e)
        {
            if (e.Sensor.Type != SensorType.Accelerometer) 
                return;

            float x = e.Values[0], y = e.Values[1], z = e.Values[2];
            var curTime = DateTime.Now;
          
            if (!_hasUpdated)
            {
                _hasUpdated = true;
                _lastAccelerometerUpdate = curTime;
                
            }
            else
            {
                if (!((curTime - _lastAccelerometerUpdate).TotalMilliseconds > ShakeDetectionTimeLapse)) 
                    return;
                    
                var diffTime = (float)(curTime - _lastAccelerometerUpdate).TotalMilliseconds;
                _lastAccelerometerUpdate = curTime;
                var total = x + y + z - _lastX - _lastY - _lastZ;
                var speed = Math.Abs(total) / diffTime * 10000;

                if (speed > ShakeThreshold && (DateTime.Now - _lastShakeSkip) > new TimeSpan(0, 0, 0, 5))
                {
                    //user has got their shake on...
                    var v = (Vibrator) GetSystemService(VibratorService);
                    v.Vibrate(300);
                    NextPressed(null, null);
                    _lastShakeSkip = DateTime.Now;
                }
            }
            _lastX = x;
            _lastY = y;
            _lastZ = z;
        }
        #endregion
    }
}

