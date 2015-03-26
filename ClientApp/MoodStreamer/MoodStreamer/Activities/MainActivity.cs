using System;
using System.Threading;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Graphics;
using Android.OS;
using Android.Views;
using Android.Widget;
using MoodStreamer.Shared;

namespace MoodStreamer.Activities
{
    [Activity(Label = "Mood Streamer", MainLauncher = false, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
    public class MainActivity : Activity
    {
        private IMenuItem _backToPlayingItem;
        private float _excitedness = 50;
        private User _loggedInUser;
        private LoginManager _loginManager;
        private float _positivity = 50;
        private ISharedPreferences _preferences;
        private ImageView _square, _dot;
        private bool _initialTouchDone = false;
        private int _noTracksForUser = 0;
        private IMenu _menu;
        private IMenuItem _statsItem;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            RequestedOrientation = ScreenOrientation.Portrait; 
            SetContentView(Resource.Layout.Main);

            _loginManager = new LoginManager();
            _preferences = GetSharedPreferences(GetString(Resource.String.preferencesName), FileCreationMode.Private);

            _loggedInUser = new User(Intent.GetStringExtra("username"));

            if (_loggedInUser == null)
                GoToLogin();


            //Run a thread to get how many tracks a user has
            //Can't start radio without at least 1
            new Thread(() =>
            {
                var stats = _loggedInUser.GetStats();
                _noTracksForUser = stats.TrackCount;
            }).Start();

            StartWatchingForReanalysis();
            SetupEvents();
        }

        /// <summary>
        /// Starts a thread which periodically polls the web service to see if a reanalysis
        /// is taking place. If it is, then it sets the icon to be blue.
        /// </summary>
        private void StartWatchingForReanalysis()
        {
            new Thread(() =>
            {
                for (;;)
                {
                    if (_loggedInUser.IsReanalysing())
                        RunOnUiThread(() => _statsItem.SetIcon(Resource.Drawable.infoblue));
                    else
                        RunOnUiThread(() => _statsItem.SetIcon(Resource.Drawable.infowhite));
                    Thread.Sleep(1000);
                }
            }){IsBackground = true, Name = "Reanalysis Watcher"}.Start();
        }

        private void GoToLogin()
        {
            _loginManager.Logout();
            ClearLastUserFromPrefs();
            var intent = new Intent(Application.Context, typeof (LoginActivity));

            if (_loggedInUser != null)
                intent.PutExtra("lastUsername", _loggedInUser.username);

            StartActivity(intent);
            Finish();
        }

        private void SetupEvents()
        {
            //FindViewById<Button>(Resource.Id.startPlaying).Touch+= StartPlayingPressed;

            _dot = FindViewById<ImageView>(Resource.Id.dot);
            _square = FindViewById<ImageView>(Resource.Id.square);
            _square.Touch += SquareTouched;

            _dot.SetX(500);
            _dot.SetY(500);

            _dot.SetZ(1000);
        }

        private void ReturnToPlayer()
        {
            StartActivity(new Intent(this, typeof(PlayerActivity)));
        }

        private void StartMoodRadio()
        {
            if (_noTracksForUser < 1)
            {
                Toast.MakeText(this, "You need to add music first\nPlease download the Upload utility", ToastLength.Long).Show();
                return;
            }

            var instance = PlayerActivity.Instance;
            if (instance != null)
                instance.Finish();

            var intent = new Intent(this, typeof (PlayerActivity));

            intent.PutExtra("excitedness", _excitedness/100);
            intent.PutExtra("positivity", _positivity/100);

            StartActivity(intent);
        }

        private void ShowTracksSummary()
        {
            var progressDialog = ProgressDialog.Show(this, "Getting Stats...", "Please Wait", false);
            progressDialog.SetProgressStyle(ProgressDialogStyle.Spinner);
            
            new Thread(() =>
            {
                TrackStats stats = _loggedInUser.GetStats();

                var message = String.Format("Total Tracks: {0}\n\nTracks Analysed: {1}", 
                    stats.TrackCount,
                    stats.TracksAnalysed);

                var adBuilder = new AlertDialog.Builder(this);

                adBuilder.SetTitle(_loggedInUser.username);
                adBuilder.SetMessage(message);

                AlertDialog dialog = null;

                adBuilder.SetNeutralButton("Reanalyze Files", (s, e) =>
                {
                    _loggedInUser.Reanalyze();
                    _menu.FindItem(Resource.Id.action_viewstats).SetIcon(Resource.Drawable.infoblue);
                    Toast.MakeText(Application.Context, "Reanalysis Started", ToastLength.Long).Show();
                });
                adBuilder.SetPositiveButton("Dismiss", (s, e) => dialog.Dismiss());

                RunOnUiThread(() =>
                {
                    progressDialog.Hide();
                    dialog = adBuilder.Create();
                    dialog.Show();
                });
            }).Start();
        }

        private void ClearLastUserFromPrefs()
        {
            var editor = _preferences.Edit();

            editor.Remove("username");
            editor.Remove("password");

            editor.Commit();
        }

        #region EventHandlers

        private void SquareTouched(object sender, View.TouchEventArgs e)
        {
            var theEvent = e.Event;

            var x = theEvent.GetX();
            var y = theEvent.GetY();
            
            _dot.SetX(x);
            _dot.SetY(y);

            if (theEvent.Action == MotionEventActions.Up &&  _initialTouchDone)
                StartMoodRadio();

            _initialTouchDone = true;

            _positivity = y;
            _excitedness = x;

            const int div = 6;

            int r = (int) Math.Round(_positivity/div);
            int b = (int) Math.Round(_excitedness/div);

            if (r < 0) r = 0;
            if (r > 255) r = 255;
            if (b < 0) b = 0;
            if (b > 255) b = 255;

            _square.SetBackgroundColor(new Color(r, 0, b));
        }

        #endregion

        #region Overrides

        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
                case Resource.Id.action_settings:
                    var intent = new Intent(this, typeof (SettingsActivity));
                    StartActivity(intent);
                    break;
                case Resource.Id.action_viewstats:
                    ShowTracksSummary();
                    break;
                case Resource.Id.action_logout_button:
                    GoToLogin();
                    break;
                case Resource.Id.action_playing_button:
                    ReturnToPlayer();
                    break;
                default:
                    break;
            }

            return base.OnOptionsItemSelected(item);
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            _menu = menu;
            MenuInflater.Inflate(Resource.Menu.main_activity_actions, menu);

            _backToPlayingItem = menu.FindItem(Resource.Id.action_playing_button);
            _statsItem = menu.FindItem(Resource.Id.action_viewstats);
            return base.OnCreateOptionsMenu(menu);
        }

        public override void OnWindowFocusChanged(bool isFocussed)
        {
            
        }

        #endregion

        
    }
}