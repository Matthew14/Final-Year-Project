using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using RestSharp;

namespace UploadApp.Uploader
{
    
    /// <summary>
    /// Singleton class with methods for authenticating with the service
    /// </summary>
    public class LoginClient
    {
        private static LoginClient _instance;
        private readonly RestClient _restClient;
        private readonly CookieContainer _cookieJar;
        public CookieContainer CookieJar { get { return _cookieJar; } }

        public static LoginClient GetInstance(string url)
        {
            return _instance ?? (_instance = new LoginClient(url));
        }

        private LoginClient(string serviceUrl)
        {
            _cookieJar = new CookieContainer();
            _restClient = new RestClient(serviceUrl){CookieContainer = _cookieJar};
        }

        public bool Login(string username, string password)
        {
            var request = new RestRequest(Method.POST) { Resource = "api/login", RequestFormat = DataFormat.Json };
            request.AddBody(new { username, password });
            var response = _restClient.Execute(request);

            return response.StatusCode == HttpStatusCode.OK;
        }
    }
}
