if (anicius != noone) {
	var _inv = anicius.inventory;
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 192, room_width, 192+48)) {
		if (_inv[0] == 0) {
			anicius.brew_pot(0);
		}
		else {
			anicius.drink_pot(0);
		}
	}

	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 264, room_width, 264+48)) {
		if (_inv[1] == 0) {
			anicius.brew_pot(1);
		}
		else {
			anicius.drink_pot(1);
		}
	}

	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 336, room_width, 336+48)) {
		if (_inv[2] == 0) {
			anicius.brew_pot(2);
		}
		else {
			anicius.drink_pot(2);
		}
	}

	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 408, room_width, 408+48)) {
		if (_inv[3] == 0) {
			anicius.brew_pot(3);
		}
		else {
			anicius.drink_pot(3);
		}
	}
}