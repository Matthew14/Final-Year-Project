using System.IO;
using NUnit.Framework;

namespace UploadApp.Uploader.Tests
{
 
    [TestFixture]  
    public class UploadTests
    {
        private const string TestMusicFolder = @"..\..\..\Music";
        private  string ServiceUrl = "http://127.0.0.1:5000";
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

        [TestCase(@"D:\Music\Low\Low- I Could Live In Hope\06 Lullaby.mp3")]
        [TestCase(@"D:\Music\Radiohead\Ok Computer\Radiohead - No Surprises.mp3")]
        [TestCase(@"D:\Music\Katrina & The Waves - Walking on sunshine (Greatest hits)\01. Walking on sunshine.mp3")]
        public void UploadAFile(string filePath)
        {
            ServiceUrl = "http://fyp.matthewoneill.com";
            var uploader = new UploadClient(ServiceUrl);
            uploader.UploadFile(filePath);
        }

    }
}
