global.giftCount = 0;
global.paused = false;
global.hitPause = false;
global.maxHealth = 10;
global.health = 10;
global.timesHit = 0;
global.resultsTime = 30;

global.upgradesList = []; // stores upgrades the player has bought

// Scene state flags
global.islaKiss = false;
global.islaDraw = false;
global.islaFashion = false;
global.islaGun = false;

function SetStateFlag(_state) {
	variable_global_set(_state, true);
}
function GetStateFlag(_state) {
	return variable_global_get(_state);
}