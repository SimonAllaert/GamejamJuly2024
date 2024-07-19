
if (!is_moving) {
	var _curr_angle = point_direction(x + sprite_width/2, y + sprite_height/2, mouse_x, mouse_y)

	if (_curr_angle >= 0 and _curr_angle < 60) {
		move_anicius(x + 36, y - 24);
	}
	else if (+_curr_angle >= 60 and _curr_angle < 120) {
		move_anicius(x, y - 48);
	}
	else if (+_curr_angle >= 120 and _curr_angle < 180) {
		move_anicius(x - 36, y - 24);
	}
	else if (+_curr_angle >= 180 and _curr_angle < 240) {
		move_anicius(x - 36, y + 24);
	}
	else if (+_curr_angle >= 240 and _curr_angle < 300) {
		move_anicius(x, y + 48);
	}
	else if (+_curr_angle >= 300 and _curr_angle < 360) {
		move_anicius(x + 36, y + 24);
	}
}