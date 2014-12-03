
using System;

using Android.App;
using Android.OS;
using Android.Widget;
using Android.Media;
using Android.Views;

namespace MoodStreamer
{
	[Activity (Label = "PlayerActivity", Theme = "@style/AppTheme")]			
	public class PlayerActivity : Activity, MediaController.IMediaPlayerControl, MediaPlayer.IOnPreparedListener
	{
		public void OnPrepared (MediaPlayer mp)
		{
			_mediaController.SetMediaPlayer(this);
			_mediaController.SetAnchorView (FindViewById(Resource.Id.theView));
			_mediaController.Show (0);

		}

		static MediaPlayer _player;
		MyMediaController _mediaController;


		string _currentMood;

		public static PlayerActivity Instance{ get ; private set;}

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);
			SetContentView (Resource.Layout.Player);

			Instance = this;

			if (_player == null) {
				_player = new MediaPlayer ();
				_player.SetOnPreparedListener (this);
			}
			_mediaController = new MyMediaController (this);
			_mediaController.NextClick += (o, e) => PlayTrack (_currentMood);
			string text = Intent.GetStringExtra ("mood") ?? "no mood";
			this.Title = text;
			_currentMood = text;

			PlayTrack (text);
		}

		public override bool OnKeyDown (Keycode keyCode, KeyEvent e)
		{
			if (e.KeyCode == Keycode.Back)
			{
				_mediaController.WorkingHide ();
				base.OnBackPressed ();
			}

			return base.OnKeyDown (keyCode, e);
		}

		private void PlayTrack(string mood)
		{
			Console.WriteLine(mood);
			Toast.MakeText (this, string.Format("Now playing {0} tracks", mood), ToastLength.Long).Show ();

			string fp = string.Format("http://fyp.matthewoneill.com/{0}", mood.ToLower());

			_player.SetAudioStreamType(Stream.Music);
			_player.Reset();
			_player.SetDataSource(fp);
			_player.Prepare();
			_player.Start();
		}

		public bool CanPause ()
		{
			return true;
		}

		public bool CanSeekBackward ()
		{
			return false;
		}

		public bool CanSeekForward ()
		{
			return false;
		}

		public void Pause ()
		{
			_player.Pause ();
		}

		public void SeekTo (int pos)
		{
		_player.SeekTo (pos);
		}

		public void Start ()
		{
			_player.Start ();
		}

		public int AudioSessionId {
			get {
				return _player.AudioSessionId;
			}
		}

		public int BufferPercentage {
			get {
				return 10;
			}
		}

		public int CurrentPosition {
			get {
				return _player.CurrentPosition;
			}
		}

		public int Duration {
			get {
				return _player.GetTrackInfo ().GetLength(0);
			}
		}

		public bool IsPlaying {
			get {
				return _player.IsPlaying;
			}
		}
			
	}
}

