curr_row = 0;
curr_column = 0;

tentacles = [];

array_push(tentacles, instance_create_depth(x + 36, y - 24, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x, y - 48, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x - 36, y - 24, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x - 36, y + 24, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x, y + 48, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x + 36, y + 24, 20, obj_tentacle));

function spawn_tentacles() {
	for (var _i = 0; _i < array_length(tentacles); ++_i) {
		tentacles[_i].spawn(_i+1, curr_row, curr_column);
	}
}

function take_action(_row, _col) {
	
	return;
}

function slay_anicius(_row, _col) {
	if (curr_row == _row and curr_column == _col) {
		instance_find(obj_anicius, 0).kill_anicius();
	}
}
