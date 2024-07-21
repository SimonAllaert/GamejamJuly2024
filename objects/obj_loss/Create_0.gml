//Nothing = 0, Wall = 1, Path = 2, Spawn = 3, Goal = 4
layout = [
	[0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
	[1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1],
	[1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 2, 1],
	[1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 2, 1],
	[1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1],
	[1, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1],
	[1, 2, 2, 1, 2, 1, 2, 2, 3, 2, 1, 2, 4, 2, 1, 2, 2, 2, 2, 2, 1],
	[1, 2, 2, 1, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 1, 1, 1, 1, 2, 2, 1],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
	[1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1],
	[0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0],
];

tilepoint_x = 48;
tilepoint_y = 48;

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
for (var _r = 0; _r < array_length(layout); ++_r) {
	for (var _c = 0; _c < array_length(layout[0]); ++_c) {
		if (layout[_r][_c] == 0) {
			step_tilepoint(_c);
			continue;
		}
		else if (layout[_r][_c] == 1) {
			instance_create_depth(tilepoint_x, tilepoint_y, 30, obj_wall);
			step_tilepoint(_c);
		}
		else if (layout[_r][_c] == 2) {
			instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
			step_tilepoint(_c);
		}
		else if (layout[_r][_c] == 3) {
			instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
			anicius = instance_create_depth(tilepoint_x, tilepoint_y,10, obj_anicius);
			anicius.curr_row = _r;
			anicius.curr_column = _c;
			anicius.layout = layout;
			anicius.inventory = [1, 1, 1, 1];
			step_tilepoint(_c);
		}
		else if (layout[_r][_c] == 4) {
			step_tilepoint(_c);
			continue;
		}
	}
	tilepoint_x = 48
	tilepoint_y += 24;
}
