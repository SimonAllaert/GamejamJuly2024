// 


function scr_los(_curr_tile, _target_tile) {
	
}

function project_shadow(_vertex_buffer, _wallpoint_a, _wallpoint_b, _lightpoint) {
	var _shadow_a = get_shadow_vector(_lightpoint, _wallpoint_a)
	var _shadow_b = get_shadow_vector(_lightpoint, _wallpoint_b)
		
	vertex_position(_vertex_buffer, _wallpoint_a[0],_wallpoint_a[1]);
	vertex_argb(_vertex_buffer, $ff000000);
	vertex_position(_vertex_buffer, _wallpoint_b[0],_wallpoint_b[1]);
	vertex_argb(_vertex_buffer, $ff000000);
	vertex_position(_vertex_buffer, _shadow_a[0],_shadow_a[1]);
	vertex_argb(_vertex_buffer, $ff000000);
		
	vertex_position(_vertex_buffer, _wallpoint_b[0],_wallpoint_b[1]);
	vertex_argb(_vertex_buffer, $ff000000);
	vertex_position(_vertex_buffer, _shadow_a[0],_shadow_a[1]);
	vertex_argb(_vertex_buffer, $ff000000);
	vertex_position(_vertex_buffer, _shadow_b[0],_shadow_b[1]);
	vertex_argb(_vertex_buffer, $ff000000);
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