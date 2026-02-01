
function PorEnter(_portrait) {
	with (_portrait) {
		onscreen = true;
		UpdateTarX();
	}
}
function PorExit(_portrait) {
	with (_portrait) {
		onscreen = false;
		UpdateTarX();
	}
}

function PorMove(_portrait, _offset) {
	with (_portrait) {
		image_xscale = sign(_offset - move_offset); // face move direction
		move_offset = _offset;
		UpdateTarX();
	}
}

function PorJump(_portrait) {
	with (_portrait) {
		if (x == tar_x + move_offset) { // don't jump if moving
			vel_y = jump_vel_y;
		}
	}
}

function PorShake(_portrait) {
	with (_portrait) {
		shake_frames = max_shake_frames;
	}
}

function PorWiggle(_portrait) {
	with (_portrait) {
		wiggle_frames = max_wiggle_frames;
	}
}

function PorChange(_portrait, _new_sprite) {
	with (_portrait) {
		sprite_index = _new_sprite;
	}
}

function PorFace(_portrait, _dir) {
	with (_portrait) {
		image_xscale = (_dir == LEFT ? -1 : 1);
	}
}
