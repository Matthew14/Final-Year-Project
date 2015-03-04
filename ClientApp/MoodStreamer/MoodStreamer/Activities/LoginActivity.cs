using System;
using System.IO;
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

            string db = LoadDatabaseIntoStorage();
            Database.Path = db;
            CheckAlreadyLoggedIn();

			FindViewById<Button> (Resource.Id.loginRegisterButton).Click += LoginButtonOnClick;

		}

        private void CheckAlreadyLoggedIn()
        {
            _loginManager = new LoginManager();

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
            Login(user.username, user.password);
        }

        void Login(string username, string password)
        {
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


        string LoadDatabaseIntoStorage()
        {
            var dbName = "MoodStreamer.db";
            string dbPath = Path.Combine (Android.OS.Environment.ExternalStorageDirectory.ToString(), dbName);

            if (!File.Exists(dbPath))
            {
                using (var br = new BinaryReader(Assets.Open(dbName)))
                {
                    using (var bw = new BinaryWriter(new FileStream(dbPath, FileMode.Create)))
                    {
                        var buffer = new byte[2048];
                        int len = 0;
                        while ((len = br.Read(buffer, 0, buffer.Length)) > 0)
                            bw.Write (buffer, 0, len);
                    }
                }
            }

            return dbPath;
        }
	}
}

