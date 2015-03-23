using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Threading;
using log4net;

namespace UploadApp.Uploader
{
    public class FolderWatcher
    {
        private static ILog Logger = LogManager.GetLogger(typeof (FolderWatcher));

        public List<string> Folders { get; private set; }
        readonly Database _db = new Database();

        private string _username = "";

        private readonly object _lock = new object();

        private Thread _watcherThread;

        public FolderWatcher(string username)
        {

            _username = username;
            log4net.Config.XmlConfigurator.Configure();
            Logger.DebugFormat("Url: {0}", ConfigurationManager.AppSettings.Get("serviceUrl"));
            
            Folders = new List<string>(LoadFoldersFromDb());

            StartWatcherThread();
        }

        private void StartWatcherThread()
        {
            _watcherThread = new Thread(WatchFolders)
            {
                IsBackground = true,
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

            StartWatcherThread();
            
        }

        private void WatchFolders()
        {
            var client = new UploadClient();

            for (;;)
            {
                lock (_lock)
                {

                    Dictionary<string, Track> tracksUploaded = _db.LoadTracks(_username);

                    foreach (var folder in Folders)
                    {
                        if (!Directory.Exists(folder))
                        {
                            Logger.ErrorFormat("Directory {0} does not exist", folder);
                            continue;
                        }
                        
                        var files = Directory.GetFiles(folder, "*.mp3", SearchOption.AllDirectories);

                        foreach (var f in files)
                        {
                            var hash = GetHashOfFile(f);
                            Track track;
                            if (!tracksUploaded.TryGetValue(hash, out track))
                            {
                                client.UploadFile(f);
                                track = new Track
                                {
                                    Title = "test",
                                    Artist = "test",
                                    Sha256Hash = hash
                                };
                                _db.AddTrack(track, _username);
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
            SHA256 sha256 = SHA256.Create();

            using (var fs = new FileStream(path, FileMode.Open))
            {
                byte[] hashValue = sha256.ComputeHash(fs);
                string hashAsString = BitConverter.ToString(hashValue);
                return hashAsString;
            }
        }

        public void UpdateUsername(string username)
        {
            if (_watcherThread != null && _watcherThread.IsAlive)
                _watcherThread.Abort();
            _username = username;
            StartWatcherThread();
        }
    }
}
