if live_call() return live_result;

StopMusic(true);
PlayMusic(mus_MainTheme);

key_pause = 0;
key_up = 0;
key_down = 0;
key_select = 0;

sel_x = 110;
sel_tar_x = 0;
sel_y = 0;
sel_tar_y = 0;
sel_pos = 0;


main_options = [
	"Continue",
	"New Game",
	"Credits",
]
save_file_detected = file_exists(SAVE_FILE_NAME);

StateMain = function() {

	sel_tar_y = 110 + 18*sel_pos;
	sel_tar_x = 110;
	if (key_up or key_down) {
		audio_play_sound(snd_GunClick, 0, false);
		sel_pos = (sel_pos + key_down - key_up + array_length(main_options)) % array_length(main_options);
	} else if (key_select) {
		
		// No save to load
		if (sel_pos == 0 and !save_file_detected) { audio_play_sound(snd_GunEmpty, 0, false); }
		
		// Load save file
		if (sel_pos == 0 and save_file_detected) { LoadGame(); }

		// Start a new game
		if (sel_pos == 1) {
			audio_play_sound(snd_GunFire, 0, false);
		}
		
		// Go to credits
		if (sel_pos == 2) {
			audio_play_sound(snd_GunFire, 0, false);
			sel_pos = 0;
			state = StateCredits;
		}
	}
}


credits_positions = [
	[160, 24],
	[160, 80],
	[160, 136],
	[220, 172],
]
credits_names = [
	"Arkington \"Mallory\" Owen",
	"Alex \"Super Citrus\" Lastname",
	"Doty!",
]
credits_desc = [
	"A programmer/artist/musician/storyteller who has been making the same pixel-art wizard RPG for two years.",
	"Alex description",
	"Doty description",
]
credits_plug = [
	"Wizard Magic on Steam!",
	"Tower of Dreams on Steam!",
	"Doty's thing!",
]
StateCredits = function() {

	sel_tar_x = credits_positions[sel_pos][0];
	sel_tar_y = credits_positions[sel_pos][1];
	if (key_up or key_down) {
		audio_play_sound(snd_GunClick, 0, false);
		sel_pos = (sel_pos + key_down - key_up + array_length(credits_positions)) % array_length(credits_positions);
	} else if (key_select) {
		
		// Mallory's link
		if (sel_pos == 0) { url_open("https://store.steampowered.com/app/3896170/Wizard_Magic/"); }
		
		// Citrus' link
		if (sel_pos == 1) { url_open("https://store.steampowered.com/app/2597470/Tower_of_Dreams/"); }

		// Doty's link...?
		if (sel_pos == 2) {	audio_play_sound(snd_GunFire, 0, false); }
		
		// Back
		if (sel_pos == 3) {
			audio_play_sound(snd_GunFire, 0, false);
			sel_pos = 2;
			state = StateMain;
		}
	}
}




state = StateMain;