// Global objects
global.text_handler = instance_create_depth(0, 0, 0, oTextHandler);
global.transition = instance_create_depth(0, 0, 0, oTransition);
global.music_handler = instance_create_depth(0, 0, 0, oMusicHandler);
SetVolumes(); // initialize volumes
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

reward = 20;
bonus = 20;
curBonus = bonus;
displayReward = false;
displayBonus = false;
displayContinue = false;

global.enemiesLeft = 20;

display_set_gui_size(SCREEN_W,SCREEN_H);