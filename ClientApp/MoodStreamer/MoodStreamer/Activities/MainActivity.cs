using System;
using System.Threading;
using Android.App;
using Android.Content;
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


        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.Main);

            _loginManager = new LoginManager();
            _preferences = GetSharedPreferences(GetString(Resource.String.preferencesName), FileCreationMode.Private);

            _loggedInUser = new User(Intent.GetStringExtra("username"));

            if (_loggedInUser == null)
                GoToLogin();

            SetupEvents();
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

            _dot.SetX(_square.Width/2);
            _dot.SetY(_square.Height/2);
        }

        private void StartMoodRadio()
        {
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

        private void GoBackToPlayingActivity()
        {
            throw new NotImplementedException();
        }

        #region EventHandlers

        private void StartPlayingPressed(object sender, View.TouchEventArgs e)
        {
            StartMoodRadio();
        }

        private void SquareTouched(object sender, View.TouchEventArgs e)
        {
            
            var theEvent = e.Event;

            var x = theEvent.GetX();
            var y = theEvent.GetY();
            
            _dot.SetX(x);
            _dot.SetY(y);

            if (theEvent.Action == MotionEventActions.Up)
                StartMoodRadio();


            _positivity = x;
            _excitedness = y;

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
                    GoBackToPlayingActivity();
                    break;
                default:
                    break;
            }

            return base.OnOptionsItemSelected(item);
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.main_activity_actions, menu);

            _backToPlayingItem = menu.FindItem(Resource.Id.action_playing_button);
            _backToPlayingItem.SetEnabled(false);
            _backToPlayingItem.SetVisible(false);


            return base.OnCreateOptionsMenu(menu);
        }

        #endregion
    }
}