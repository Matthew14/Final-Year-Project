namespace MoodStreamer.Shared
{
    public class User
    {
        public string username { get; set; }
        public string password { get; set; }

        public User()
        {
            
        }

        public User(string username)
        {
            this.username = username;
        }

        public TrackStats GetStats()
        {
            return MoodRestClient.Instance.GetStatisticsForLoggedInUser();
        }
    }
}