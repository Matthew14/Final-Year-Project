using System;

using Android.App;
using Android.OS;
using Android.Widget;
using Android.Media;
using Android.Views;

using MoodStreamer.Shared;

namespace MoodStreamer
{
	[Activity (Label = "PlayerActivity", Theme = "@style/AppTheme")]			
	public class PlayerActivity : Activity, MediaController.IMediaPlayerControl
	{
		static MediaPlayer _player;

        float _excitedness;
        float _positivity;

        TrackManager _trackManager;

		System.Collections.Stack _playedStack = new System.Collections.Stack();
		public static PlayerActivity Instance{ get ; private set;}

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);

			SetContentView (Resource.Layout.Player);

			Instance = this;

			if (_player == null) {
				_player = new MediaPlayer ();
			}

            _excitedness = Intent.GetFloatExtra("excitedness", 0);
            _positivity = Intent.GetFloatExtra("positivity", 0);

            PlayTrack();

            this.Title = String.Format("({0} {1})", _excitedness, _positivity);
			
			ActionBar.SetHomeButtonEnabled(true);
			ActionBar.SetDisplayHomeAsUpEnabled(true);

			SetupButtons ();
		}

		void SetupButtons ()
		{
			FindViewById<ImageButton> (Resource.Id.playPauseButton).Click += PlayPausedPressed;
			FindViewById<ImageButton> (Resource.Id.nextButton).Click += NextPressed;
			FindViewById<ImageButton> (Resource.Id.backButton).Click += BackPressed;
		}

		void BackPressed (object sender, EventArgs e)
		{
			//TODO
			_playedStack.Pop ();
		}

		void NextPressed (object sender, EventArgs e)
		{
			PlayTrack ();
		}

		void PlayPausedPressed (object sender, EventArgs args)
		{
			var button = (ImageButton)sender;

			if (_player.IsPlaying)
				_player.Pause ();
			else
				_player.Start ();


			var newPic = _player.IsPlaying ? Resource.Drawable.pause : Resource.Drawable.play;

			button.SetImageResource (newPic);

			Console.WriteLine ("playPause");
		}

		public override bool OnOptionsItemSelected(IMenuItem item)
		{
			switch (item.ItemId)
			{
				case Android.Resource.Id.Home:
					Finish();
					return true;

				default:
					return base.OnOptionsItemSelected(item);
			}
		}

		public override bool OnKeyDown (Keycode keyCode, KeyEvent e)
		{
			if (e.KeyCode == Keycode.Back)
			{
				base.OnBackPressed ();
			}

			return base.OnKeyDown (keyCode, e);
		}

		private void PlayTrack()
		{
            if (_trackManager == null)
                _trackManager = new TrackManager();

            var track = _trackManager.GetTrackByExcitednessAndPositivity(_excitedness, _positivity);

            string fp = "http://192.168.1.19:5050/" +track.FilePath.Replace(" ", "%20");

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

