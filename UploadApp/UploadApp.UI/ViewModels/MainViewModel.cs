using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using log4net;
using UploadApp.UI.Annotations;
using UploadApp.Uploader;

namespace UploadApp.UI.ViewModels
{
    class MainViewModel : INotifyPropertyChanged
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof (MainViewModel));

        private static string _username;

        public static string Username
        {
            get{return _username;}
            set
            {
                _username = value;
                if (_folderWatcher != null)
                {
                    _folderWatcher.UpdateUsername(_username);
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private static FolderWatcher _folderWatcher;

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
            Username = LoadLastUsername();


            _folderWatcher = new FolderWatcher(_username);
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

        string LoadLastUsername()
        {
            return "matt";
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
