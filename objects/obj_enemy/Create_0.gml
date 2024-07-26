curr_row = 0;
curr_column = 0;

is_moving = false;
target_x = x;
target_y = y;

is_stunned = false;

function take_action(_row, _col) {
	//Does not take action if stunned (by ex. Blowback)
	if (is_stunned) {
		return;
	}
	//Makes a random legal move if not in vision
	if (!enemy_in_vision()) {
		move_enemy(random_legal_move(curr_row, curr_column));
		return;
	}
	var _upright_isempty = upright_is_empty(curr_row, curr_column);
	var _up_isempty = up_is_empty(curr_row, curr_column);
	var _upleft_isempty = upleft_is_empty(curr_row, curr_column);
	var _downleft_isempty = downleft_is_empty(curr_row, curr_column);
	var _down_isempty = down_is_empty(curr_row, curr_column);
	var _downright_isempty = downright_is_empty(curr_row, curr_column);
	//Cols same -> vertical movement
	if (curr_column == _col) {
		//Try to go down
		if (curr_row < _row) {
			if (_down_isempty) { move_enemy(5); }
		}
		//Try to go up
		if (curr_row > _row) {
			if (_up_isempty) { move_enemy(2); }
		}
	}
	//Rows same -> try stay on same row, otherwise try and move to right direction on other row
	else if (curr_row == _row) {
		//Try to go right, prefering same row
		if (curr_column < _col) {
			if (curr_column % 2 == 0) {
				if (_downright_isempty) { move_enemy(6) }
				else if (_upright_isempty) { move_enemy(1); }
			}
			else {
				if (_upright_isempty) { move_enemy(1) }
				else if (_downright_isempty) { move_enemy(6); }
			}
		}
		//Try to go left, prefering same row
		else if (curr_column > _col) {
			if (curr_column % 2 == 0) {
				if (_downleft_isempty) { move_enemy(4) }
				else if (_upleft_isempty) { move_enemy(3); }
			}
			else {
				if (_upleft_isempty) { move_enemy(3) }
				else if (_downleft_isempty) { move_enemy(4); }
			}
		}
	}
	//Try to go up or right
	else if (curr_row > _row and curr_column < _col) {
		if (_upright_isempty) { move_enemy(1); }
		else if (_up_isempty) { move_enemy(2); }
	}
	//Try to go up or left
	else if (curr_row > _row and curr_column > _col) {
		if (_upleft_isempty) { move_enemy(3); }
		else if (_up_isempty) { move_enemy(2); }
	}
	//Try to go down or left
	else if (curr_row < _row and curr_column > _col) {
		if (_downleft_isempty) { move_enemy(4); }
		else if (_down_isempty) { move_enemy(5); }
	}
	//Try to go down or right
	else if (curr_row < _row and curr_column < _col) {
		if (_downright_isempty) { move_enemy(6); }
		else if (_down_isempty) { move_enemy(5); }
	}
}

function enemy_in_vision() {
	return in_vision(x, y)
		or in_vision(x - sprite_width/2, y - sprite_width/2)
		or in_vision(x + sprite_width/2, y - sprite_width/2)
		or in_vision(x - sprite_width/2, y + sprite_width/2)
		or in_vision(x + sprite_width/2, y + sprite_width/2);
}

function move_enemy(_direction_number) {
	//Handles pixel movement and updates row and column coords
	//Direction is based of _direction_number; 1 is up-right continueing counter-clockwise
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

function get_knocked(_direction_number) {
	var _next_tile = [curr_row, curr_column];
		switch (_direction_number){
			case 1: 
				if (upright_is_empty(_next_tile[0], _next_tile[1])) {
					_next_tile = get_upright_coords(_next_tile[0], _next_tile[1]);
					target_x = x + 36;
					target_y = y - 24;
					move_coords(1);
					if (upright_is_empty(_next_tile[0], _next_tile[1])) {
						target_x += 36;
						target_y -= 24;
						move_coords(1);
					}
				}
			break;
			case 2: 
				if (up_is_empty(_next_tile[0], _next_tile[1])) {
					_next_tile = get_up_coords(_next_tile[0], _next_tile[1]);
					target_y -= 48;
					move_coords(2);
					if (up_is_empty(_next_tile[0], _next_tile[1])) {
						target_y -= 48;
						move_coords(2);
					}
				}
			break;
			case 3: 
				if (upleft_is_empty(_next_tile[0], _next_tile[1])) {
					_next_tile = get_upleft_coords(_next_tile[0], _next_tile[1]);
					target_x -= 36;
					target_y -= 24;
					move_coords(3);
					if (upleft_is_empty(_next_tile[0], _next_tile[1])) {
						target_x -= 36;
						target_y -= 24;
						move_coords(3);
					}
				}
			break;
			case 4: 
				if (downleft_is_empty(_next_tile[0], _next_tile[1])) {
					_next_tile = get_downleft_coords(_next_tile[0], _next_tile[1]);
					target_x -= 36;
					target_y += 24;
					move_coords(4);
					if (downleft_is_empty(_next_tile[0], _next_tile[1])) {
						target_x -= 36;
						target_y += 24;
						move_coords(4);
					}
				}
			break;
			case 5: 
				if (down_is_empty(_next_tile[0], _next_tile[1])) {
					_next_tile = get_down_coords(_next_tile[0], _next_tile[1]);
					target_y += 48;
					move_coords(5);
					if (down_is_empty(_next_tile[0], _next_tile[1])) {
						target_y += 48;
						move_coords(5);
					}
				}
			break;
			case 6: 
				if (downright_is_empty(_next_tile[0], _next_tile[1])) {
					_next_tile = get_downright_coords(_next_tile[0], _next_tile[1]);
					target_x += 36
					target_y += 24
					move_coords(6);
					if (downright_is_empty(_next_tile[0], _next_tile[1])) {
						target_x += 36;
						target_y += 24;
						move_coords(6);
					}
				}
			break;
			default:
				return;
		}
		is_stunned = true;
		image_angle = 181;
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
