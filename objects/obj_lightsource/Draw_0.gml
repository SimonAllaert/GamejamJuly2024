/// @description Insert description here
// You can write your code in this editor

var _width = global.layout[0] * 36
var _height = global.layout[0][0] * 48

var _surf = surface_create(_width, _height)
surface_set_target(_surf);
draw_set_colour(c_black);
draw_set_alpha(0);
draw_rectangle(0, 0, _width, _height, false);
surface_reset_target();