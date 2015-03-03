using System;
using System.Threading;

using MoodStreamer.Shared;

using Android.App;
using Android.OS;
using Android.Widget;
using Android.Content;


namespace MoodStreamer
{
    [Activity (Label = "Mood Streamer", MainLauncher = true, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
    public class LoginActivity : Activity
	{

        private LoginManager _loginManager;

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);
			SetContentView (Resource.Layout.Login);

            CheckAlreadyLoggedIn();

			FindViewById<Button> (Resource.Id.loginRegisterButton).Click += LoginButtonOnClick;

		}


        private void CheckAlreadyLoggedIn()
        {
            _loginManager = new LoginManager();
            if (_loginManager.LoggedIn)
            {
                ProceedToMainActivity(_loginManager.LoadLastLoginCredentials().Username);
            }

            var lastUser = _loginManager.LoadLastLoginCredentials();
            if (lastUser != null)
            {
                Login(lastUser);
            }
        }

        private void ProceedToMainActivity(string username)
        {
            var intent = new Intent(Application.Context, typeof(MainActivity));
            intent.PutExtra("username", username);
            StartActivity(intent);
            Finish();
        }

        void Login(User user)
        {
            Login(user.Username, user.Password);
        }

        void Login(string username, string password)
        {
            new Thread(() =>
            {
                if (_loginManager.PerformLogin(username, password))
                {
                    ProceedToMainActivity(username);
                }
                else
                {
                    RunOnUiThread(() =>
                        Toast.MakeText(Application.Context, "Incorrect Username or Password", ToastLength.Long).Show());
                }

            }){IsBackground = true, Name = "Login Thread"}.Start();
        }
         

		void LoginButtonOnClick (object sender, EventArgs e)
		{
			string username = FindViewById<EditText> (Resource.Id.usernameBox).Text;
			string password = FindViewById<EditText> (Resource.Id.passwordBox).Text;

            Login(username, password);
		}
	}
}

