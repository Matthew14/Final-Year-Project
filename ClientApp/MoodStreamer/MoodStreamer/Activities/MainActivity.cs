using System;

using Android.App;
using Android.Widget;
using Android.Content;
using Android.OS;
using Android.Views;

using MoodStreamer.Shared;


namespace MoodStreamer
{   
    [Activity (Label = "Mood Streamer", MainLauncher = false, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
    public class MainActivity : Activity
    {
        float _positivity = 50;
        float _excitedness = 50;

        User _loggedInUser;

        Database _database;
        LoginManager _loginManager;

        protected override void OnCreate (Bundle bundle)
        {
            base.OnCreate (bundle);
            SetContentView (Resource.Layout.Main);

            _loginManager = new LoginManager();
            _database = new Database();
            _loggedInUser = new User(Intent.GetStringExtra("username"));

            if (_loggedInUser == null)
                GoToLogin();

            SetupEvents();
        }

        void GoToLogin()
        {
            _loginManager.Logout();
            _database.ClearLastUser();
            var intent = new Intent(Application.Context, typeof(LoginActivity));

            if (_loggedInUser != null)
                intent.PutExtra("lastUsername", _loggedInUser.username);

            StartActivity(intent);
            Finish();
        }

        void SetupEvents ()
        {
            FindViewById<Button> (Resource.Id.startPlaying).Touch += StartPlayingPressed;
            FindViewById<ImageView> (Resource.Id.square).Touch += SquareTouched;
        }

        private void StartMoodRadio()
        {
            var instance = PlayerActivity.Instance;
            if(instance != null) 
                instance.Finish();

            var intent = new Intent (this, typeof(PlayerActivity));

            intent.PutExtra ("excitedness", _excitedness/100);
            intent.PutExtra ("positivity", _positivity/100);

            StartActivity (intent);
        }

        private void ShowTracksSummary()
        {
            var adBuilder = new AlertDialog.Builder(this);

            var stats = _loggedInUser.GetStats();
            var message = String.Format("Total Tracks: {0}\n\nTracks Analysed: {1}", stats.TrackCount, stats.TracksAnalysed);

            adBuilder.SetTitle(_loggedInUser.username);
            adBuilder.SetMessage(message);

            AlertDialog dialog = null;


            adBuilder.SetPositiveButton("OK", (s, e) =>{

                dialog.Dismiss();
                dialog.Dispose();
            
            });

            dialog = adBuilder.Create();
            dialog.Show();
        }

        #region EventHandlers

        void StartPlayingPressed (object sender, View.TouchEventArgs e)
        {
            StartMoodRadio();
        }

        private void SquareTouched (object sender, View.TouchEventArgs e)
        {
            var theEvent = e.Event;
            var x = theEvent.GetX ();
            var y = theEvent.GetY ();

            _positivity = x;
            _excitedness = y;
        }

        #endregion

        #region Overrides
        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId) 
            {
                case Resource.Id.action_settings:
                    break;
                case Resource.Id.action_viewstats:
                    ShowTracksSummary ();
                    break;
                case Resource.Id.action_logout_button:
                    GoToLogin();
                    break;
                default:
                    break;
            }

            return base.OnOptionsItemSelected (item);
        }

        public override bool OnCreateOptionsMenu (IMenu menu)
        {
            var menuInflater = this.MenuInflater;
            menuInflater.Inflate (Resource.Menu.main_activity_actions, menu);

            return base.OnCreateOptionsMenu (menu);
        }

        #endregion

    }
}