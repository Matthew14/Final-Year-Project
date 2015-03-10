using Android.App;
using Android.Preferences;
using Android.OS;

namespace MoodStreamer
{
    [Activity(Label = "Settings", Icon = "@drawable/icon", Theme = "@style/AppTheme")]			
    public class SettingsActivity : PreferenceActivity
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            AddPreferencesFromResource(Resource.Xml.Preference);
        }   
    }
}