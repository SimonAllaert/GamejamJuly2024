
event_inherited();

//Nothing = 0, Wall = 1, Path = 2, Spawn = 3, Goal = 4, Rat = 5, Dragon = 6
variable_global_set("layout", [
	[0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 4, 2, 1],
	[1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1],
	[0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0],
]);

variable_global_set("origin", [48, 48])

tilepoint_x = global.origin[0];
tilepoint_y = global.origin[1];

//audio_start_sync_group(sync_group);

generate_map_new()
