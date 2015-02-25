using System;
using System.Windows;
using System.Windows.Forms;
using log4net;
using log4net.Config;
using UploadApp.UI.ViewModels;

namespace UploadApp.UI.Views
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>

    public partial class MainWindow : Window
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(MainWindow));

        private readonly MainViewModel _viewModel;
        
        protected override void OnStateChanged(EventArgs e)
        {
            if (WindowState == WindowState.Minimized)
                Hide();

            base.OnStateChanged(e);
        }

        public MainWindow()
        {

            InitializeComponent();

            var ni = new NotifyIcon {Icon = new System.Drawing.Icon("images\\music.ico"), Visible = true};
            ni.DoubleClick += (s, e) =>
            {
                Show();
                WindowState = WindowState.Normal;
            };


            XmlConfigurator.Configure(); 
            Log.DebugFormat("Starting..");

            _viewModel = new MainViewModel();
            DataContext = _viewModel;
        }

        private void BrowseButtonClick(object sender, RoutedEventArgs e)
        {
            var dialog = new FolderBrowserDialog();
            if (dialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                _viewModel.Folders.Add(dialog.SelectedPath);
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            var sw = new SettingsWindow();
            sw.Show();   
        }
    }
}
