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
        private ProgressDialog _loginProgressDialog;

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);
			SetContentView (Resource.Layout.Login);

            _loginProgressDialog =  new ProgressDialog(this);
            string db = Utils.LoadDatabaseIntoStorage(this);
            Database.Path = db;
            CheckAlreadyLoggedIn();

			FindViewById<Button> (Resource.Id.loginRegisterButton).Click += LoginButtonOnClick;

		}

        private void CheckAlreadyLoggedIn()
        {
            _loginManager = new LoginManager();      

            var lastUser = _loginManager.LoadLastLoginCredentials();

            if (lastUser != null)
                Login(lastUser);
        }

        private void ProceedToMainActivity(string username)
        {
            var intent = new Intent(Application.Context, typeof(MainActivity));
            intent.PutExtra("username", username);
            StartActivity(intent);

            RunOnUiThread(() =>
            {
                if (_loginProgressDialog != null && _loginProgressDialog.IsShowing)
                    _loginProgressDialog.Hide();
            } );

            Finish();
        }

        void Login(User user)
        {
            Login(user.username, user.password);
        }

        void Login(string username, string password)
        {
            _loginProgressDialog = ProgressDialog.Show(this, "Logging In...", "Please Wait", false);
            _loginProgressDialog.SetProgressStyle(ProgressDialogStyle.Spinner);

            new Thread(() =>
            {
                if (_loginManager.PerformLogin(username, password))
                {
                    _loginManager.SaveLastLogin(username, password);
                    ProceedToMainActivity(username);
                }
                else
                {
                    RunOnUiThread(() =>
                    {
                        RunOnUiThread(_loginProgressDialog.Hide);
                        Toast.MakeText(Application.Context, "Incorrect Username or Password", ToastLength.Long).Show();
                    });
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

