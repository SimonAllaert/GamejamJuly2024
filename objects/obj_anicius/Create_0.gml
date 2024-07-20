layout = []
curr_row = 0;
curr_column = 0;

curr_mouse_angle = 0

is_moving = false;
target_x = x;
target_y = y;

function move_anicius(_direction_number) {
	//Handles pixel movement and updates row and column coords
	//Direction is based of _direction_number; 1 is up-right continueing counter-clockwise
	if (is_moving) {
		return
	}
	is_moving = true
	switch (_direction_number){
		//Move up-right
		case 1: 
			target_x = x + 36
			target_y = y - 24
			if (curr_column % 2 == 0) {
				curr_row -= 1
			}
			curr_column += 1
		break;
		//Move straight up
		case 2: 
			target_x = x
			target_y = y - 48
			curr_row -= 1
		break;
		//Move up-left
		case 3: 
			target_x = x - 36
			target_y = y - 24
			if (curr_column % 2 == 0) {
				curr_row -= 1
			}
			curr_column -= 1
		break;
		//Move down-left
		case 4: 
			target_x = x - 36
			target_y = y + 24
			if (curr_column % 2 != 0) {
				curr_row += 1
			}
			curr_column -= 1
		break;
		//Move straight down
		case 5: 
			target_x = x
			target_y = y + 48
			curr_row += 1
		break;
		//Move down-right
		case 6: 
			target_x = x + 36
			target_y = y + 24
			if (curr_column % 2 != 0) {
				curr_row += 1
			}
			curr_column += 1
		break;
		default:
			return;
	}
	return;
}

function upright_is_wall() {
	if (curr_column % 2 == 0) {
		return layout[curr_row-1][curr_column+1] == 1
	}
	else {
		return layout[curr_row][curr_column+1] == 1
	}
}

function up_is_wall() {
	return layout[curr_row-1][curr_column] == 1
}

function upleft_is_wall() {
	if (curr_column % 2 == 0) {
		return layout[curr_row-1][curr_column-1] == 1
	}
	else {
		return layout[curr_row][curr_column-1] == 1
	}
}

function downleft_is_wall() {
	if (curr_column % 2 != 0) {
		return layout[curr_row+1][curr_column-1] == 1
	}
	else {
		return layout[curr_row][curr_column-1] == 1
	}
}

function down_is_wall() {
	return layout[curr_row+1][curr_column] == 1
}

function downright_is_wall() {
	if (curr_column % 2 != 0) {
		return layout[curr_row+1][curr_column+1] == 1
	}
	else {
		return layout[curr_row][curr_column+1] == 1
	}
}