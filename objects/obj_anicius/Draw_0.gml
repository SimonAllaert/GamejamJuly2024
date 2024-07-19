draw_self()

//Draws preview arrows for movement in direction of mouse if Anicius is not moving
if (!is_moving) {
	var _curr_angle = point_direction(x + sprite_width/2, y + sprite_height/2, mouse_x, mouse_y)

	if (_curr_angle >= 0 and _curr_angle < 60) {
		draw_sprite_ext(spr_walk_marker, 0, x + 36, y - 24, 1, 1, 30, c_white, 1)
	}
	else if (+_curr_angle >= 60 and _curr_angle < 120) {
		draw_sprite_ext(spr_walk_marker, 0, x, y - 48, 1, 1, 90, c_white, 1)
	}
	else if (+_curr_angle >= 120 and _curr_angle < 180) {
		draw_sprite_ext(spr_walk_marker, 0, x - 36, y - 24, 1, 1, 150, c_white, 1)
	}
	else if (+_curr_angle >= 180 and _curr_angle < 240) {
		draw_sprite_ext(spr_walk_marker, 0, x - 36, y + 24, 1, 1, 210, c_white, 1)
	}
	else if (+_curr_angle >= 240 and _curr_angle < 300) {
		draw_sprite_ext(spr_walk_marker, 0, x, y + 48, 1, 1, 270, c_white, 1)
	}
	else if (+_curr_angle >= 300 and _curr_angle < 360) {
		draw_sprite_ext(spr_walk_marker, 0, x + 36, y + 24, 1, 1, 330, c_white, 1)
	}
}