/// @description Color the clicked hex red.

// get the odd-q coordinates of the mouse click
var _hex_x = mouse_x div 37
var _hex_y = -1

// declare real draw coordinates
var _draw_x = -1
var _draw_y = -1

// calculate drawing coordinates depending on odd or even column
if _hex_x mod 2 == 1 {
	_hex_y = (mouse_y - 24) div 48
	_draw_x = _hex_x * 37
	_draw_y = _hex_y * 48 + 24
}
else  {
	_hex_y = mouse_y div 48
	_draw_x = _hex_x * 37
	_draw_y = _hex_y * 48
}

// draw red hex on the real coordinates
instance_create_layer(_draw_x, _draw_y, "Instances", obj_object2)
