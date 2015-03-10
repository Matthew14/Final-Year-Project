using System;
using System.Collections.Generic;
using System.Net;
using RestSharp;
using RestSharp.Deserializers;

namespace MoodStreamer.Shared
{
    /// <summary>
    ///     Mood rest client.
    /// </summary>
    internal class MoodRestClient
    {
        private static MoodRestClient _instance;
        private readonly CookieContainer _cookieContainer;
        private readonly RestClient _restClient;

        private MoodRestClient()
        {
            _cookieContainer = new CookieContainer();
            _restClient = new RestClient
            {
                //BaseUrl = "http://192.168.1.19:5050/api",
                BaseUrl = "http://fyp.matthewoneill.com/api",
                CookieContainer = _cookieContainer
            };
        }

        internal static MoodRestClient Instance
        {
            get { return _instance ?? (_instance = new MoodRestClient()); }
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

            request.AddBody(new {username, password});

            var response = _restClient.Execute(request);
            return response.StatusCode == HttpStatusCode.OK;
        }

        internal bool Logout()
        {
            var request = new RestRequest(Method.GET) {Resource = "logout"};
            var response = _restClient.Execute(request);

            return response.StatusCode == HttpStatusCode.OK;
        }

        internal TrackStats GetStatisticsForLoggedInUser()
        {
            var request = new RestRequest(Method.GET) {Resource = "statistics"};
            var response = _restClient.Execute<TrackStats>(request);

            return response.Data;
        }

        internal Track GetTrackByExcitednessAndPositivity(float ex, float pos)
        {
            var request = new RestRequest(Method.GET)
            {
                Resource = String.Format("track/{0}/{1}", ex, pos)
            };

            var response = _restClient.Execute<Track>(request);

            return response.Data;
        }

        public bool ReanalyzeTracksForLoggedInUser()
        {
            var request = new RestRequest(Method.GET) {Resource = "reanalyze"};
            var response = _restClient.Execute(request);

            return response.StatusCode == HttpStatusCode.OK;
        }
    }
}