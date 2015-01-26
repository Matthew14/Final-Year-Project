using Android.App;
using Android.Content;
using Android.OS;

using Console = System.Console;
using Android.Widget;

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

			((Button)Resource.Id.startPlaying).Click += (o, e) => {
				int positivity = ((SeekBar) Resource.Id.positiveNegative).Progress;
				int excitedness = ((SeekBar) Resource.Id.calmExcited).Progress;

				Console.WriteLine (positivity);
				Console.WriteLine (excitedness);
			};

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


