using System;
using System.Threading;

using MoodStreamer.Shared;

using Android.App;
using Android.OS;
using Android.Widget;
using Android.Content;
using MoodStreamer.Activities;


namespace MoodStreamer
{
    [Activity (Label = "Mood Streamer", MainLauncher = true, Icon = "@drawable/icon", Theme = "@style/AppTheme")]
    public class LoginActivity : Activity
	{
        private const string UsernameKey = "username";
        private const string PasswordKey = "password";

        private LoginManager _loginManager;
        private ProgressDialog _loginProgressDialog;
        private ISharedPreferences _preferences;

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);
			SetContentView (Resource.Layout.Login);

#if DEBUG
		    //ProceedToMainActivity("matt");
#endif
            
            _loginProgressDialog =  new ProgressDialog(this);
            _preferences = GetSharedPreferences(GetString(Resource.String.preferencesName), FileCreationMode.Private);
            
            CheckAlreadyLoggedIn();

			FindViewById<Button>(Resource.Id.loginButtonLoginActivity).Click += LoginButtonOnClick;
		    FindViewById<Button>(Resource.Id.registerButtonLoginActivity).Click += (s, e) =>
		    {
                var intent = new Intent(Application.Context, typeof(RegisterActivity));
                StartActivity(intent);
		    };

		}

        private void CheckAlreadyLoggedIn()
        {
            _loginManager = new LoginManager();      

            var lastUser = GetLastUser();

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
                    SaveLoginDetails(username, password);
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

        User GetLastUser()
        {
            User user = null;

            if (_preferences.Contains(UsernameKey) && _preferences.Contains(PasswordKey))
            {
                user = new User()
                {
                    username = _preferences.GetString(UsernameKey, null),
                    password = _preferences.GetString(PasswordKey, null)
                };
            }

            return user;
        }


        void SaveLoginDetails(string username, string password)
        {
            var editor = _preferences.Edit();

            editor.PutString(UsernameKey, username);
            editor.PutString(PasswordKey, password);

            editor.Commit();
        }

		void LoginButtonOnClick (object sender, EventArgs e)
		{
			string username = FindViewById<EditText> (Resource.Id.usernameBoxLogin).Text;
			string password = FindViewById<EditText> (Resource.Id.passwordBoxLogin).Text;

            Login(username, password);
		}
	}
}

