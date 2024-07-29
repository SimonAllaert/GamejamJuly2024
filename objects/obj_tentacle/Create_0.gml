curr_row = 0;
curr_column = 0;
direction_number = 0;

function spawn(_direction_number, _row, _col) {
	var _coords = noone;
	direction_number = _direction_number;
	switch (_direction_number) {
		case 1:
			_coords = get_upright_coords(_row, _col);
			curr_row = _coords[0];
			curr_column = _coords[1];
			break;
		case 2:
			_coords = get_up_coords(_row, _col);
			curr_row = _coords[0];
			curr_column = _coords[1];
			break;
		case 3:
			_coords = get_upleft_coords(_row, _col);
			curr_row = _coords[0];
			curr_column = _coords[1];
			break;
		case 4:
			_coords = get_downleft_coords(_row, _col);
			curr_row = _coords[0];
			curr_column = _coords[1];
			break;
		case 5:
			_coords = get_down_coords(_row, _col);
			curr_row = _coords[0];
			curr_column = _coords[1];
			break;
		case 6:
			_coords = get_downleft_coords(_row, _col);
			curr_row = _coords[0];
			curr_column = _coords[1];
			break;
		default: break;
	}
}