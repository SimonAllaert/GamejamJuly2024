
// Inherit the parent event
event_inherited();

tentacles = [];

array_push(tentacles, instance_create_depth(x + 36, y - 24, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x, y - 48, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x - 36, y - 24, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x - 36, y + 24, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x, y + 48, 20, obj_tentacle));
array_push(tentacles, instance_create_depth(x + 36, y + 24, 20, obj_tentacle));

for (var _i = 0; _i < array_length(tentacles); ++_i) {
	tentacles[_i].direction_number = _i + 1;
	tentacles[_i].image_angle = 30 + 60*_i;
}

function take_action(_row, _col) {
	//TODO boss attacks (tentacle jab, tentacle swipe, eye lazer, spawn enemies)
}

function enemy_in_vision() { return true; }

function move_enemy(_direction_number) { return; }

function get_knocked(_direction_number) { return; }

function move_coords(_direction_number) { return; }

