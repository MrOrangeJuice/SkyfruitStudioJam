// Play new track
if (global.audio_ready and incoming_track != NONE and playing_track == NONE and audio_group_is_loaded(audiogroup_Music)) {
	playing_track = audio_play_sound(incoming_track, 0, true);
	incoming_track = NONE;
}
// Delete stopped tracks
if (playing_track != NONE and audio_sound_get_gain(playing_track) == 0) {
	audio_stop_sound(playing_track);
	playing_track = NONE;
}