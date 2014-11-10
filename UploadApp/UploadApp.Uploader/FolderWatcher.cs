using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Threading;

namespace UploadApp.Uploader
{

    public class FolderWatcher
    {
        public List<string> Folders { get; private set; }
        private UploadClient _uploader;
        readonly Database _db = new Database();

        private readonly object _lock = new object();

        private Thread _watcherThread;

        public FolderWatcher()
        {
            Console.WriteLine(ConfigurationManager.AppSettings.Get("serviceUrl"));
            Folders = new List<string>(LoadFoldersFromDb());
            _uploader = new UploadClient();

            _watcherThread = new Thread(WatchFolders)
            {
                IsBackground   = true,
                Name = "Folder Watcher"
            };

            _watcherThread.Start();
        }

        private IEnumerable<string> LoadFoldersFromDb()
        {
            lock(_lock)
                return _db.LoadFolders();
        }

        public void UpdateWatchedFolders(List<string> newFolderList)
        {
            _watcherThread.Abort();

            foreach (var folder in newFolderList.Where(f => !Folders.Contains(f)).ToList())
            {
                lock (_lock)
                {
                    Folders.Add(folder);

                    _db.AddFolder(folder);
                }
            }
        
            foreach (var folder in Folders.Where(f => !newFolderList.Contains(f)).ToList())
            {
                lock (_lock)
                {
                    Folders.Remove(folder);
                    _db.RemoveFolder(folder);
                }
            }

            _watcherThread = new Thread(WatchFolders)
            {
                IsBackground = true,
                Name = "Folder Watcher"
            };

            _watcherThread.Start();
            
        }

        private void WatchFolders()
        {
            var client = new UploadClient();

            for (;;)
            {
                lock (_lock)
                {

                    Dictionary<string, Track> tracksUploaded = _db.LoadTracks();

                    foreach (var folder in Folders)
                    {
                        var files = Directory.GetFiles(folder, "*.mp3", SearchOption.AllDirectories);

                        foreach (var f in files)
                        {
                            var hash = GetHashOfFile(f);
                            Track track;
                            if (!tracksUploaded.TryGetValue(hash, out track))
                            {
                                client.UploadFile(f);
                                track = new Track()
                                {
                                    Title = "test",
                                    Artist = "test",
                                    Sha256Hash = hash
                                };
                                _db.AddTrack(track);
                                tracksUploaded[hash] = track;
                            }
                        }
                    }
                }

                Thread.Sleep(5000);
            }
        }

        private string GetHashOfFile(string path)
        {
            SHA256 sha256 = SHA256Managed.Create();

            using (var fs = new FileStream(path, FileMode.Open))
            {
                byte[] hashValue = sha256.ComputeHash(fs);
                string hashAsString = BitConverter.ToString(hashValue);
                return hashAsString;
            }
        }
    }
}
