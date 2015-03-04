using System;

namespace MoodStreamer.Shared
{
	public class LoginManager
	{
		MoodRestClient _client = MoodRestClient.Instance;

        Database _database = new Database();


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
            return _database.GetLastUser();
        }

        public void ClearLastLoginCredentials()
        {
            _database.ClearLastUser();
        }

        public void SaveLastLogin(string username, string password)
        {
            _database.SaveLastUser(username, password);
        }
	}
}

