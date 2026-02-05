global.paused = false;
global.hitPause = false;
global.maxHealth = 10;
global.health = 10;
global.timesHit = 0;
global.resultsTime = 30;
global.controller = 0;

global.musVolume = 0.5;
global.sndVolume = 0.5;

enum CHAPTER {
	NOTHING,
	ONE_INTRO,
	ONE_BATTLE,
	TWO_CONVO, // Isla
	TWO_BATTLE,
	THREE_CONVO, // Clyde
	THREE_BATTLE,
	FOUR_CONVO, // Alloy
	BOSS_BATTLE,
	FINAL_CONVO,
	END
}

global.giftCount = 0;
global.storyBeat = CHAPTER.NOTHING;
global.upgradesList = []; // stores upgrades the player has bought


// Scene state flags
global.islaKiss = false;
global.islaDraw = false;
global.islaFashion = false;
global.islaGun = false;

global.clydeReflection = false;
global.clydeWeapon = false;
global.clydeBack = false;
global.clydeTherapy = false;

global.alloyHair = false;
global.alloyHat = false;
global.alloySpellbook = false;
global.alloyPlan = false;

function SetStateFlag(_state) {
	variable_global_set(_state, true);
}
function GetStateFlag(_state) {
	return variable_global_get(_state);
}