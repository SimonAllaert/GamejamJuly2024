//Checks if Anicius has reached target so moving can stop
if (point_distance(x, y, target_x, target_y) > 2 and is_moving) {
	move_towards_point(target_x, target_y, 5);
}
else {
	x = target_x
	y = target_y
	is_moving = false;
}