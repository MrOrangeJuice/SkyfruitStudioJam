if live_call() return live_result;

x = 0;
y = -400;

acc_y = 3;
vel_y = 1;
bounce_factor = 0.4;
tot_bounces = 3;
n_bounces = 0;

switch (global.storyBeat) {
	
	
	case CHAPTER.ONE_INTRO:
		sprite_index = sBackgroundTest1;
		break;

	case CHAPTER.TWO_CONVO:
		sprite_index = sBackgroundTest2;
		break;
	
	case CHAPTER.THREE_CONVO:
		sprite_index = sBackgroundTest1;
		break;
	
	case CHAPTER.FOUR_CONVO:
		sprite_index = sBackgroundTest2;
		break;

	case CHAPTER.FINAL_CONVO:
		sprite_index = sBackgroundTest3;
		break;


}