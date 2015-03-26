﻿namespace MoodStreamer.Shared
{
    public class User
    {
        public string username { get; set; }
        public string password { get; set; }
        public string email { get; set; }

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

        public void Reanalyze()
        {
            MoodRestClient.Instance.ReanalyzeTracksForLoggedInUser();
        }
    }
}