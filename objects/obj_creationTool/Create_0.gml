var _horizontal = 0;
var _vertical = 0;

var _cell_x = 65;
var _cell_y = 89;

var stack = 0;
var stackHalf = 0;

repeat(10){
	repeat(20){
		var xx = (_horizontal * _cell_x) + _vertical * (_cell_x/2);
		var yy = (_vertical * _cell_y/1.25);
		instance_create_layer(x+xx, y+yy, layer, obj_hexEmpty);
		
		_horizontal++;
	}

stackHalf++;
if(stackHalf >= 2){ stackHalf = 0; stack++;}

_horizontal = 0-stack;
_vertical++;
}