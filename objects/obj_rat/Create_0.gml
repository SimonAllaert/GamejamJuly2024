/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Overwrite take_action
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
			if (_down_isempty) { move_enemy(5); slay_anicius(_row, _col); }
		}
		//Try to go up
		if (curr_row > _row) {
			if (_up_isempty) { move_enemy(2); slay_anicius(_row, _col); }
		}
	}
	//Rows same -> try stay on same row, otherwise try and move to right direction on other row
	else if (curr_row == _row) {
		//Try to go right, prefering same row
		if (curr_column < _col) {
			if (curr_column % 2 == 0) {
				if (_downright_isempty) { move_enemy(6); slay_anicius(_row, _col); }
				else if (_upright_isempty) { move_enemy(1); slay_anicius(_row, _col); }
			}
			else {
				if (_upright_isempty) { move_enemy(1); slay_anicius(_row, _col); }
				else if (_downright_isempty) { move_enemy(6); slay_anicius(_row, _col); }
			}
		}
		//Try to go left, prefering same row
		else if (curr_column > _col) {
			if (curr_column % 2 == 0) {
				if (_downleft_isempty) { move_enemy(4); slay_anicius(_row, _col); }
				else if (_upleft_isempty) { move_enemy(3); slay_anicius(_row, _col); }
			}
			else {
				if (_upleft_isempty) { move_enemy(3); slay_anicius(_row, _col); }
				else if (_downleft_isempty) { move_enemy(4); slay_anicius(_row, _col); }
			}
		}
	}
	//Try to go up or right
	else if (curr_row > _row and curr_column < _col) {
		if (_upright_isempty) { move_enemy(1); slay_anicius(_row, _col); }
		else if (_up_isempty) { move_enemy(2); slay_anicius(_row, _col); }
	}
	//Try to go up or left
	else if (curr_row > _row and curr_column > _col) {
		if (_upleft_isempty) { move_enemy(3); slay_anicius(_row, _col); }
		else if (_up_isempty) { move_enemy(2); slay_anicius(_row, _col); }
	}
	//Try to go down or left
	else if (curr_row < _row and curr_column > _col) {
		if (_downleft_isempty) { move_enemy(4); slay_anicius(_row, _col); }
		else if (_down_isempty) { move_enemy(5); slay_anicius(_row, _col); }
	}
	//Try to go down or right
	else if (curr_row < _row and curr_column < _col) {
		if (_downright_isempty) { move_enemy(6); slay_anicius(_row, _col); }
		else if (_down_isempty) { move_enemy(5); slay_anicius(_row, _col); }
	}
}
