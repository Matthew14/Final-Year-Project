using System.Configuration;
using System.Windows;
using System.Windows.Controls;

namespace UploadApp.UI.Views
{
    /// <summary>
    /// Interaction logic for SettingsWindow.xaml
    /// </summary>
    public partial class SettingsWindow : Window
    {
        private string _apiUrl = ConfigurationManager.AppSettings.Get("serviceUrl");

        public SettingsWindow()
        {
            InitializeComponent();

            var username = UploadClientSettings.Default.Username;
            var password = UploadClientSettings.Default.Password;

            if (username != null)
                UsernameTextBox.Text = username;
            if (password != null)
                PasswordTextBox.Password = password;

        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            if(((Button)sender).Name == "cancel")
                Close();

            string username = UsernameTextBox.Text.Trim();
            string password = PasswordTextBox.Password.Trim();

            if (Uploader.LoginClient.GetInstance(_apiUrl).Login(username, password))
            {
                if (ViewModels.MainViewModel.Username != username) 
                    ViewModels.MainViewModel.Username = username;

                UploadClientSettings.Default.Username = username;
                UploadClientSettings.Default.Password = password;
                UploadClientSettings.Default.Save();

                Close();
            }
            else
            {
                MessageBox.Show("Incorrect Login");
            }
        }

    }
}
