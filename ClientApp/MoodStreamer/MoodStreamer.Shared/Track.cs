using System;

namespace MoodStreamer.Shared
{
	/// <summary>
	/// Represents a track as recieved from the server
	/// </summary>
	public class Track
	{
		public string URL { get; set; }

		public string ImageURL { get; set; }

		public string Artist { get; set; }

		public string Title { get; set; }

		public Track ()
		{

		}
	}
}

