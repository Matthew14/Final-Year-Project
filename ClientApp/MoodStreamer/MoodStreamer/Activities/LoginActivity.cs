
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using MoodStreamer.Shared;

namespace MoodStreamer
{
	[Activity (Label = "LoginActivity")]			
	public class LoginActivity : Activity
	{
		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);
			SetContentView (Resource.Layout.Login);

			FindViewById<Button> (Resource.Id.loginRegisterButton).Click += LoginButtonOnClick;
		}

		void LoginButtonOnClick (object sender, EventArgs e)
		{
			
		}
	}
}

