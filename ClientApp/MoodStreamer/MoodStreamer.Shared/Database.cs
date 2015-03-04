using System;
using System.Linq;
using SQLite;

namespace MoodStreamer.Shared
{
    public class Database
    {
        public static string Path;
        public Database()
        {
            if (Path == null)
                throw new Exception("Path is null");
        }

        public void ClearLastUser()
        {
            var sql = "DELETE FROM user";
            DoNonQuery(sql);
        }

        public void SaveLastUser(string username, string password)
        {
            ClearLastUser();
            var sql = "INSERT INTO user (username, password) VALUES ('{0}', '{1}')";

            DoNonQuery(string.Format(sql, username, password));
        }

        public User GetLastUser()
        {
            var sql = "SELECT username, password from user";

            using (var conn = new SQLiteConnection(Path))
            {
                var command = new SQLiteCommand (conn);
                command.CommandText = sql;
                var results = command.ExecuteQuery<User>();

                return results.FirstOrDefault();

            }
        }

        private void DoNonQuery(string sql)
        {
            using (var conn = new SQLiteConnection(Path))
            {
                var command = new SQLiteCommand (conn);
                command.CommandText = sql;
                command.ExecuteNonQuery();
            }
        }
    }
}

