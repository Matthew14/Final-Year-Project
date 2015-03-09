using System;
using System.IO;

using Android.App;

namespace MoodStreamer
{
    public static class Utils
    {
        /// <summary>
        /// Loads the database into its storage loction if it is not there already
        /// </summary>
        /// <returns>The path to the storage location of the database</returns>
        public static string LoadDatabaseIntoStorage(Activity activity)
        {
            const string dbName = "MoodStreamer.db";
            string dbPath = Path.Combine (Android.OS.Environment.ExternalStorageDirectory.ToString(), dbName);

            if (!File.Exists(dbPath))
            {
                using (var br = new BinaryReader(activity.Assets.Open(dbName)))
                {
                    using (var bw = new BinaryWriter(new FileStream(dbPath, FileMode.Create)))
                    {
                        var buffer = new byte[2048];
                        int len = 0;
                        while ((len = br.Read(buffer, 0, buffer.Length)) > 0)
                            bw.Write (buffer, 0, len);
                    }
                }
            }

            return dbPath;
        }
    }
}

