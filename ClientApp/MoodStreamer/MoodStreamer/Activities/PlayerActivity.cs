using System;
using System.Collections.Concurrent;
using System.Net;
using System.Threading;
using Android.App;
using Android.Content.PM;
using Android.Graphics;
using Android.Media;
using Android.OS;
using Android.Views;
using Android.Widget;
using MoodStreamer.Shared;

namespace MoodStreamer.Activities
{
    [Activity(Label = "PlayerActivity", Theme = "@style/AppTheme")]
    public class PlayerActivity : Activity
    {
        private static MediaPlayer _player;

        private float _excitedness;
        private float _positivity;

        private const int PlayQueueSize = 5;
        
        private Thread _playerThread;

        private TrackManager _trackManager;

        private TextView _artistTextView, _trackTitleTextView;
        private IMenuItem _volMenuItem;
        private ImageView _coverArt;
        private SeekBar _playerSeekBar;
        private ImageButton _playPauseButton, _backButton;

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
            
            Title = String.Format("({0} {1})", _excitedness, _positivity);

            ActionBar.SetHomeButtonEnabled(true);
            ActionBar.SetDisplayHomeAsUpEnabled(true);
            
            SetupUiElements();

            PlayTrack();
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
            while (track == null && (track = GetTrackOffQueue()) == null);
            
            var fp = String.Format("{0}/{1}", Constants.ServiceUrl, track.FilePath.Replace(" ", "%20"));
            
            new Thread(() => LoadImageIntoImageView(track.AlbumArt)){Name="Artwork Loader Thread"}.Start();

            _player.SetAudioStreamType(Stream.Music);
            _player.Reset();
            _player.SetDataSource(fp);
            _player.PrepareAsync();

            _playerSeekBar.Max = track.Duration;
            
            Title = String.Format("{0} - {1}", track.Artist, track.Title);

            _artistTextView.SetText(track.Artist, TextView.BufferType.Normal);
            _trackTitleTextView.SetText(track.Title, TextView.BufferType.Normal);


            var newPic = _player.IsPlaying ? Resource.Drawable.pausewhite : Resource.Drawable.playwhite;
            _playPauseButton.SetImageResource(newPic);

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
                    
                    return true;
                default:
                    return base.OnOptionsItemSelected(item);
            }
        }

        #endregion
    }
}

