using System.Configuration;
using RestSharp;

namespace UploadApp.Uploader
{
    public class UploadClient
    {
        private string _url;
        private RestClient _restClient;

        public UploadClient()
        {
            _url = ConfigurationManager.AppSettings.Get("serviceUrl");
            _restClient = new RestClient(_url);   
        }

        public UploadClient(string baseUrl)
        {
            _restClient = new RestClient(baseUrl);
        }

        public bool UploadFile(string filepath)
        {
            var request = new RestRequest(Method.POST)
            {
                Resource = "upload"
            };

            request.AddFile("file", filepath);

            _restClient.Execute(request);
            return true;
        }
    }
}
