global.timesHit = 0;
global.resultsTime = 30;
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



bigBulletUpgrade = CheckUpgrades(UPGRADES.BIG_BULLETS);
invincDashUpgrade = CheckUpgrades(UPGRADES.INVULNERABLE_DASH);

damageUpgrade = CheckUpgrades(UPGRADES.DAMAGE_UP);
dashUpgrade = CheckUpgrades(UPGRADES.EXTRA_DASH);
fireRateUpgrade = CheckUpgrades(UPGRADES.FIRE_SPEED_UP);
moveSpeedUpgrade = CheckUpgrades(UPGRADES.MOVE_SPEED_UP);
healthUpgrade = CheckUpgrades(UPGRADES.HEALTH_UP);

global.maxHealth = 10 + (healthUpgrade * 2);