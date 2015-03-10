class UserDetails(object):
    def __init__(self, username, track_count, tracks_analysed, analysis_in_progress=False):
        self.username = username
        self.track_count = track_count
        self.tracks_analysed = tracks_analysed
        self.analysis_in_progress = analysis_in_progress
