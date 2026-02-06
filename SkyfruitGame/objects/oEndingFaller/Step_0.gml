if live_call() return live_result;

vel_y += acc_y;
y += vel_y;

if (y > SCREEN_H + 100) {
	instance_destroy();
}