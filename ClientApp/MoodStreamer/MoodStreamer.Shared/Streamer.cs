using RestSharp;


namespace MoodStreamer.Shared
{
 
    public class Streamer
    {
        private RestClient _client;

        public Streamer()
        {
            _client = new RestClient();
        }
    }
}
