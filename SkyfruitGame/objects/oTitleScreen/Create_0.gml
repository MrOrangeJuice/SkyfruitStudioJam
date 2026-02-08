StopMusic(true);
PlayMusic(mus_MainTheme);

key_pause = 0;
key_up = 0;
key_down = 0;
key_select = 0;

analogUpPrev = false;
analogDownPrev = false;
analogUpPrevD = false;
analogDownPrevD = false;

sel_x = 110;
sel_tar_x = 0;
sel_y = 0;
sel_tar_y = 0;
sel_pos = 0;

buffer_timer = 0;
buffer_frames = 5;


main_options = [
	"Continue",
	"New Game",
	"Credits",
	"Options",
]
save_file_detected = file_exists(SAVE_FILE_NAME);

StateMain = function() {

	sel_tar_x = 110;
	sel_tar_y = 112 + 18*sel_pos;
	if (key_up or key_down) {
		audio_play_sound(snd_GunClick, 0, false);
		sel_pos = (sel_pos + key_down - key_up + array_length(main_options)) % array_length(main_options);
	} else if (key_select) {
		
		// No save to load
		if (sel_pos == 0 and !save_file_detected) { audio_play_sound(snd_GunEmpty, 0, false); }
		
		// Load save file
		if (sel_pos == 0 and save_file_detected) {
			var _worked = LoadGame();
			if (_worked == 0) {
				audio_play_sound(snd_GunFire, 0, false);
				StopMusic();
				NextScene();
			} else {
				audio_play_sound(snd_GunEmpty, 0, false);
			}
		}

		// Start a new game
		if (sel_pos == 1) {
			global.storyBeat = CHAPTER.NOTHING;
			global.giftCount = 0;
			global.upgradesList = [];
			audio_play_sound(snd_GunFire, 0, false);
			StopMusic();
			NextScene();
		}
		
		// Go to credits
		if (sel_pos == 2) {
			audio_play_sound(snd_GunFire, 0, false);
			sel_pos = 0;
			state = StateCredits;
		}
		
		// Open pause menu
		if (sel_pos == 3) {
			audio_play_sound(snd_PauseIn, 0, false);
			buffer_timer = buffer_frames;
			global.paused = true;
		}
	}
}


credits_positions = [
	[160, 24],
	[160, 80],
	[160, 136],
	[232, 172],
]
credits_names = [
	"Arkington \"Mallory\" Owen",
	"Alex \"Super Citrus\" Parrotto",
	"Doty!",
]
credits_desc = [
	"A programmer/artist/musician/storyteller who has been making the same pixel-art wizard RPG for two years.",
	"The Lead Designer of Sour Lemon Studios, a neat little indie game company working on Tower of Dreams and other cool platformers!",
	"An \"amateur\" pixel artist? Doty I'm not writing that, just LOOK at the portraits and backgrounds you made gosh-darnit!!!",
]
credits_plug = [
	"Wizard Magic on Steam!",
	"Tower of Dreams on Steam!",
	"Doty's Twitter!",
]
StateCredits = function() {

	sel_tar_x = credits_positions[sel_pos][0];
	sel_tar_y = credits_positions[sel_pos][1];
	if (key_up or key_down) {
		audio_play_sound(snd_GunClick, 0, false);
		sel_pos = (sel_pos + key_down - key_up + array_length(credits_positions)) % array_length(credits_positions);
	} else if (key_select) {
		audio_play_sound(snd_GunFire, 0, false);
		
		// Mallory's link
		if (sel_pos == 0) { url_open("https://store.steampowered.com/app/3896170/Wizard_Magic/"); }
		
		// Citrus' link
		if (sel_pos == 1) { url_open("https://store.steampowered.com/app/2597470/Tower_of_Dreams/"); }

		// Doty's link...?
		if (sel_pos == 2) {	url_open("https://x.com/DustyKether"); }
		
		// Back
		if (sel_pos == 3) {
			sel_pos = 2;
			state = StateMain;
		}
	}
}

alarm[0] = room_speed * 0.0833333;
currentFrame = 0;


state = StateMain;