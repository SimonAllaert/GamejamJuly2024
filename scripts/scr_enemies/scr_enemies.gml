function give_enemy_action() {
	for (var _i = 0; _i < instance_number(obj_enemy); ++_i) {
		instance_find(obj_enemy, _i).take_action();
	}
}

function get_enemy_on_hex(_row, _col){
	for (var _i = 0; _i < instance_number(obj_enemy); ++_i) {
		var _enemy = instance_find(obj_enemy, _i);
		if (_enemy.curr_row == _row and _enemy.curr_column == _col) {
			return _enemy;
		}
	}
	return noone;
}

function upright_is_enemy(_row, _col) {
	var _coords = get_upright_coords(_row, _col);
	return get_enemy_on_hex(_coords[0], _coords[1]);
}

function up_is_enemy(_row, _col) {
	var _coords = get_up_coords(_row, _col);
	return get_enemy_on_hex(_coords[0], _coords[1]);
}

function upleft_is_enemy(_row, _col) {
	var _coords = get_upleft_coords(_row, _col);
	return get_enemy_on_hex(_coords[0], _coords[1]);
}

function downleft_is_enemy(_row, _col) {
	var _coords = get_downleft_coords(_row, _col);
	return get_enemy_on_hex(_coords[0], _coords[1]);
}

function down_is_enemy(_row, _col) {
	var _coords = get_down_coords(_row, _col);
	return get_enemy_on_hex(_coords[0], _coords[1]);
}

function downright_is_enemy(_row, _col) {
	var _coords = get_downright_coords(_row, _col);
	return get_enemy_on_hex(_coords[0], _coords[1]);
}

function kill_enemy_on_hex(_row, _col) {
	var _enemy = get_enemy_on_hex(_row, _col);
	if (_enemy != noone) {
		instance_destroy(_enemy);
		return true;
	}
	return false;
}

function blowback_enemy_on_hex(_row, _col, _direction) {
	var _enemy = get_enemy_on_hex(_row, _col);
}