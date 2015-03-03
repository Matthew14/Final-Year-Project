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
        private NotifyIcon _notifyIcon;

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

            SetupTrayIcon();
            Closing += MainWindow_Closing;

            XmlConfigurator.Configure(); 
            Log.DebugFormat("Starting..");

            _viewModel = new MainViewModel();
            DataContext = _viewModel;
        }

        private void SetupTrayIcon()
        {
            _notifyIcon = new NotifyIcon { Icon = new System.Drawing.Icon("images\\music.ico"), Visible = true };
            
            _notifyIcon.DoubleClick += (s, e) =>
            {
                Show();
                WindowState = WindowState.Normal;
            };
            
            var maximize = new MenuItem("Show/Hide");
            maximize.Click += (s, e) =>
            {
                Show();
                WindowState = WindowState == WindowState.Minimized ? WindowState.Normal : WindowState.Minimized;
            };
            var quit = new MenuItem("Quit");
            quit.Click += (s, o) => Close();

            var contextMenu = new ContextMenu();
            contextMenu.MenuItems.Add(maximize);            
            contextMenu.MenuItems.Add(quit);
            _notifyIcon.ContextMenu = contextMenu;
        }

        void MainWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            _notifyIcon.Dispose();
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
