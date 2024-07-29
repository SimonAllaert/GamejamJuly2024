//Calculate angle between Anicius and mouse (for movement preview)
curr_mouse_angle = point_direction(x, y, mouse_x, mouse_y)

//Checks if Anicius has reached target so moving can stop
if (point_distance(x, y, target_x, target_y) > 2 and is_moving and !is_dashing) {
	move_towards_point(target_x, target_y, 5);
}
else if (point_distance(x, y, target_x, target_y) > 15 and !is_moving and is_dashing) {
	move_towards_point(target_x, target_y, 15);
}
else {
	speed = 0
	x = target_x
	y = target_y
	is_moving = false;
	is_dashing = false;
}
//Fix angle after Blowback
if (image_angle > 0) {
	image_angle += 22;
	if (image_angle > 720) {
		image_angle = 0;
	}
}


/*==========LIGHTING START==========*/

//Create the surface to draw shadows on
if (!surface_exists(global.surf))
	global.surf = surface_create(room_width, room_height)


/*==========LIGHTING END==========*/
