using Android.App;
using Android.Media;
using Android.Widget;
using Android.Content;
using Android.OS;

using Console = System.Console;

namespace MoodStreamer
{	

	enum TrackType
	{
		Happy, Sad
	}


	[Activity (Label = "Mood Streamer", MainLauncher = true, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
	public class MainActivity : Activity
	{
		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);

			SetContentView (Resource.Layout.Main);

			FindViewById<Button> (Resource.Id.happyButton).Click += (o, e) => StartMoodRadio(TrackType.Happy);
			FindViewById<Button>(Resource.Id.sadButton).Click += (o, e) => StartMoodRadio(TrackType.Sad);

		}

		private void StartMoodRadio(TrackType trackType)
		{
			var instance = PlayerActivity.Instance;
			if(instance != null) instance.Finish();

			var intent = new Intent (this, typeof(PlayerActivity));
			
			intent.PutExtra ("mood", trackType.ToString ());

			StartActivity (intent);
		}

	}
}


