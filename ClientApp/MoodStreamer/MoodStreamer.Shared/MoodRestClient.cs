using System;
using RestSharp;
using System.Configuration;

namespace MoodStreamer.Shared
{
	/// <summary>
	/// Mood rest client.
	/// </summary>
	internal class MoodRestClient
	{
		readonly RestClient _restClient;

		internal MoodRestClient()
		{

			_restClient = new RestClient () 
			{
				BaseUrl = ""
			};

		}

		internal bool Login(string username, string password)
		{
			var request = new RestRequest (Method.POST);

			request.AddBody (new {
				username = username,
				password = password
			});

			_restClient.Execute (request);

			return false;
		}
	}
}
