vel_y += acc_y;
y += vel_y;
if (y > 0) {
	y = 0;
	if (n_bounces < tot_bounces) {
		vel_y *= -bounce_factor;
	} else {
		vel_y = 0;
		acc_y = 0;
	}
}