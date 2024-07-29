if (!locked) {
	//Move action
	if (!is_moving and !potion_hover and potion_active == 0) {
		if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and upright_is_empty(curr_row, curr_column)) {
			move_anicius(1);
			give_enemy_action(curr_row, curr_column);
		}
		else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and up_is_empty(curr_row, curr_column)) {
			move_anicius(2);
			give_enemy_action(curr_row, curr_column);
		}
		else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and upleft_is_empty(curr_row, curr_column)) {
			move_anicius(3);
			give_enemy_action(curr_row, curr_column);
		}
		else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and downleft_is_empty(curr_row, curr_column)) {
			move_anicius(4);
			give_enemy_action(curr_row, curr_column);
		}
		else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and down_is_empty(curr_row, curr_column)) {
			move_anicius(5);
			give_enemy_action(curr_row, curr_column);
		}
		else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and downright_is_empty(curr_row, curr_column)) {
			move_anicius(6);
			give_enemy_action(curr_row, curr_column);
		}
	audio_play_sound(snd_step,0,0,1,0,1,1);	
	}
	//Cast fire action	
	else if (!potion_hover and potion_active == 1) {
		if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and !upright_is_wall(curr_row, curr_column)) {
			cast_fire(1);
		}
		else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and !up_is_wall(curr_row, curr_column)) {
			cast_fire(2);
		}
		else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and !upleft_is_wall(curr_row, curr_column)) {
			cast_fire(3);
		}
		else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and !downleft_is_wall(curr_row, curr_column)) {
			cast_fire(4);
		}
		else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and !down_is_wall(curr_row, curr_column)) {
			cast_fire(5);
		}
		else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and !downright_is_wall(curr_row, curr_column)) {
			cast_fire(6);
		}
		audio_play_sound(snd_fire,0,0,1,0,1,1);
	}
	//Cast dash action
	else if (!potion_hover and potion_active == 2) {
		if (curr_mouse_angle >= 0 and curr_mouse_angle < 60 and !upright_is_wall(curr_row, curr_column)) {
			cast_dash(1);
		}
		else if (curr_mouse_angle >= 60 and curr_mouse_angle < 120 and !up_is_wall(curr_row, curr_column)) {
			cast_dash(2);
		}
		else if (curr_mouse_angle >= 120 and curr_mouse_angle < 180 and !upleft_is_wall(curr_row, curr_column)) {
			cast_dash(3);
		}
		else if (curr_mouse_angle >= 180 and curr_mouse_angle < 240 and !downleft_is_wall(curr_row, curr_column)) {
			cast_dash(4);
		}
		else if (curr_mouse_angle >= 240 and curr_mouse_angle < 300 and !down_is_wall(curr_row, curr_column)) {
			cast_dash(5);
		}
		else if (curr_mouse_angle >= 300 and curr_mouse_angle < 360 and !downright_is_wall(curr_row, curr_column)) {
			cast_dash(6);
		}
		audio_play_sound(snd_run, 0,0,1,0,1,1)
	}
	//Cast blowback action
	else if (!potion_hover and potion_active == 3) {
		cast_blowback();
		audio_play_sound(snd_wind,0,0,1,0,1,1);
	}
	//Cast lightning action
	else if (!potion_hover and potion_active == 4) {
		cast_lightning();
		audio_play_sound(snd_lightning, 0,0,1,0,1,1);
	}
}
else if (is_dead) {
	
	room_restart();
		
}
