namespace MoodStreamer.Shared
{
    public class TrackStats
    {
        public int TrackCount { get ; set; }
        public int TracksAnalysed { get; set; }
    }

    public class User
    {
        public string username { get; set; }
        public string password { get; set; }

        public User()
        {
            
        }

        public User(string username)
        {
            username = username;
        }

        public TrackStats GetStats()
        {
            return MoodRestClient.Instance.GetStatisticsForLoggedInUser();
        }
    }
}