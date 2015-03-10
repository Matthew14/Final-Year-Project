using System;
using System.Threading;

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

        IMenuItem _backToPlayingItem;
        ISharedPreferences _preferences;
        User _loggedInUser;
        LoginManager _loginManager;

        protected override void OnCreate (Bundle bundle)
        {
            base.OnCreate (bundle);
            SetContentView (Resource.Layout.Main);

            _loginManager = new LoginManager();
            _preferences = this.GetSharedPreferences(GetString(Resource.String.preferencesName), FileCreationMode.Private);

            _loggedInUser = new User(Intent.GetStringExtra("username"));

            if (_loggedInUser == null)
                GoToLogin();

            SetupEvents();
        }

        private void GoToLogin()
        {
            _loginManager.Logout();
            ClearLastUserFromPrefs();
            var intent = new Intent(Application.Context, typeof(LoginActivity));

            if (_loggedInUser != null)
                intent.PutExtra("lastUsername", _loggedInUser.username);

            StartActivity(intent);
            Finish();
        }

        private void SetupEvents ()
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
            new Thread(() => 
            {
                var stats = _loggedInUser.GetStats();
                var message = String.Format("Total Tracks: {0}\n\nTracks Analysed: {1}", stats.TrackCount, stats.TracksAnalysed);
                
                var adBuilder = new AlertDialog.Builder(this);

                adBuilder.SetTitle(_loggedInUser.username);
                adBuilder.SetMessage(message);

                AlertDialog dialog = null;

                adBuilder.SetPositiveButton("OK", (s, e) => dialog.Dismiss());
                
                RunOnUiThread(() =>
                {
                    dialog = adBuilder.Create();
                    dialog.Show();
                });

            }).Start();
        }

        void ClearLastUserFromPrefs()
        {
            var editor = _preferences.Edit();

            editor.Remove("username");
            editor.Remove("password");

            editor.Commit();
        }

        void GoBackToPlayingActivity()
        {
            throw new NotImplementedException();
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
                    var intent = new Intent (this, typeof(SettingsActivity));
                    StartActivity (intent);
                    break;
                case Resource.Id.action_viewstats:
                    ShowTracksSummary ();
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

            return base.OnOptionsItemSelected (item);
        }

        public override bool OnCreateOptionsMenu (IMenu menu)
        {
            this.MenuInflater.Inflate (Resource.Menu.main_activity_actions, menu);

            _backToPlayingItem = menu.FindItem(Resource.Id.action_playing_button);
            _backToPlayingItem.SetEnabled(false);
            _backToPlayingItem.SetVisible(false);


            return base.OnCreateOptionsMenu (menu);
        }

        #endregion

    }
}