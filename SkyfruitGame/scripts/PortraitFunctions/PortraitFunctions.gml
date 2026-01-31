
function PortraitEnter(_portrait) {
	with (_portrait) {
		onscreen = true;
		UpdateTarX();
	}
}
function PortraitExit(_portrait) {
	with (_portrait) {
		onscreen = false;
		UpdateTarX();
	}
}

function PortraitMove(_portrait, _offset) {
	with (_portrait) {
		image_xscale = sign(_offset - move_offset); // face move direction
		move_offset = _offset;
		UpdateTarX();
	}
}

function PortraitJump(_portrait) {
	with (_portrait) {
		if (x == tar_x + move_offset) { // don't jump if moving
			vel_y = jump_vel_y;
		}
	}
}

function PortraitShake(_portrait) {
	with (_portrait) {
		shake_frames = max_shake_frames;
	}
}

function PortraitWiggle(_portrait) {
	with (_portrait) {
		wiggle_frames = max_wiggle_frames;
	}
}

function PortraitChange(_portrait, _new_sprite) {
	with (_portrait) {
		sprite_index = _new_sprite;
	}
}

function PortraitFace(_portrait, _dir) {
	with (_portrait) {
		image_xscale = (_dir == LEFT ? -1 : 1);
	}
}
