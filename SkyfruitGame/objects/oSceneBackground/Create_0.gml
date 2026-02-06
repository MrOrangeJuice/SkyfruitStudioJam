if live_call() return live_result;
depth = BACKGROUND_DEPTH;
x = 0;
y = -400;

acc_y = 0.5;
vel_y = 1;
bounce_factor = 0.4;
tot_bounces = 3;
n_bounces = 0;

switch (global.storyBeat) {
	
	
	case CHAPTER.ONE_INTRO:
		sprite_index = sBackgroundTest1;
		PlayMusic(mus_MainTheme);
		break;

	case CHAPTER.TWO_CONVO:
		sprite_index = sBackgroundTest2;
		PlayMusic(mus_Dating);
		break;
	
	case CHAPTER.THREE_CONVO:
		sprite_index = sBackgroundTest1;
		PlayMusic(mus_Dating);
		break;
	
	case CHAPTER.FOUR_CONVO:
		sprite_index = sBackgroundTest2;
		PlayMusic(mus_Dating);
		break;

	case CHAPTER.FINAL_CONVO:
		sprite_index = sBackgroundTest3;
		PlayMusic(mus_MainTheme);
		break;


}