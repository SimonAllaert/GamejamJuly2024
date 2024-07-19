/// @description Insert description here
// You can write your code in this editor

is_moving = false;
target_x = x;
target_y = y;

function move_anicius(_x, _y) {
	if (is_moving) {
		return
	}
	target_x = _x
	target_y = _y
	is_moving = true
	return
}