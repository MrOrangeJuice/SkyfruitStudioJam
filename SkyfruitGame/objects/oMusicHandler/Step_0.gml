// Play new track
if (incoming_track != NONE and playing_track == NONE) {
	playing_track = audio_play_sound(incoming_track, 0, true);
	incoming_track = NONE;
}
// Delete stopped tracks
if (playing_track != NONE and audio_sound_get_gain(playing_track) == 0) {
	audio_stop_sound(playing_track);
	playing_track = NONE;
}