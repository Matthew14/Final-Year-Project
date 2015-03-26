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
            _cookieJar = LoginClient.GetInstance(_url).CookieJar;
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

            var response = _restClient.Execute(request);
            return response.StatusCode == HttpStatusCode.OK;
        }
    }
}
