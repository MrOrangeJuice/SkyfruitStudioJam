if live_call() return live_result;

// Slide portrait on/offscreen
x = Approach(x, tar_x + move_offset, 0.1, 0.1);

// Jump
vel_y += acc_y;
y += vel_y;
if (y > base_y) {
	vel_y = 0;
	y = base_y;
}  

// Shake
shake_offset = shake_intensity*random_range(-1, 1)*(shake_frames > 0);
shake_frames = max(shake_frames - 1, 0);

// Wiggle
wiggle_offset = wiggle_intensity*sin(wiggle_frames/4);
wiggle_frames = max(wiggle_frames - 1, 0);


