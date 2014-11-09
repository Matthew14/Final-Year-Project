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
    }
}
