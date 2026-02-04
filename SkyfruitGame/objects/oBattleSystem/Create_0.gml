// Global objects
global.text_handler = instance_create_depth(0, 0, 0, oTextHandler);
global.transition = instance_create_depth(0, 0, 0, oTransition);

healthTextScale = 1;
enemyUITextScale = 1;
pauseOption = 0;

display_set_gui_size(SCREEN_W,SCREEN_H);