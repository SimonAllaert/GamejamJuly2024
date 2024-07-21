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