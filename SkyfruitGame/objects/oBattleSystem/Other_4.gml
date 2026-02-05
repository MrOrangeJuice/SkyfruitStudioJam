global.timesHit = 0;
global.resultsTime = 30;
resultsSpawned = false;
resultsY = -100;
resultsYTarget = -100;
resultsFrame = 0;

reward = 20;
bonus = 20;
curBonus = bonus;
displayReward = false;
displayBonus = false;

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
}