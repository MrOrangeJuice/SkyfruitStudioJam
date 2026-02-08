depth = BACKGROUND_DEPTH;
x = 0;
y = -400;
image_alpha = 0.8;

acc_y = 0.5;
vel_y = 1;
bounce_factor = 0.4;
tot_bounces = 3;
n_bounces = 0;

switch (global.storyBeat) {
	
	
	case CHAPTER.ONE_INTRO:
		sprite_index = sBackgroundOutside;
		PlayMusic(mus_MainTheme);
		break;

	case CHAPTER.TWO_CONVO:
		sprite_index = sBackgroundIsla;
		PlayMusic(mus_Dating);
		break;
	
	case CHAPTER.THREE_CONVO:
		sprite_index = sBackgroundClyde;
		PlayMusic(mus_Dating);
		break;
	
	case CHAPTER.FOUR_CONVO:
		sprite_index = sBackgroundAlloy;
		PlayMusic(mus_Dating);
		break;

	case CHAPTER.FINAL_CONVO:
		sprite_index = sBackgroundOutside;
		PlayMusic(mus_MainTheme);
		break;


}