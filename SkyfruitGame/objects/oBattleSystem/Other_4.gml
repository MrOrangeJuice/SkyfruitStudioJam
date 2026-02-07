global.timesHit = 0;
global.resultsTime = 30;
resultsSpawned = false;
resultsY = -100;
resultsYTarget = -100;
resultsFrame = 0;
continueY = 72;
continueYTarget = 72;

if(room == rTutorial)
{
	reward = 2;
	bonus = 2;
}
else
{
	reward = 20;
	bonus = 20;
}

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

ApplyUpgrades();
