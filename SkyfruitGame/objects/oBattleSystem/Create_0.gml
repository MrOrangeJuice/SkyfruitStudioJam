// Global objects
global.audio_ready = false;

global.text_handler = instance_create_depth(0, 0, 0, oTextHandler);
global.transition = instance_create_depth(0, 0, 0, oTransition);
global.music_handler = instance_create_depth(0, 0, 0, oMusicHandler);

// Audio init
audio_group_load(audiogroup_Music);

healthTextScale = 1;
enemyUITextScale = 1;
pauseOption = 0;

resultsSpawned = false;
resultsY = -100;
resultsYTarget = -100;
resultsFrame = 0;
continueY = 72;
continueYTarget = 72;

// for the animation
displayGift = 0;
displayGiftTimer = 0;
displayGiftFrames = 6;

reward = 20;
bonus = 20;
curBonus = bonus;
displayReward = false;
displayBonus = false;
displayContinue = false;

canShiftRooms = true;


analogUpPrev = false;
analogDownPrev = false;
analogUpPrevD = false;
analogDownPrevD = false;

ApplyUpgrades();

global.enemiesLeft = 20;

switch(room)
{
	case rTutorial:
		global.enemiesLeft = 2;
		break;
	case rLevel1:
		global.enemiesLeft = 20;
		break;
	case rLevel2:
		global.enemiesLeft = 25;
		break;
	case rLevel3:
		global.enemiesLeft = 30;
		break;
	case rLevel4:
		global.enemiesLeft = 1;
		break;
}

display_set_gui_size(SCREEN_W,SCREEN_H);