using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.Media;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace MoodStreamer
{

    [Service]
    public class StreamingBackgroundService : Service
    {
        //private MediaPlayer _player;
        public override IBinder OnBind(Intent intent)
        {
            throw new NotImplementedException();
        }
    }
}