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

        /// <summary>
        /// trys to login to the service with the given credentials
        /// </summary>
        /// <returns><c>true</c>, if login was performed, <c>false</c> otherwise.</returns>
        /// <param name="username">Username.</param>
        /// <param name="password">Password.</param>
		public bool PerformLogin(string username, string password)
		{
            return _client.Login(username, password);
		}

	    public bool RegisterNewUser(string username, string password, string email)
	    {
	        return _client.CreateUser(username, email, password);
	    }
	}
}

