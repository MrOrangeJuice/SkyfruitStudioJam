if live_call() return live_result;

frame++;
text_pause_timer--;
text_pause_voice_timer--;


// Skip text (do this before playing audio)
if (keyboard_check_pressed(vk_space)) {
	char_count = text_length;
}

// Instant text
if (instant_text) { char_count = text_length; }

// Count up characters, leaving time for spaces
var _prev_char_count = char_count;
if ((char_count < text_length) && (text_pause_timer <= 0)) {
	char_count = min(char_count + text_speed, text_length);
	var _check_char = string_char_at(text, ceil(char_count));

	// Play sound on a delay (don't play for spaces!)
	if (
		(text_pause_voice_timer <= 0) and
		(voice != NONE) and
		(string_pos(_check_char, ", -'\"") == 0) and
		(char_count <= text_length) and
		(_prev_char_count == 0 or ceil(char_count) > ceil(_prev_char_count)) // This ensures we have, in fact, rendered a new letter this step
	) {
		// Play a random voice clip, alter pitch as specified
		audio_play_sound(voice, 0, false);
		text_pause_voice_timer = text_pause_voice_length;
	}
	if (string_pos(_check_char, ".,!?") != 0) { text_pause_timer = text_pause_length; }
}

