using System;
using Android.Widget;
using Android.Content;

namespace MoodStreamer
{
	public class MyMediaController : MediaController
	{
		public MyMediaController(Context c) : base(c)
		{

		}

		public MyMediaController(Context c, bool theBool) : base(c, theBool)
		{

		}



		/// <summary>
		/// Actually hides the Controls
		/// </summary>
		public void WorkingHide()
		{
			base.Hide();
		}
	}
}

