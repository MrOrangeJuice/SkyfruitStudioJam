
function PlayMusic(_music) {
	with (oMusicHandler) { incoming_track = _music; }
}

function StopMusic(_instant = false) {
	with (oMusicHandler) {
		if (playing_track != NONE) {
			audio_sound_gain(playing_track, 0, _instant ? 0 : 1000);
		}
	}
}

function SetVolumes() {
	audio_group_set_gain(audiogroup_default, power(global.sndVolume, 2));
	audio_group_set_gain(audiogroup_Music, power(global.musVolume, 2));
}