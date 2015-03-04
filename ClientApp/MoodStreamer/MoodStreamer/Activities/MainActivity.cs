using System;

using Android.App;
using Android.Media;
using Android.Widget;
using Android.Content;
using Android.OS;
using Android.Views;

using MoodStreamer.Shared;


namespace MoodStreamer
{	

	enum TrackType
	{
		Happy, Sad
	}


	[Activity (Label = "Mood Streamer", MainLauncher = false, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
	public class MainActivity : Activity
	{

		float _positivity = 50;
		float _excitedness = 50;

        string _loggedInUser;

        Database _database;
        LoginManager _loginManager;

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);
			SetContentView (Resource.Layout.Main);

            _loginManager = new LoginManager();
            _database = new Database();
            _loggedInUser = Intent.GetStringExtra("username");

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
                intent.PutExtra("lastUsername", _loggedInUser);

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
            //TODO
			new PopupWindow(480,500);
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

			Console.WriteLine ("({0}, {1})", x, y);
		}

		#endregion

		#region Overrides
		public override bool OnOptionsItemSelected(IMenuItem item)
		{
			switch (item.ItemId) 
			{
			case Resource.Id.action_settings:
				ShowTracksSummary ();
					break;
				case Resource.Id.action_viewstats:
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
			var inf = this.MenuInflater;
			inf.Inflate (Resource.Menu.main_activity_actions, menu);

			return base.OnCreateOptionsMenu (menu);
		}

		#endregion

	}
}