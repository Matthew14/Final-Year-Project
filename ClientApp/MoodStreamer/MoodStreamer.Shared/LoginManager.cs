using System;

namespace MoodStreamer.Shared
{
	public class LoginManager
	{
		MoodRestClient _client = MoodRestClient.Instance;
        public string Username { get; set;}
		public LoginManager ()
		{
		}


        public bool LoggedIn 
        {
            get
            { 
                return _client.CheckLoggedIn(); 
            }
        }

        public bool Logout()
        {
            return _client.Logout();
        }

		public bool PerformLogin(string username, string password)
		{

            return _client.Login(username, password);
		}

        /// <summary>
        /// Loads the last login credentials.
        /// </summary>
        /// <returns>Last user logged in or null if no user (logged out)</returns>
        public User LoadLastLoginCredentials()
        {
            //TODO
            return new User{Username="matt", Password="mattPass"};
        }
	}
}

