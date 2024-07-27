function get_upright_coords(_row, _col) {
	if (_col % 2 == 0) {
		return [_row-1, _col+1];
	}
	else {
		return [_row, _col+1];
	}
}

function get_up_coords(_row, _col) {
	return [_row-1, _col];
}

function get_upleft_coords(_row, _col) {
	if (_col % 2 == 0) {
		return [_row-1, _col-1];
	}
	else {
		return [_row, _col-1];
	}
}

function get_downleft_coords(_row, _col) {
	if (_col % 2 != 0) {
		return [_row+1, _col-1];
	}
	else {
		return [_row, _col-1];
	}
}

function get_down_coords(_row, _col) {
	return [_row+1, _col];
}

function get_downright_coords(_row, _col) {
	if (_col % 2 != 0) {
		return [_row+1, _col+1];
	}
	else {
		return [_row, _col+1];
	}
}

function upright_is_wall(_row, _col) {
	var _coords = get_upright_coords(_row, _col);
	var _output = global.layout[_coords[0]][_coords[1]]
	return _output == 1;
}

function up_is_wall(_row, _col) {
	var _coords = get_up_coords(_row, _col);
	return global.layout[_coords[0]][_coords[1]] == 1;
}

function upleft_is_wall(_row, _col) {
	var _coords = get_upleft_coords(_row, _col);
	return global.layout[_coords[0]][_coords[1]] == 1;
}

function downleft_is_wall(_row, _col) {
	var _coords = get_downleft_coords(_row, _col);
	return global.layout[_coords[0]][_coords[1]] == 1;
}

function down_is_wall(_row, _col) {
	var _coords = get_down_coords(_row, _col);
	return global.layout[_coords[0]][_coords[1]] == 1;
}

function downright_is_wall(_row, _col) {
	var _coords = get_downright_coords(_row, _col);
	return global.layout[_coords[0]][_coords[1]] == 1;
}

function upright_is_empty(_row, _col) {
	return !upright_is_wall(_row, _col) and !upright_is_enemy(_row, _col);
}

function up_is_empty(_row, _col) {
	return !up_is_wall(_row, _col) and !up_is_enemy(_row, _col);
}

function upleft_is_empty(_row, _col) {
	return !upleft_is_wall(_row, _col) and !upleft_is_enemy(_row, _col);
}

function downleft_is_empty(_row, _col) {
	return !downleft_is_wall(_row, _col) and !downleft_is_enemy(_row, _col);
}

function down_is_empty(_row, _col) {
	return !down_is_wall(_row, _col) and !down_is_enemy(_row, _col);
}

function downright_is_empty(_row, _col) {
	return !downright_is_wall(_row, _col) and !downright_is_enemy(_row, _col);
}

function random_legal_move(_row, _col) {
	var _empty_moves = [];
	if (upright_is_empty(_row, _col)) {
		array_push(_empty_moves, 1);
	}
	if (up_is_empty(_row, _col)) {
		array_push(_empty_moves, 2);
	}
	if (upleft_is_empty(_row, _col)) {
		array_push(_empty_moves, 3);
	}
	if (downleft_is_empty(_row, _col)) {
		array_push(_empty_moves, 4);
	}
	if (down_is_empty(_row, _col)) {
		array_push(_empty_moves, 5);
	}
	if (downright_is_empty(_row, _col)) {
		array_push(_empty_moves, 6);
	}
	if (array_length(_empty_moves) == 0) {
		return 0;
	}
	else {
		return _empty_moves[irandom(array_length(_empty_moves)-1)];
	}
}

function hex_to_pixel(_row, _col) {
	return (_col % 2 == 1) 
				? [global.origin[0] + _col * 36, global.origin[1] + 24 + _row * 48] 
				: [global.origin[0] + _col * 36, global.origin[1] + _row * 48]
}

function upright_line_to_anicius(_row_anicius, _col_anicius, _coords) {
	while (!(_coords[0] == _row_anicius and _coords[1] == _col_anicius)) {
		if (upright_is_wall(_coords[0], _coords[1])) { return false; }
		else { _coords = get_upright_coords(_coords[0], _coords[1]); }
	}
	return true;
}

function upleft_line_to_anicius(_row_anicius, _col_anicius, _coords) {
	while (!(_coords[0] == _row_anicius and _coords[1] == _col_anicius)) {
		if (upleft_is_wall(_coords[0], _coords[1])) { return false; }
		else { _coords = get_upleft_coords(_coords[0], _coords[1]); }
	}
	return true;
}

function downleft_line_to_anicius(_row_anicius, _col_anicius, _coords) {
	while (!(_coords[0] == _row_anicius and _coords[1] == _col_anicius)) {
		if (downleft_is_wall(_coords[0], _coords[1])) { return false; }
		else { _coords = get_downleft_coords(_coords[0], _coords[1]); }
	}
	return true;
}

function downright_line_to_anicius(_row_anicius, _col_anicius, _coords) {
	while (!(_coords[0] == _row_anicius and _coords[1] == _col_anicius)) {
		if (downright_is_wall(_coords[0], _coords[1])) { return false; }
		else { _coords = get_downright_coords(_coords[0], _coords[1]); }
	}
	return true;
}