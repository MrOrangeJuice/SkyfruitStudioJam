// Global objects
global.text_handler = instance_create_depth(0, 0, 0, oTextHandler);
global.transition = instance_create_depth(0, 0, 0, oTransition);
global.music_handler = instance_create_depth(0, 0, 0, oMusicHandler);
SetVolumes(); // initialize volumes

// Audio init
audio_group_load(audiogroup_Music);
audio_sound_loop_start(mus_JohnnyFights, 13.71428571);

healthTextScale = 1;
enemyUITextScale = 1;
pauseOption = 0;

resultsSpawned = false;
resultsY = -100;
resultsYTarget = -100;
resultsFrame = 0;
continueY = 72;
continueYTarget = 72;

reward = 20;
bonus = 20;
curBonus = bonus;
displayReward = false;
displayBonus = false;
displayContinue = false;

canShiftRooms = true;

bigBulletUpgrade = CheckUpgrades(UPGRADES.BIG_BULLETS);
invincDashUpgrade = CheckUpgrades(UPGRADES.INVULNERABLE_DASH);

damageUpgrade = CheckUpgrades(UPGRADES.DAMAGE_UP);
dashUpgrade = CheckUpgrades(UPGRADES.EXTRA_DASH);
fireRateUpgrade = CheckUpgrades(UPGRADES.FIRE_SPEED_UP);
moveSpeedUpgrade = CheckUpgrades(UPGRADES.MOVE_SPEED_UP);
healthUpgrade = CheckUpgrades(UPGRADES.HEALTH_UP);


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