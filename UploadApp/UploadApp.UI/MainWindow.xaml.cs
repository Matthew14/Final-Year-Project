using System;
using System.Windows;
using System.Windows.Forms;
using Microsoft.Win32;
using UploadApp.UI.ViewModels;
using UploadApp.Uploader;

namespace UploadApp.UI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        readonly MainViewModel _viewModel = new MainViewModel();
        public MainWindow()
        {
            InitializeComponent();
            DataContext = _viewModel;
        }

        private void BrowseButtonClick(object sender, RoutedEventArgs e)
        {
            var dialog = new FolderBrowserDialog();
            if (dialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                _viewModel.Folders.Add(dialog.SelectedPath);
        }
    }
}
