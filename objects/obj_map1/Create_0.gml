/// @description Insert description here
// You can write your code in this editor

// may be more convenient to do 2d array of tiles idk
var _wall_list = [[0,1], [1,0], [5,7]]
var _floor_list = []
var _rat_list = []
var _snake_list = []
var _start_x = 0
var _start_y = 0

function create_map(_start_pos, _walls) {
	draw_hex(_start_pos[0], _start_pos[1], obj_anicius)
	for (var _i = 0; _i < array_length(_walls); _i += 1) {
		draw_hex(_walls[i][0], _walls[i][1], obj_wall)
	}
}

function draw_hex(_hex_x, _hex_y, _type) {
	var _draw_coords = hex_to_draw_coords(_hex_x, _hex_y)
	instance_create_layer(_draw_coords[0], _draw_coords[1], "Instances_2", _type)
}

function hex_to_draw_coords(_hex_x, _hex_y) {
	var _draw_x = -1
	var _draw_y = -1
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
	return [_draw_x, _draw_y]
}

create_map([_start_x, _start_y], _wall_list)