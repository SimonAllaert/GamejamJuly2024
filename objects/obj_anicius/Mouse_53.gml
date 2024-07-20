
if (!is_moving and !potion_hover) {

	if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and !upright_is_wall()) {
		move_anicius(1);
	}
	else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and !up_is_wall()) {
		move_anicius(2);
	}
	else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and !upleft_is_wall()) {
		move_anicius(3);
	}
	else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and !downleft_is_wall()) {
		move_anicius(4);
	}
	else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and !down_is_wall()) {
		move_anicius(5);
	}
	else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and !downright_is_wall()) {
		move_anicius(6);
	}
}