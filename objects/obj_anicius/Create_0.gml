randomise();

curr_row = 0;
curr_column = 0;

curr_mouse_angle = 0;

is_moving = false;
target_x = x;
target_y = y;

fadein = 1;

locked = true;
is_dead = false;
red_flash = false;
next_room = false;
fadeout = 0;

p_index = 0;

//Inventory will be loaded from room object
//Fire breathing, Dashing, Blowback, Lighting Bolt]
inventory = [0, 0, 0, 0];
potion_hover = false;
//None = 0, Fire = 1, Dashing = 2, Blowback = 3, Lighting = 4
potion_active = 0;
fire_target = [];
is_dashing = false;
is_casting_lightning = false;
lightning_target = [];

function move_anicius(_direction_number) {
	//Handles pixel movement and updates row and column coords
	//Direction is based of _direction_number; 1 is up-right continueing counter-clockwise
	if (is_moving) {
		return
	}
	is_moving = true
	switch (_direction_number){
		//Move up-right
		case 1: 
			target_x = x + 36
			target_y = y - 24
			move_coords(1);
			break;
		//Move straight up
		case 2: 
			target_x = x
			target_y = y - 48
			move_coords(2);
			break;
		//Move up-left
		case 3: 
			target_x = x - 36
			target_y = y - 24
			move_coords(3);
			break;
		//Move down-left
		case 4: 
			target_x = x - 36
			target_y = y + 24
			move_coords(4);
			break;
		//Move straight down
		case 5: 
			target_x = x
			target_y = y + 48
			move_coords(5);
			break;
		//Move down-right
		case 6: 
			target_x = x + 36
			target_y = y + 24
			move_coords(6);
			break;
		default:
			return;
	}
	if (global.layout[curr_row][curr_column] == 4) {
		locked = true;
		next_room = true;
		alarm[3] = 30;
	}
}

function move_coords(_direction_number) {
	switch (_direction_number){
		//Move up-right
		case 1:
			if (curr_column % 2 == 0) {
				curr_row -= 1
			}
			curr_column += 1
		break;
		//Move straight up
		case 2:
			curr_row -= 1
		break;
		//Move up-left
		case 3:
			if (curr_column % 2 == 0) {
				curr_row -= 1
			}
			curr_column -= 1
		break;
		//Move down-left
		case 4:
			if (curr_column % 2 != 0) {
				curr_row += 1
			}
			curr_column -= 1
		break;
		//Move straight down
		case 5: 
			curr_row += 1
		break;
		//Move down-right
		case 6: 
			if (curr_column % 2 != 0) {
				curr_row += 1
			}
			curr_column += 1
		break;
		default:
			return;
	}
}

function cast_fire(_direction_number) {
	//Casts fire breathing after Firepot is drank
	//Direction is based of _direction_number; 1 is up-right continueing counter-clockwise
	var _next_tile = [curr_row, curr_column];
	switch (_direction_number){
		//Move up-right
		case 1: 
			fire_target = [[x + 36, y - 24]];
			_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
			kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
			if (!upright_is_wall(_next_tile[0], _next_tile[1])) {
				array_push(fire_target, [x + 36 + 36, y - 24 - 24]);
				_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
				kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				if (!upright_is_wall(_next_tile[0], _next_tile[1])) {
					array_push(fire_target, [x + 36 + 36 + 36, y - 24 - 24 - 24]);
					_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
					kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				}
			}
			alarm[0] = 10;
		break;
		//Move straight up
		case 2: 
			fire_target = [[x, y - 48]];
			_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
			kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
			if (!up_is_wall(_next_tile[0], _next_tile[1])) {
				array_push(fire_target, [x, y - 48 - 48]);
				_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
				kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				if (!up_is_wall(_next_tile[0], _next_tile[1])) {
					array_push(fire_target, [x, y - 48 - 48 - 48]);
					_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
					kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				}
			}
			alarm[0] = 10;
		break;
		//Move up-left
		case 3: 
			fire_target = [[x - 36, y - 24]];
			_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
			kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
			if (!upleft_is_wall(_next_tile[0], _next_tile[1])) {
				array_push(fire_target, [x - 36 - 36, y - 24 - 24]);
				_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
				kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				if (!upleft_is_wall(_next_tile[0], _next_tile[1])) {
					array_push(fire_target, [x - 36 - 36 - 36, y - 24 - 24 - 24]);
					_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
					kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				}
			}
			alarm[0] = 10;
		break;
		//Move down-left
		case 4: 
			fire_target = [[x - 36, y + 24]];
			_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
			kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
			if (!downleft_is_wall(_next_tile[0], _next_tile[1])) {
				array_push(fire_target, [x - 36 - 36, y + 24 + 24]);
				_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
				kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				if (!downleft_is_wall(_next_tile[0], _next_tile[1])) {
					array_push(fire_target, [x - 36 - 36 - 36, y + 24 + 24 + 24]);
					_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
					kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				}
			}
			alarm[0] = 10;
		break;
		//Move straight down
		case 5: 
			fire_target = [[x, y + 48]];
			_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
			kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
			if (!down_is_wall(_next_tile[0], _next_tile[1])) {
				array_push(fire_target, [x, y + 48 + 48]);
				_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
				kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				if (!down_is_wall(_next_tile[0], _next_tile[1])) {
					array_push(fire_target, [x, y + 48 + 48 + 48]);
					_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
					kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				}
			}
			alarm[0] = 10;
		break;
		//Move down-right
		case 6: 
			fire_target = [[x + 36, y + 24]];
			_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
			kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
			if (!downright_is_wall(_next_tile[0], _next_tile[1])) {
				array_push(fire_target, [x + 36 + 36, y + 24 + 24]);
				_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
				kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				if (!downright_is_wall(_next_tile[0], _next_tile[1])) {
					array_push(fire_target, [x + 36 + 36 + 36, y + 24 + 24 + 24]);
					_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
					kill_enemy_on_hex(_next_tile[0], _next_tile[1]);
				}
			}
			alarm[0] = 10;
		break;
		default:
			return;
	}
}
	
function cast_dash(_direction_number) {
	//Casts fire breathing after Firepot is drank
	//Direction is based of _direction_number; 1 is up-right continueing counter-clockwise
	var _next_tile = [curr_row, curr_column];
	var _dash_distance = 0;
	var _dashing_target_x = x;
	var _dashing_target_y = y;
	switch (_direction_number){
		//Move up-right
		case 1: 
			_dash_distance++;
			_dashing_target_x += 36;
			_dashing_target_y -= 24;
			_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
			if (!upright_is_wall(_next_tile[0], _next_tile[1])) {
				_dash_distance++;
				_dashing_target_x += 36;
				_dashing_target_y -= 24;
				_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
				if (upright_is_empty(_next_tile[0], _next_tile[1])) {
					_dash_distance++;
					_dashing_target_x += 36;
					_dashing_target_y -= 24;
				}
			}
			is_dashing = true;
			target_x = _dashing_target_x;
			target_y = _dashing_target_y;
			while (_dash_distance > 0) {
				move_coords(1);
				_dash_distance--;
			}
			end_cast_dash();
		break;
		//Move straight up
		case 2: 
			_dash_distance++;
			_dashing_target_y -= 48;
			_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
			if (!up_is_wall(_next_tile[0], _next_tile[1])) {
				_dash_distance++;
				_dashing_target_y -= 48;
				_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
				if (up_is_empty(_next_tile[0], _next_tile[1])) {
					_dash_distance++;
					_dashing_target_y -= 48;
				}
			}
			is_dashing = true;
			target_y = _dashing_target_y;
			while (_dash_distance > 0) {
				move_coords(2);
				_dash_distance--;
			}
			end_cast_dash();
		break;
		//Move up-left
		case 3: 
			_dash_distance++;
			_dashing_target_x -= 36;
			_dashing_target_y -= 24;
			_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
			if (!upleft_is_wall(_next_tile[0], _next_tile[1])) {
				_dash_distance++;
				_dashing_target_x -= 36;
				_dashing_target_y -= 24;
				_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
				if (upleft_is_empty(_next_tile[0], _next_tile[1])) {
					_dash_distance++;
					_dashing_target_x -= 36;
					_dashing_target_y -= 24;
				}
			}
			is_dashing = true;
			target_x = _dashing_target_x;
			target_y = _dashing_target_y;
			while (_dash_distance > 0) {
				move_coords(3);
				_dash_distance--;
			}
			end_cast_dash();
		break;
		//Move down-left
		case 4: 
			_dash_distance++;
			_dashing_target_x -= 36;
			_dashing_target_y += 24;
			_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
			if (!downleft_is_wall(_next_tile[0], _next_tile[1])) {
				_dash_distance++;
				_dashing_target_x -= 36;
				_dashing_target_y += 24;
				_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
				if (downleft_is_empty(_next_tile[0], _next_tile[1])) {
					_dash_distance++;
				_dashing_target_x -= 36;
				_dashing_target_y += 24;
				}
			}
			is_dashing = true;
			target_x = _dashing_target_x;
			target_y = _dashing_target_y;
			while (_dash_distance > 0) {
				move_coords(4);
				_dash_distance--;
			}
			end_cast_dash();
		break;
		//Move straight down
		case 5: 
			_dash_distance++;
			_dashing_target_y += 48;
			_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
			if (!down_is_wall(_next_tile[0], _next_tile[1])) {
				_dash_distance++;
				_dashing_target_y += 48;
				_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
				if (down_is_empty(_next_tile[0], _next_tile[1])) {
					_dash_distance++;
					_dashing_target_y += 48;
				}
			}
			is_dashing = true;
			target_y = _dashing_target_y;
			while (_dash_distance > 0) {
				move_coords(5);
				_dash_distance--;
			}
			end_cast_dash();
		break;
		//Move down-right
		case 6: 
			_dash_distance++;
			_dashing_target_x += 36;
			_dashing_target_y += 24;
			_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
			if (!downright_is_wall(_next_tile[0], _next_tile[1])) {
				_dash_distance++;
				_dashing_target_x += 36;
				_dashing_target_y += 24;
				_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
				if (downright_is_empty(_next_tile[0], _next_tile[1])) {
					_dash_distance++;
					_dashing_target_x += 36;
					_dashing_target_y += 24;
				}
			}
			is_dashing = true;
			target_x = _dashing_target_x;
			target_y = _dashing_target_y;
			while (_dash_distance > 0) {
				move_coords(6);
				_dash_distance--;
			}
			end_cast_dash();
		break;
		default:
			return;
	}
}

function end_cast_dash() {
	give_enemy_action(curr_row, curr_column);
	potion_active = 0;
	inventory[1]--;
}

function cast_blowback() {
	var _upright_tile = get_upright_coords(curr_row, curr_column);
	var _up_tile = get_up_coords(curr_row, curr_column);
	var _upleft_tile = get_upleft_coords(curr_row, curr_column);
	var _downleft_tile = get_downleft_coords(curr_row, curr_column);
	var _down_tile = get_down_coords(curr_row, curr_column);
	var _downright_tile = get_downright_coords(curr_row, curr_column);
	blowback_enemy_on_hex(_upright_tile[0], _upright_tile[1], 1);
	blowback_enemy_on_hex(_up_tile[0], _up_tile[1], 2);
	blowback_enemy_on_hex(_upleft_tile[0], _upleft_tile[1], 3);
	blowback_enemy_on_hex(_downleft_tile[0], _downleft_tile[1], 4);
	blowback_enemy_on_hex(_down_tile[0], _down_tile[1], 5);
	blowback_enemy_on_hex(_downright_tile[0], _downright_tile[1], 6);
	
	//move_anicius(random_legal_move(curr_row, curr_column));
	image_angle = 10;
	give_enemy_action(curr_row, curr_column);
	potion_active = 0;
	inventory[2]--;
}
	
function cast_lightning() {
	var _tile = instance_nearest(mouse_x, mouse_y, obj_walkway);
	if (_tile != noone and point_distance(mouse_x, mouse_y, _tile.x, _tile.y) < 27.3
		and hex_in_vision(_tile.x, _tile.y)) {
		draw_sprite_ext(spr_tile_lightning, 0, _tile.x, _tile.y, 1, 1, 0, c_white, 0.5);
		lightning_target = [_tile.x, _tile.y];
		kill_enemy_on_hex(_tile.row, _tile.col);
		is_casting_lightning = true;
		alarm[1] = 11;
	}
}

function brew_pot(_pot_id) {
	//Fire = 0, Dashing = 1, Blowback = 2, Lightning = 3
	inventory[_pot_id]++;
	audio_play_sound(snd_drink,0,0,0.4,0,1,1);
	give_enemy_action(curr_row, curr_column);
}

function drink_pot(_pot_id) {
	//Fire = 0, Dashing = 1, Blowback = 2, Lightning = 3
	if (potion_active == _pot_id + 1) {
		potion_active = 0;
	}
	else {
		potion_active = _pot_id + 1;
	}
}

/*==========LIGHTING START==========*/

variable_global_set("surf", -1);

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
vertex_format = vertex_format_end();
vertex_buffer = vertex_create_buffer();

function lighting() {
	surface_set_target(global.surf)
	draw_clear_alpha(0, 0)

	vertex_begin(vertex_buffer, vertex_format)
	for (var _row = 0; _row < array_length(global.layout); _row++) {
		for (var _col = 0; _col < array_length(global.layout[0]); _col++) {
			if global.layout[_row][_col] != 1 continue
			corner_points = get_ch(hex_to_pixel(_row, _col))
			for (var _i = 0; _i < array_length(corner_points) - 1; _i++) {
				project_shadow(vertex_buffer, corner_points[_i], corner_points[_i+1], [x, y]);
				project_shadow(vertex_buffer, corner_points[array_length(corner_points) - 1], corner_points[0], [x, y]);
			}
		}
	}
	vertex_end(vertex_buffer);
	vertex_submit(vertex_buffer, pr_trianglelist, -1);
	
	surface_reset_target();
}

/*==========LIGHTING END==========*/

function kill_anicius() {
	locked = true;
	red_flash = true;
	is_dead = true;
	alarm[2] = 7;
	audio_stop_sync_group(global.sync_group)
	audio_play_sound(snd_PinoPling,0,0,1,0,1,1);



}
