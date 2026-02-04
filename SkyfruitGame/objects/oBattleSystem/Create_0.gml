// Global objects
global.text_handler = instance_create_depth(0, 0, 0, oTextHandler);
global.transition = instance_create_depth(0, 0, 0, oTransition);

healthTextScale = 1;
enemyUITextScale = 1;
pauseOption = 0;

resultsSpawned = false;
resultsY = -100;
resultsYTarget = -100;
resultsFrame = 0;

reward = 20;
bonus = 20;
curBonus = bonus;
displayReward = false;
displayBonus = false;

display_set_gui_size(SCREEN_W,SCREEN_H);