using System.IO;
using NUnit.Framework;

namespace UploadApp.Uploader.Tests
{
 
    [TestFixture]  
    public class UploadTests
    {
        private const string TestMusicFolder = @"..\..\..\Music";
        private const string ServiceUrl = "http://127.0.0.1:5000";
        [TestCase]
        public void TestFileUpload()
        {
            var fileToUpload = Path.Combine(TestMusicFolder, 
                "Max Richter", 
                "2003 - Memoryhouse", 
                "01. Europe, After The Rain.mp3");

            var uploader = new UploadClient(ServiceUrl);
            uploader.UploadFile(fileToUpload);
        }

    }
}
