if (anicius != noone) {
	var _firepots = "x" + string(anicius.inventory[1]);
	var _fire_hover = false;
	var _dashpots = "x" + string(anicius.inventory[2]);
	var _dash_hover = false;
	var _blowpots = "x" + string(anicius.inventory[3]);
	var _blow_hover = false;
	var _emptypots = "x" + string(anicius.inventory[0]);
	var _empty_hover = false;
	
	draw_text_transformed_color(room_width - 72, 192+15, _firepots, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 192, room_width, 192+48)) {
		draw_sprite(spr_potion_fire, 1, room_width, 192);
		_fire_hover = true;
	}
	else {
		draw_sprite(spr_potion_fire, 0, room_width, 192);
	}

	draw_text_transformed_color(room_width - 72, 264+15, _dashpots, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 264, room_width, 264+48)) {
		draw_sprite(spr_potion_dashing, 1, room_width, 264);
		_dash_hover = true;
	}
	else {
		draw_sprite(spr_potion_dashing, 0, room_width, 264);
	}

	draw_text_transformed_color(room_width - 72, 336+15, _blowpots, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 336, room_width, 336+48)) {
		draw_sprite(spr_potion_blowback, 1, room_width, 336);
		_blow_hover = true;
	}
	else{
		draw_sprite(spr_potion_blowback, 0, room_width, 336);
	}

	draw_text_transformed_color(room_width - 72, 408+15, _emptypots, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 48, 408, room_width, 408+48)) {
		draw_sprite(spr_potion_empty, 1, room_width, 408);
		_empty_hover = true;
	}
	else {
		draw_sprite(spr_potion_empty, 0, room_width, 408);
	}
	anicius.potion_hover = _fire_hover or _dash_hover or _blow_hover or _empty_hover;
}