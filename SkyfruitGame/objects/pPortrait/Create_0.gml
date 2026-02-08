depth = PORTRAIT_DEPTH;

onscreen = false;

// Constants
offscreen_dist = 80;
onscreen_dist = 48;
base_y = 130;

// Initial values
image_xscale = (left ? 1 : -1); // portraits face right by default
x = (left ? -offscreen_dist : SCREEN_W + offscreen_dist);
y = base_y;
tar_x = x;
UpdateTarX = function() { // only updated on a move, enter, exit
	tar_x = (
		onscreen ?
		(left ? onscreen_dist : SCREEN_W - onscreen_dist) :
		(left ? -onscreen_dist : SCREEN_W + offscreen_dist)
	);
}

// Jump params
jump_vel_y = -6;
vel_y = 0;
acc_y = 1;

// Shake params
max_shake_frames = 30;
shake_intensity = 3;
shake_frames = 0;

// Wiggle params
max_wiggle_frames = 30;
wiggle_intensity = 3;
wiggle_frames = 0;

// Move params
move_offset = 0;
