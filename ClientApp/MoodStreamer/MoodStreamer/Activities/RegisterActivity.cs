using System;
using System.Net.Mail;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using Android.Widget;
using MoodStreamer.Shared;

namespace MoodStreamer.Activities
{
    [Activity(Label = "Register for Mood Streamer", Icon = "@drawable/icon", Theme = "@style/AppTheme")]
    public class RegisterActivity : Activity
    {

        private EditText _username, _password, _passwordAgain, _email;
        private Button _registerButton;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            SetContentView(Resource.Layout.RegisterLayout);
            RequestedOrientation = ScreenOrientation.Portrait;

            _username = FindViewById<EditText>(Resource.Id.usernameBoxRegister);
            _password = FindViewById<EditText>(Resource.Id.passwordBoxRegister);
            _passwordAgain = FindViewById<EditText>(Resource.Id.passwordAgainBox);
            _email = FindViewById<EditText>(Resource.Id.emailBoxRegister);
            _registerButton = FindViewById<Button>(Resource.Id.registerButtonOnRegisterActivity);

            _registerButton.Click += registerButton_Click;

            ActionBar.SetHomeButtonEnabled(true);
            ActionBar.SetDisplayHomeAsUpEnabled(true);

        }

        private void registerButton_Click(object sender, EventArgs e)
        {
            if (Validate())
            {
                var lm = new LoginManager();
                if (lm.RegisterNewUser(_username.Text, _password.Text, _email.Text))
                {
                    ShowToast(string.Format("Successfully Registered. Welcome, {0}", _username.Text));
                    lm.PerformLogin(_username.Text, _password.Text);
                    var intent = new Intent(Application.Context, typeof(MainActivity));
                    intent.PutExtra("username", _username.Text);
                    StartActivity(intent);
                    Finish();
                }
                else
                {
                    ShowToast("Error Creating User");
                }
            }
        }


        private void ShowToast(string message)
        {
            Toast.MakeText(Application.Context, message, ToastLength.Long).Show();
        }

        private bool Validate()
        {
            if (_username.Text.Trim() == string.Empty
                || _password.Text.Trim() == string.Empty
                || _passwordAgain.Text.Trim() == string.Empty
                || _email.Text.Trim() == string.Empty)
            {
                ShowToast("All fields required");
                return false;
            }

            if (!IsValid(_email.Text))
            {
                ShowToast("Invalid Email");
                return false;
            }

            if (_password.Text != _passwordAgain.Text)
            {
                ShowToast("Passwords Must Match");
                return false;
            }

            return true;
        }


        /// <summary>
        /// Adapted from http://stackoverflow.com/questions/5342375/c-sharp-regex-email-validation
        /// MailAddress class constructor will throw exception if invalid address given
        /// </summary>
        private bool IsValid(string emailaddress)
        {
            try
            {
                new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }


        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            switch (item.ItemId)
            {
                case Android.Resource.Id.Home:
                    Finish();
                    break;
            }

            return true;
        }
    }
}