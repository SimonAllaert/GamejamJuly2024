// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function							real_to_hex_coords(_real_x, _real_y);
/// @param {real} _real_x				The real x_coordinate of the pixel
/// @param {real} _real_y				The real y-coordinate of the pixel
/// @return {Array<any>} hex_coords		The odd-q coordinate of the hex the pixel is in
function real_to_hex_coords(_real_x, _real_y) {
	hex_x = _real_x div 37
	hex_y = -1
	
	if hex_x mod 2 == 1 hex_y = (_real_x - 24) div 48
	else hex_y = _real_x div 48
	
	hex_coords = [hex_x, hex_y]
	
	return hex_coords
} 

function hex_to_draw_coords(_hex_x, _hex_y) {
	if _hex_x mod 2 == 1 {
		_draw_x = _hex_x * 37
		_draw_y = _hex_y * 48 + 24
	}
	else  {
		_draw_x = _hex_x * 37
		_draw_y = _hex_y * 48
	}
	return [_draw_x, _draw_y]
}