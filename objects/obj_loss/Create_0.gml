
//Nothing = 0, Wall = 1, Path = 2, Spawn = 3, Goal = 4, Rat = 5
variable_global_set("layout", [
	[0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
	[1, 2, 5, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 5, 2, 2, 2, 1],
	[1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 2, 1],
	[1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 2, 1],
	[1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1],
	[1, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1],
	[1, 2, 2, 1, 2, 1, 2, 2, 3, 2, 1, 2, 4, 2, 1, 2, 2, 2, 2, 2, 1],
	[1, 2, 2, 1, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 1, 1, 1, 1, 2, 2, 1],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
	[1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1],
	[0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0],
]);

variable_global_set("origin", [48, 48])

tilepoint_x = global.origin[0];
tilepoint_y = global.origin[1];

anicius = noone;

sync_group = audio_create_sync_group(true);

audio_play_in_sync_group(sync_group,snd_bass);
audio_play_in_sync_group(sync_group,snd_pino);
audio_play_in_sync_group(sync_group,snd_drum);
audio_play_in_sync_group(sync_group,snd_cello)
audio_sound_gain(snd_pino,1,0);

//audio_start_sync_group(sync_group);


//Helper function for generating tiles
function step_tilepoint(_c) {
	tilepoint_x += 36;
		if (_c % 2 > 0) {
			tilepoint_y -= 24;
		}
		else {
			tilepoint_y += 24;
		}
}

//Generates tiles accoring to layout arrays
//New version with switch case and with updating tile variables
function generate_map_new() {
	for (var _r = 0; _r < array_length(global.layout); ++_r) {
		for (var _c = 0; _c < array_length(global.layout[0]); ++_c) {
			tile = noone
			switch (global.layout[_r][_c]) {
				case 0: tile = noone; break;
				case 1: tile = instance_create_depth(tilepoint_x, tilepoint_y, 30, obj_wall); break;
				case 2: tile = instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway); break;
				case 3: 
					tile = instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
					anicius = instance_create_depth(tilepoint_x, tilepoint_y, 10, obj_anicius);
					anicius.curr_row = _r;
					anicius.curr_column = _c;
					anicius.inventory = [1, 1, 1, 1];
					break;
				case 4: tile = noone; break;
				case 5: 
					tile = instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
					rat = instance_create_depth(tilepoint_x, tilepoint_y, 10, obj_rat);
					rat.curr_row = _r;
					rat.curr_column = _c;
					break;
			}
			if tile != noone {
				tile.real_x = tilepoint_x
				tile.real_y = tilepoint_y
				tile.row = _r
				tile.col = _c
			}
			step_tilepoint(_c)
		}
		tilepoint_x = 48
		tilepoint_y += 24;
	}
}


//Generates tiles accoring to layout arrays
function generate_map_old () {
	for (var _r = 0; _r < array_length(global.layout); ++_r) {
		for (var _c = 0; _c < array_length(global.layout[0]); ++_c) {
			if (global.layout[_r][_c] == 0) {
				step_tilepoint(_c);
				continue;
			}
			else if (global.layout[_r][_c] == 1) {
				instance_create_depth(tilepoint_x, tilepoint_y, 30, obj_wall);
				step_tilepoint(_c);
			}
			else if (global.layout[_r][_c] == 2) {
				instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
				step_tilepoint(_c);
			}
			else if (global.layout[_r][_c] == 3) {
				instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
				anicius = instance_create_depth(tilepoint_x, tilepoint_y, 10, obj_anicius);
				anicius.curr_row = _r;
				anicius.curr_column = _c;
				anicius.inventory = [1, 1, 1, 1];
				step_tilepoint(_c);
			}
			else if (global.layout[_r][_c] == 4) {
				step_tilepoint(_c);
				continue;
			}
			else if (global.layout[_r][_c] == 5) {
				instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
				var _rat = instance_create_depth(tilepoint_x, tilepoint_y, 10, obj_rat);
				_rat.curr_row = _r;
				_rat.curr_column = _c;
				step_tilepoint(_c);
			}
		}
		tilepoint_x = 48
		tilepoint_y += 24;
	}
}

//generate_map_old()
generate_map_new()
