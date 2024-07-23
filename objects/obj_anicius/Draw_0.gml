/*=========LIGHTING START==========*/

function lighting() {
	surface_set_target(surf)
	draw_clear_alpha(0, 0)

	vertex_begin(vertex_buffer, vertex_format)
	for (row = 0; row < array_length(global.layout); row++) {
		for (col = 0; col < array_length(global.layout[0]); col++) {
			if global.layout[row][col] != 1 continue
			corner_points = get_ch(hex_to_pixel(row, col))
			for (i = 0; i < array_length(corner_points) - 1; i++) 
				project_shadow(vertex_buffer, corner_points[i], corner_points[i+1], [x, y])
			project_shadow(vertex_buffer, corner_points[array_length(corner_points) - 1], corner_points[0], [x, y])
		}
	}
	vertex_end(vertex_buffer)
	vertex_submit(vertex_buffer, pr_trianglelist, -1)
	
	surface_reset_target()
	draw_surface(surf, 0, 0)
}

lighting()

/*=========LIGHTING END==========*/

draw_self()

//Draws preview arrows for movement in direction of mouse if Anicius is not moving
if (!is_moving and !potion_hover and potion_active == 0) {
	if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and upright_is_empty(curr_row, curr_column)) {
		draw_sprite_ext(spr_walk_marker, 0, x + 36, y - 24, 1, 1, 30, c_white, 1);
	}
	else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and up_is_empty(curr_row, curr_column)) {
		draw_sprite_ext(spr_walk_marker, 0, x, y - 48, 1, 1, 90, c_white, 1);
	}
	else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and upleft_is_empty(curr_row, curr_column)) {
		draw_sprite_ext(spr_walk_marker, 0, x - 36, y - 24, 1, 1, 150, c_white, 1);
	}
	else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and downleft_is_empty(curr_row, curr_column)) {
		draw_sprite_ext(spr_walk_marker, 0, x - 36, y + 24, 1, 1, 210, c_white, 1);
	}
	else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and down_is_empty(curr_row, curr_column)) {
		draw_sprite_ext(spr_walk_marker, 0, x, y + 48, 1, 1, 270, c_white, 1);
	}
	else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and downright_is_empty(curr_row, curr_column)) {
		draw_sprite_ext(spr_walk_marker, 0, x + 36, y + 24, 1, 1, 330, c_white, 1);
	}
}
//Draws preview of fire cast
else if (!potion_hover and potion_active == 1 and array_length(fire_target) == 0) {
	var _next_tile = [curr_row, curr_column];
	if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and !upright_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_fire, 0, x + 36, y - 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
		if (!upright_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_fire, 0, x + 36 + 36, y - 24 - 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
			if (!upright_is_wall(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_fire, 0, x + 36 + 36 + 36, y - 24 - 24 - 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and !up_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_fire, 0, x, y - 48, 1, 1, 0, c_white, 0.5);
		_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
		if (!up_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_fire, 0, x, y - 48 - 48, 1, 1, 0, c_white, 0.5);
			_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
			if (!up_is_wall(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_fire, 0, x, y - 48 - 48 - 48, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and !upleft_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_fire, 0, x - 36, y - 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
		if (!upleft_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_fire, 0, x - 36 - 36, y - 24 - 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
			if (!upleft_is_wall(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_fire, 0, x - 36 - 36 - 36, y - 24 - 24 - 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and !downleft_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_fire, 0, x - 36, y + 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
		if (!downleft_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_fire, 0, x - 36 - 36, y + 24 + 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
			if (!downleft_is_wall(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_fire, 0, x - 36 - 36 - 36, y + 24 + 24 + 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and !down_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_fire, 0, x, y + 48, 1, 1, 0, c_white, 0.5);
		_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
		if (!down_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_fire, 0, x, y + 48 + 48, 1, 1, 0, c_white, 0.5);
			_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
			if (!down_is_wall(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_fire, 0, x, y + 48 + 48 + 48, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and !downright_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_fire, 0, x + 36, y + 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
		if (!downright_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_fire, 0, x + 36 + 36, y + 24 + 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
			if (!downright_is_wall(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_fire, 0, x + 36 + 36 + 36, y + 24 + 24 + 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
}
//Draws fire cast (should be turned off by Alarm0
else if (array_length(fire_target) > 0) {
	for (var _i = 0; _i < array_length(fire_target); ++_i) {
		draw_sprite_ext(spr_cast_fire, 0, fire_target[_i][0], fire_target[_i][1], 1, 1, 0, c_white, 1);
	}
}
//Draws preview of dash cast
else if (!potion_hover and potion_active == 2) {
	var _next_tile = [curr_row, curr_column];
	if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and !upright_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_dash, 0, x + 36, y - 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
		if (!upright_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_dash, 0, x + 36 + 36, y - 24 - 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
			if (upright_is_empty(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_dash, 0, x + 36 + 36 + 36, y - 24 - 24 - 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and !up_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_dash, 0, x, y - 48, 1, 1, 0, c_white, 0.5);
		_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
		if (!up_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_dash, 0, x, y - 48 - 48, 1, 1, 0, c_white, 0.5);
			_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
			if (up_is_empty(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_dash, 0, x, y - 48 - 48 - 48, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and !upleft_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_dash, 0, x - 36, y - 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
		if (!upleft_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_dash, 0, x - 36 - 36, y - 24 - 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
			if (upleft_is_empty(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_dash, 0, x - 36 - 36 - 36, y - 24 - 24 - 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and !downleft_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_dash, 0, x - 36, y + 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
		if (!downleft_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_dash, 0, x - 36 - 36, y + 24 + 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
			if (downleft_is_empty(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_dash, 0, x - 36 - 36 - 36, y + 24 + 24 + 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and !down_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_dash, 0, x, y + 48, 1, 1, 0, c_white, 0.5);
		_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
		if (!down_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_dash, 0, x, y + 48 + 48, 1, 1, 0, c_white, 0.5);
			_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
			if (down_is_empty(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_dash, 0, x, y + 48 + 48 + 48, 1, 1, 0, c_white, 0.5);
			}
		}
	}
	else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and !downright_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_dash, 0, x + 36, y + 24, 1, 1, 0, c_white, 0.5);
		_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
		if (!downright_is_wall(_next_tile[0], _next_tile[1])) {
			draw_sprite_ext(spr_tile_dash, 0, x + 36 + 36, y + 24 + 24, 1, 1, 0, c_white, 0.5);
			_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
			if (downright_is_empty(_next_tile[0], _next_tile[1])) {
				draw_sprite_ext(spr_tile_dash, 0, x + 36 + 36 + 36, y + 24 + 24 + 24, 1, 1, 0, c_white, 0.5);
			}
		}
	}
}
//Draws preview of blowback cast
else if (!potion_hover and potion_active == 3) {
	//Space of Anicius
	draw_sprite_ext(spr_tile_blowback, 0, x, y, 1, 1, 0, c_white, 0.5);
	//All adjacent hexes to check outer ring later
	var _upright_tile = get_upright_coords(curr_row, curr_column);
	var _up_tile = get_up_coords(curr_row, curr_column);
	var _upleft_tile = get_upleft_coords(curr_row, curr_column);
	var _downleft_tile = get_downleft_coords(curr_row, curr_column);
	var _down_tile = get_down_coords(curr_row, curr_column);
	var _downright_tile = get_downright_coords(curr_row, curr_column);
	//Check all adjacent hexes and the one straight after
	if (!upright_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_blowback, 0, x + 36, y - 24, 1, 1, 0, c_white, 0.5);
		if (!upright_is_wall(_upright_tile[0], _upright_tile[1])) {
			draw_sprite_ext(spr_tile_blowback, 0, x + 36 + 36, y - 24 - 24, 1, 1, 0, c_white, 0.5);
		}
	}
	if (!up_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_blowback, 0, x, y - 48, 1, 1, 0, c_white, 0.5);
		if (!up_is_wall(_up_tile[0], _up_tile[1])) {
			draw_sprite_ext(spr_tile_blowback, 0, x, y - 48 - 48, 1, 1, 0, c_white, 0.5);
		}
	}
	if (!upleft_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_blowback, 0, x - 36, y - 24, 1, 1, 0, c_white, 0.5);
		if (!upleft_is_wall(_upleft_tile[0], _upleft_tile[1])) {
			draw_sprite_ext(spr_tile_blowback, 0, x - 36 - 36, y - 24 - 24, 1, 1, 0, c_white, 0.5);
		}
	}
	if (!downleft_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_blowback, 0, x - 36, y + 24, 1, 1, 0, c_white, 0.5);
		if (!downleft_is_wall(_downleft_tile[0], _downleft_tile[1])) {
			draw_sprite_ext(spr_tile_blowback, 0, x - 36 - 36, y + 24 + 24, 1, 1, 0, c_white, 0.5);
		}
	}
	if (!down_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_blowback, 0, x, y + 48, 1, 1, 0, c_white, 0.5);
		if (!down_is_wall(_down_tile[0], _down_tile[1])) {
			draw_sprite_ext(spr_tile_blowback, 0, x, y + 48 + 48, 1, 1, 0, c_white, 0.5);
		}
	}
	if (!downright_is_wall(curr_row, curr_column)) {
		draw_sprite_ext(spr_tile_blowback, 0, x + 36, y + 24, 1, 1, 0, c_white, 0.5);
		if (!downright_is_wall(_downright_tile[0], _downright_tile[1])) {
			draw_sprite_ext(spr_tile_blowback, 0, x + 36 + 36, y + 24 + 24, 1, 1, 0, c_white, 0.5);
		}
	}
	//Check corners if at least one of the inner neighbours isnt a wall
	if ((!upright_is_wall(curr_row, curr_column) or !up_is_wall(curr_row, curr_column)) and !up_is_wall(_upright_tile[0], _upright_tile[1])) {
		draw_sprite_ext(spr_tile_blowback, 0, x + 36, y - 24 - 48, 1, 1, 0, c_white, 0.5);
	}
	if ((!up_is_wall(curr_row, curr_column) or !upleft_is_wall(curr_row, curr_column)) and !upleft_is_wall(_up_tile[0], _up_tile[1])) {
		draw_sprite_ext(spr_tile_blowback, 0, x - 36, y - 24 - 48, 1, 1, 0, c_white, 0.5);
	}
	if ((!upleft_is_wall(curr_row, curr_column) or !downleft_is_wall(curr_row, curr_column)) and !downleft_is_wall(_upleft_tile[0], _upleft_tile[1])) {
		draw_sprite_ext(spr_tile_blowback, 0, x - 36 - 36, y - 24 + 24, 1, 1, 0, c_white, 0.5);
	}
	if ((!downleft_is_wall(curr_row, curr_column) or !down_is_wall(curr_row, curr_column)) and !down_is_wall(_downleft_tile[0], _downleft_tile[1])) {
		draw_sprite_ext(spr_tile_blowback, 0, x - 36, y + 24 + 48, 1, 1, 0, c_white, 0.5);
	}
	if ((!down_is_wall(curr_row, curr_column) or !downright_is_wall(curr_row, curr_column)) and !downright_is_wall(_down_tile[0], _down_tile[1])) {
		draw_sprite_ext(spr_tile_blowback, 0, x + 36, y + 24 + 48, 1, 1, 0, c_white, 0.5);
	}
	if ((!downright_is_wall(curr_row, curr_column) or !upright_is_wall(curr_row, curr_column)) and !upright_is_wall(_downright_tile[0], _downright_tile[1])) {
		draw_sprite_ext(spr_tile_blowback, 0, x + 36 + 36, y - 24 + 24, 1, 1, 0, c_white, 0.5);
	}
}
