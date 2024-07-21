//Checks if enemy has reached target so moving can stop
if (point_distance(x, y, target_x, target_y) > 2 and is_moving) {
	move_towards_point(target_x, target_y, 5);
}
else if (point_distance(x, y, target_x, target_y) > 5 and is_stunned) {
	move_towards_point(target_x, target_y, 8);
}
else {
	speed = 0
	x = target_x
	y = target_y
	is_moving = false;
	is_stunned = false;
}
if (image_angle > 180) {
	image_angle += 11;
	if (image_angle > 360) {
		image_angle = 0;
	}
}