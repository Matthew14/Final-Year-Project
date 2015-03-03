using System;
using RestSharp;
using System.Configuration;
using RestSharp.Deserializers;
using System.Collections.Generic;
using System.Net;


namespace MoodStreamer.Shared
{
	/// <summary>
	/// Mood rest client.
	/// </summary>
	internal class MoodRestClient
	{
		readonly RestClient _restClient;
        CookieContainer _cookieContainer;

        private static MoodRestClient _instance;
        internal static MoodRestClient Instance 
        {
            get
            {
                return _instance ?? (_instance = new MoodRestClient());
            }
        }


		private MoodRestClient()
		{
             _cookieContainer = new CookieContainer();
			_restClient = new RestClient () 
			{
                //BaseUrl = "http://localhost:5050/api",
                BaseUrl = "http://fyp.matthewoneill.com/api",        
                CookieContainer = _cookieContainer
			};
		}

        internal bool CheckLoggedIn()
        {
            var request = new RestRequest(Method.GET)
            {
                Resource = "loggedin"
            };

            var response = _restClient.Execute(request);
            var deserializer = new JsonDeserializer();
            var responseDict = deserializer.Deserialize<Dictionary<string, bool>>(response);
            return responseDict["logged_in"];
        }

		internal bool Login(string username, string password)
		{
            var request = new RestRequest(Method.POST)
            {
                RequestFormat = DataFormat.Json,
                Resource = "login"
            };

            request.AddBody(new {username = username, password = password});

			var response = _restClient.Execute (request);
			return response.StatusCode == HttpStatusCode.OK;
		}

        internal bool Logout()
        {
            var request = new RestRequest(Method.GET){ Resource = "logout" };
            var response = _restClient.Execute(request);

            return response.StatusCode == HttpStatusCode.OK;
        }
	}
}
