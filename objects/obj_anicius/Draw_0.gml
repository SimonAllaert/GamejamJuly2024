draw_self()

//Draws preview arrows for movement in direction of mouse if Anicius is not moving
if (!is_moving) {

	if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and !upright_is_wall()) {
		draw_sprite_ext(spr_walk_marker, 0, x + 36, y - 24, 1, 1, 30, c_white, 1)
	}
	else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and !up_is_wall()) {
		draw_sprite_ext(spr_walk_marker, 0, x, y - 48, 1, 1, 90, c_white, 1)
	}
	else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and !upleft_is_wall()) {
		draw_sprite_ext(spr_walk_marker, 0, x - 36, y - 24, 1, 1, 150, c_white, 1)
	}
	else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and !downleft_is_wall()) {
		draw_sprite_ext(spr_walk_marker, 0, x - 36, y + 24, 1, 1, 210, c_white, 1)
	}
	else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and !down_is_wall()) {
		draw_sprite_ext(spr_walk_marker, 0, x, y + 48, 1, 1, 270, c_white, 1)
	}
	else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and !downright_is_wall()) {
		draw_sprite_ext(spr_walk_marker, 0, x + 36, y + 24, 1, 1, 330, c_white, 1)
	}
}