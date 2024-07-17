/// @description Insert description here
// You can write your code in this editor

var _hex_x = mouse_x div 37
var _hex_y = mouse_y div 48

var _draw_x = -1
var _draw_y = -1

if _hex_x mod 2 == 1 {
	_draw_x = _hex_x * 37
	_draw_y = _hex_y * 48 + 24
}
else {
	_draw_x = _hex_x * 37
	_draw_y = _hex_y * 48
}

instance_create_layer(_draw_x, _draw_y, "Tiles_1", obj_object2)
