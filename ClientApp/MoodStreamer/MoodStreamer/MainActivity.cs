using Android.App;
using Android.Widget;
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

			var pn = FindViewById<SeekBar> (Resource.Id.positiveNegative);
			var ce = FindViewById<SeekBar> (Resource.Id.calmExcited);

			pn.Progress = 50;
			ce.Progress = 50;


			FindViewById<Button> (Resource.Id.startPlaying).Click += (o, e) => {

				int positivity = pn.Progress;
				int excitedness =  ce.Progress;


				Console.WriteLine (positivity);
				Console.WriteLine (excitedness);

				StartMoodRadio (positivity <= 49? TrackType.Sad : TrackType.Happy);

			};
		}

		private void StartTracks(int calmness, int positivity)
		{

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


