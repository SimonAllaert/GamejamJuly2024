//Calculate angle between Anicius and mouse (for movement preview)
curr_mouse_angle = point_direction(x, y, mouse_x, mouse_y)

//Checks if Anicius has reached target so moving can stop
if (point_distance(x, y, target_x, target_y) > 2 and is_moving) {
	move_towards_point(target_x, target_y, 5);
}
else {
	speed = 0
	x = target_x
	y = target_y
	is_moving = false;
}