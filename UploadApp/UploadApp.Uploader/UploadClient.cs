using System.Configuration;
using System.Net;
using RestSharp;

namespace UploadApp.Uploader
{
    public class UploadClient
    {
        private string _url;
        private RestClient _restClient;
        private CookieContainer _cookieJar;

        public UploadClient()
        {
            _url = ConfigurationManager.AppSettings.Get("serviceUrl");
            _cookieJar = new CookieContainer();
            _restClient = new RestClient(_url){CookieContainer = _cookieJar};   
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
