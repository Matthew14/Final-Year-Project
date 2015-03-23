using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.IO;
using log4net;

namespace UploadApp.Uploader
{
    class Database
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof (Database));
        private readonly SQLiteConnection _conn;
        
        public Database()
        {
            string db = GetDatabaseLocation();
            var connectionString = String.Format("Data Source={0};Version=3", db);
            
            Logger.InfoFormat("Using Connection String: {0}", connectionString);

            _conn = new SQLiteConnection(connectionString);
        }

        public IEnumerable<string> LoadFolders()
        {
            const string sql = "SELECT * FROM folders;";
            var folders = new List<string>();
            
            _conn.Open();
            var cmd = _conn.CreateCommand();
            cmd.CommandText = sql;
            SQLiteDataReader reader = cmd.ExecuteReader();
                
            while (reader.Read())
                folders.Add(reader["path"] as string);

            _conn.Close();
            
            return folders;
        }

        public Dictionary<string, Track> LoadTracks(string username)
        {
            var tracks = new Dictionary<string, Track>();

            string sql = string.Format("SELECT * FROM tracks where username=\"{0}\";", username);
            _conn.Open();
            var cmd = _conn.CreateCommand();
            cmd.CommandText = sql;
            SQLiteDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var hash = (string) reader["sha256Hash"];

                tracks.Add(hash, new Track
                {
                    Sha256Hash = hash
                });
            }
            _conn.Close();

            return tracks;
        }

        public void AddTrack(Track track, string username)
        {
            var sql = string.Format("insert into tracks values(\"{0}\", \"{1}\")", username, track.Sha256Hash);
            DoNonQuery(sql);
        }

        public void AddFolder(string folder)
        {
            var sql = string.Format("insert into folders (path) values (\"{0}\")", folder);
            DoNonQuery(sql);
        }

        public void RemoveFolder(string folder)
        {
            var sql = string.Format("DELETE FROM folders WHERE path LIKE \"{0}\"", folder);
            DoNonQuery(sql);
        }

        private void DoNonQuery(string sql)
        {
            _conn.Open();
            var cmd = _conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            
            _conn.Close();   
        }

        private string GetDatabaseLocation()
        {
            var appDataFolder = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
            return  Path.Combine(appDataFolder, "UploadApp", "tracks.db");
        }
    }
}
