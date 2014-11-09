using System.Windows;
using UploadApp.Uploader;

namespace UploadApp.UI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private FolderWatcher _watcher;
        public MainWindow()
        {
            InitializeComponent();
            _watcher = new FolderWatcher();
        }
    }
}
