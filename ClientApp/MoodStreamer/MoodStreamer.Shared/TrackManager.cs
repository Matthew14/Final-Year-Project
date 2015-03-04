using System;

namespace MoodStreamer.Shared
{
    public class TrackManager
    {
        private MoodRestClient _client = MoodRestClient.Instance;

        public TrackManager()
        {
        }

        public Track GetTrackByExcitednessAndPositivity(float ex, float pos)
        {
            return _client.GetTrackByExcitednessAndPositivity(ex, pos);
        }
    }
}

