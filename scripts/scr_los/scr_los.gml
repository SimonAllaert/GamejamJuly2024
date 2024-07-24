// 


function scr_los(_curr_tile, _target_tile) {
	
}

function project_shadow(_vertex_buffer, _wallpoint_a, _wallpoint_b, _lightpoint) {
	var _shadow_a = get_shadow_vector(_lightpoint, _wallpoint_a)
	var _shadow_b = get_shadow_vector(_lightpoint, _wallpoint_b)
		
	vertex_position(_vertex_buffer, _wallpoint_a[0],_wallpoint_a[1]);
	vertex_argb(_vertex_buffer, $ff1F1F1F);
	vertex_position(_vertex_buffer, _wallpoint_b[0],_wallpoint_b[1]);
	vertex_argb(_vertex_buffer, $ff1F1F1F);
	vertex_position(_vertex_buffer, _shadow_a[0],_shadow_a[1]);
	vertex_argb(_vertex_buffer, $ff1F1F1F);
		
	vertex_position(_vertex_buffer, _wallpoint_b[0],_wallpoint_b[1]);
	vertex_argb(_vertex_buffer, $ff1F1F1F);
	vertex_position(_vertex_buffer, _shadow_a[0],_shadow_a[1]);
	vertex_argb(_vertex_buffer, $ff1F1F1F);
	vertex_position(_vertex_buffer, _shadow_b[0],_shadow_b[1]);
	vertex_argb(_vertex_buffer, $ff1F1F1F);
}

function get_shadow_vector(_p1, _p2) {
	var _shadow_length = 2000
	var _dx = _p2[0] - _p1[0]
	var _dy = _p2[1] - _p1[1]
	var _len = sqrt(_dx*_dx + _dy*_dy)
	return [_dx*_shadow_length/_len, _dy*_shadow_length/_len]
}

// Return the 8 bounding pixels of the hex starting with top left going clockwise
function get_ch(_tile_coords) {
	var _real_x = _tile_coords[0]
	var _real_y = _tile_coords[1]
	var _topleft = [_real_x - 13, _real_y - 24]
	var _topright = [_real_x + 12, _real_y - 24]
	var _righttop = [_real_x + 23, _real_y - 2]
	var _rightbottom = [_real_x + 23, _real_y + 3]
	var _bottomright = [_real_x + 12, _real_y + 23]
	var _bottomleft = [_real_x - 13, _real_y + 23]
	var _leftbottom = [_real_x - 24, _real_y + 3]
	var _lefttop = [_real_x - 24, _real_y - 2]
	return [_topleft, _topright, _righttop, _rightbottom, _bottomright, _bottomleft, _leftbottom, _lefttop]
}

function in_vision(_x, _y) {
	if (variable_global_exists("surf") and surface_exists(global.surf)) {
		var _color = surface_getpixel_ext(global.surf, _x, _y);
		return _color != $ff1F1F1F;
	}
}

function hex_in_vision(_x, _y) {
	var _in_vision = in_vision(_x, _y);
	var _corners = get_ch([_x, _y]);
	for (var _i = 0; _i < array_length(_corners); ++_i) {
		_in_vision = _in_vision or in_vision(_corners[_i][0], _corners[_i][1]);
	}
	return _in_vision;
}
