using System;
using RestSharp;
using System.Configuration;
using RestSharp.Deserializers;
using System.Collections.Generic;


namespace MoodStreamer.Shared
{
	/// <summary>
	/// Mood rest client.
	/// </summary>
	public class MoodRestClient
	{
		readonly RestClient _restClient;

		public MoodRestClient()
		{

			_restClient = new RestClient () 
			{
                BaseUrl = "http://fyp.matthewoneill.com/api"
                    
                //BaseUrl = "http://localhost:5050/api"
			};

		}

        public bool CheckLoggedIn()
        {
            var request = new RestRequest(Method.GET)
            {
                Resource = "loggedin"
            };

            var response = _restClient.Execute(request);
            var deserializer = new JsonDeserializer();
            var d = deserializer.Deserialize<Dictionary<string, bool>>(response);

            return d["logged_in"];
        }

		public bool Login(string username, string password)
		{
            var request = new RestRequest(Method.POST)
            {
                RequestFormat = DataFormat.Json
            };

            request.AddBody(new {username = username, password = password});

			_restClient.Execute (request);

			return false;
		}

        public bool Logout()
        {
            var request = new RestRequest(Method.GET){ Resource = "logout" };
            var response = _restClient.Execute(request);

            return response.StatusCode == System.Net.HttpStatusCode.OK;
        }
	}
}
