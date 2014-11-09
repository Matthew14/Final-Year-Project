using System;
using System.Collections.Generic;
using System.Configuration;

namespace UploadApp.Uploader
{

    public class FolderWatcher
    {
        public List<string> Folders { get; private set; }

        public FolderWatcher()
        {
            Console.WriteLine(ConfigurationManager.AppSettings.Get("serviceUrl"));
            Folders = new List<string>();
        }
    }
}
