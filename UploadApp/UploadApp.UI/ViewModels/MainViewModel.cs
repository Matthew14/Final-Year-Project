using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using UploadApp.UI.Annotations;
using UploadApp.Uploader;

namespace UploadApp.UI.ViewModels
{
    class MainViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private FolderWatcher _folderWatcher;

        public ObservableCollection<string> Folders { get; set; }

        public MainViewModel()
        {
            _folderWatcher = new FolderWatcher();
            Folders = new ObservableCollection<string>(_folderWatcher.Folders);
            Folders.CollectionChanged += Folders_CollectionChanged;
        
        }

        void Folders_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == NotifyCollectionChangedAction.Add)
            {
                
            }
        }        

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
