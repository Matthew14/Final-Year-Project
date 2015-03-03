using System;
using MoodStreamer.Shared;

using Android.App;
using Android.OS;
using Android.Widget;


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
			string username = FindViewById<EditText> (Resource.Id.usernameBox).Text;
			string password = FindViewById<EditText> (Resource.Id.passwordBox).Text;

			Login login = new Login();

			if (login.PerformLogin(username, password))
			{
				
			}
			else
			{

			}
		}
	}
}

