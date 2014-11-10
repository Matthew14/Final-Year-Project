using System.Collections.Generic;
using System.Data.SQLite;

namespace UploadApp.Uploader
{
    class Database
    {
        private SQLiteConnection _conn;
        public Database()
        {
            _conn = new SQLiteConnection(@"Data Source=..\..\..\tracks.db;Version=3;");
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

        public Dictionary<string, Track> LoadTracks()
        {
            var tracks = new Dictionary<string, Track>();

            const string sql = "SELECT * FROM tracks;";
            _conn.Open();
            var cmd = _conn.CreateCommand();
            cmd.CommandText = sql;
            SQLiteDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var hash = (string) reader["sha256Hash"];

                tracks.Add(hash, new Track
                {
                    Artist = reader["artist"] as string,
                    Sha256Hash = hash,
                    Title = reader["title"] as string
                });
            }
            _conn.Close();

            return tracks;
        }

        public void AddTrack(Track track)
        {
            var sql = string.Format("insert into tracks values(\"{0}\", \"{1}\", \"{2}\")", track.Title, track.Artist, track.Sha256Hash);
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
    }
}
