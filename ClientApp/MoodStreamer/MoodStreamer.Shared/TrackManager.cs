using System;

namespace MoodStreamer.Shared
{
    public enum DisagreeType
    {
        MorePositive, LessPositive, MoreExcited, LessExcited
    }

    public class TrackManager
    {
        private MoodRestClient _client = MoodRestClient.Instance;

        public TrackManager()
        {
        }

        public bool Disagree(DisagreeType dt, Track track)
        {
            return _client.Disagree(dt, track);
        }

        public Track GetTrackByExcitednessAndPositivity(float ex, float pos)
        {
            return _client.GetTrackByExcitednessAndPositivity(ex, pos);
        }
    }
}

