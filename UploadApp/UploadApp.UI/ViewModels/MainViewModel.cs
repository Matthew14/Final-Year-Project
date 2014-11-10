using System;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using UploadApp.UI.Annotations;
using UploadApp.Uploader;

namespace UploadApp.UI.ViewModels
{
    class MainViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private FolderWatcher _folderWatcher;

        private string _selectedFolder;

        public string SelectedFolder
        {
            get { return _selectedFolder; }
            set
            {
                _selectedFolder = value;
                OnPropertyChanged("SelectedFolder");
            }
        }

        public ICommand RemoveSelectedFolder { get; private set; }
        
        public ObservableCollection<string> Folders { get; set; }

        public MainViewModel()
        {
            _folderWatcher = new FolderWatcher();
            Folders = new ObservableCollection<string>(_folderWatcher.Folders);
            Folders.CollectionChanged += Folders_CollectionChanged;

            RemoveSelectedFolder = new RelayCommand(o =>
            {
                var selected = SelectedFolder;
                SelectedFolder = Folders.FirstOrDefault();
                if (selected != null)
                {
                    Folders.Remove(selected);
                    _folderWatcher.UpdateWatchedFolders(Folders.ToList());
                }
            });

        }

        void Folders_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            _folderWatcher.UpdateWatchedFolders(Folders.ToList());
        }        

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
