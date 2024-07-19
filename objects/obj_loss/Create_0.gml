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

function step_tilepoint(_c) {
	tilepoint_x += 36;
		if (_c % 2 > 0) {
			tilepoint_y -= 24;
		}
		else {
			tilepoint_y += 24;
		}
}

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
			//instance_create_depth(tilepoint_x, tilepoint_y, 50, obj_walkway);
			instance_create_depth(tilepoint_x, tilepoint_y, 0, obj_anicius);
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
