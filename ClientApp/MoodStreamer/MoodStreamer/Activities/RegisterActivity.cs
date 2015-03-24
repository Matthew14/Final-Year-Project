using System;
using System.Text.RegularExpressions;
using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using Android.Widget;

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
                ShowToast(string.Format("Successfully Registered. Welcome, {0}", _username.Text));   
            }
        }


        private void ShowToast(string message)
        {
            Toast.MakeText(Application.Context, message, ToastLength.Long).Show();
        }

        private bool Validate()
        {
            //This regex stolen from: http://blog.trojanhunter.com/2012/09/26/the-best-regex-to-validate-an-email-address/
            const string emailPattern = @"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/";

            if (_username.Text.Trim() == string.Empty
                || _password.Text.Trim() == string.Empty
                || _passwordAgain.Text.Trim() == string.Empty
                || _email.Text.Trim() == string.Empty)
            {
                ShowToast("All fields required");
                return false;
            }

            if (!Regex.IsMatch(_email.Text, emailPattern))
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