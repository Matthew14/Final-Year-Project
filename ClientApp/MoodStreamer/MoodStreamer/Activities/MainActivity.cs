using Android.App;
using Android.Media;
using Android.Widget;
using Android.Content;
using Android.OS;

using Console = System.Console;
using Android.Views;

namespace MoodStreamer
{	

	enum TrackType
	{
		Happy, Sad
	}


	[Activity (Label = "Mood Streamer", MainLauncher = true, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
	public class MainActivity : Activity
	{

		float _positivity = 50;
		float _excitedness = 50;

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);


			SetContentView (Resource.Layout.Main);

			SetupEvents();			
		}

		void SetupEvents ()
		{
			FindViewById<Button> (Resource.Id.startPlaying).Touch += StartPlayingPressed;
			FindViewById<ImageView> (Resource.Id.square).Touch += SquareTouched;
		}

		private void StartMoodRadio(TrackType trackType)
		{
			var instance = PlayerActivity.Instance;
			if(instance != null) 
				instance.Finish();

			var intent = new Intent (this, typeof(PlayerActivity));

			intent.PutExtra ("mood", trackType.ToString ());

			StartActivity (intent);
		}

		private void ShowTracksSummary()
		{
			new PopupWindow(480,500);
		}

		#region EventHandlers

		void StartPlayingPressed (object sender, View.TouchEventArgs e)
		{
			throw new System.NotImplementedException ();
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


