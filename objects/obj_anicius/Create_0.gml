randomise();

curr_row = 0;
curr_column = 0;

curr_mouse_angle = 0;

is_moving = false;
target_x = x;
target_y = y;

//Inventory will be loaded from room object
//Fire breathing, Dashing, Blowback, Lighting Bolt]
inventory = [0, 0, 0, 0];
potion_hover = false;
//None = 0, Fire = 1, Dashing = 2, Blowback = 3, Lighting = 4
potion_active = 0;
fire_target = [];
is_dashing = false;

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
					_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
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
					_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
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
					_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
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
	give_enemy_action();
	potion_active = 0;
	inventory[1]--;
}

function cast_blowback() {
	//Start at up-right tile 2 tiles away, works way around outer layer and then inner layer
	var _tiletracker = get_upright_coords(curr_row, curr_column);
	//up-right outer
	_tiletracker = get_upright_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 1);
	//up-right diagonal
	_tiletracker = get_upleft_coords(_tiletracker[0], _tiletracker[1]);
	if (upright_is_empty(_tiletracker[0], _tiletracker[1]) and up_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], irandom(1)+1);
	}
	else if (upright_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 1);
	}
	else if (up_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 2);
	}
	//up outer
	_tiletracker = get_upleft_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 2);
	//up-left diagonal
	_tiletracker = get_downleft_coords(_tiletracker[0], _tiletracker[1]);
	if (up_is_empty(_tiletracker[0], _tiletracker[1]) and upleft_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], irandom(1)+2);
	}
	else if (up_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 2);
	}
	else if (upleft_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 3);
	}
	//up-left outer
	_tiletracker = get_downleft_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 3);
	//left diagonal
	_tiletracker = get_down_coords(_tiletracker[0], _tiletracker[1]);
	if (upleft_is_empty(_tiletracker[0], _tiletracker[1]) and downleft_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], irandom(1)+3);
	}
	else if (upleft_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 3);
	}
	else if (downleft_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 4);
	}
	//down-left outer
	_tiletracker = get_down_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 4);
	//down-left diagonal
	_tiletracker = get_downright_coords(_tiletracker[0], _tiletracker[1]);
	if (downleft_is_empty(_tiletracker[0], _tiletracker[1]) and down_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], irandom(1)+4);
	}
	else if (downleft_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 4);
	}
	else if (down_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 5);
	}
	//down outer
	_tiletracker = get_downright_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 5);
	//down-right diagonal
	_tiletracker = get_upright_coords(_tiletracker[0], _tiletracker[1]);
	if (down_is_empty(_tiletracker[0], _tiletracker[1]) and downright_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], irandom(1)+5);
	}
	else if (down_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 5);
	}
	else if (downright_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 6);
	}
	//down-right outer
	_tiletracker = get_upright_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 6);
	//right diagonal
	if (downright_is_empty(_tiletracker[0], _tiletracker[1]) and upright_is_empty(_tiletracker[0], _tiletracker[1])) {
		if (irandom(1) == 1) {
			blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 1);
		}
		else {
			blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 6);
		}
	}
	else if (downright_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 6);
	}
	else if (upright_is_empty(_tiletracker[0], _tiletracker[1])) {
		blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 1);
	}
	//up-right inner
	_tiletracker = get_upleft_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 1);
	//up inner
	_tiletracker = get_upleft_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 2);
	//up-left inner
	_tiletracker = get_downright_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 3);
	//down-left inner
	_tiletracker = get_down_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 4);
	//down inner
	_tiletracker = get_downright_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 5);
	//down-right inner
	_tiletracker = get_upright_coords(_tiletracker[0], _tiletracker[1]);
	blowback_enemy_on_hex(_tiletracker[0], _tiletracker[1], 6);
	
	move_anicius(random_legal_move(curr_row, curr_column));
	image_angle = 10;
	give_enemy_action();
	potion_active = 0;
	inventory[2]--;
}
	
function brew_pot(_pot_id) {
	//Fire = 0, Dashing = 1, Blowback = 2, Lightning = 3
	inventory[_pot_id]++;
	give_enemy_action();
}

function drink_pot(_pot_id) {
	//Fire = 0, Dashing = 1, Blowback = 2, Lightning = 3
	potion_active = _pot_id + 1;
}
