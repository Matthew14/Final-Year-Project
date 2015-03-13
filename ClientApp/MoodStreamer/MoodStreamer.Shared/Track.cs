namespace MoodStreamer.Shared
{
	/// <summary>
	/// Represents a track as recieved from the server
	/// </summary>
	public class Track
	{
		public string FilePath { get; set; }

		public string AlbumArt { get; set; }

		public string Artist { get; set; }

		public string Title { get; set; }

	    public int Duration { get; set; }

		public Track ()
		{

		}
	}
}

