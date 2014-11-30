using Android.App;
using Android.Media;
using Android.Widget;
using Android.OS;
using Java.IO;
using MoodStreamer.Shared;
using Console = System.Console;

namespace MoodStreamer
{

	enum TrackType
	{
		Happy, Sad
	}


	[Activity (Label = "Mood Streamer", MainLauncher = true, Icon = "@drawable/icon")]
	public class MainActivity : Activity
	{
		Streamer _streamer = new Streamer();

	    private MediaPlayer _player;

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);

			SetContentView (Resource.Layout.Main);


		    _player = new MediaPlayer();
		    var mc = FindViewById<MediaController>(Resource.Id.mediaController);
            

			FindViewById<Button> (Resource.Id.happyButton).Click += (o, e) => StreamTrack(TrackType.Happy);
			FindViewById<Button>(Resource.Id.sadButton).Click += (o, e) => StreamTrack(TrackType.Sad);
		}


		private void StreamTrack(TrackType trackType)
		{
			Console.WriteLine(trackType.ToString());

		    string fp = string.Format("http://fyp.matthewoneill.com/{0}", trackType.ToString().ToLower());

            _player.SetAudioStreamType(Stream.Music);
            _player.Reset();
            _player.SetDataSource(fp);
            _player.Prepare();
            _player.Start();
            
		}
	}
}


