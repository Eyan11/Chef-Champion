
/// @function					object_vert_collide_and_move(_obj, _vert_speed);
/// @description				Checks for collision and moves object vertically
function object_vert_collide_and_move(_obj, _vert_speed) {
	//if about to collide in vertical direction
	if(place_meeting(_obj.x, _obj.y + _vert_speed, collision_layer())) {
	
		//while moving vertically, reduce speed until 0
		while(abs(_vert_speed) > 0.1) {
			
			_vert_speed *= 0.5;
		
			//if new projected position isn't colliding, move closer to collider
			if(!place_meeting(_obj.x, _obj.y + _vert_speed, collision_layer()))
				_obj.y += _vert_speed;
		}
		//if obj can't move any close to collider, stop moving
		_vert_speed = 0;
	}

	//move obj vertically
	_obj.y += _vert_speed;
}



/// @function					object_hor_collide_and_move(_obj, _hor_speed);
/// @description				Checks for collision and moves object horizontally
function object_hor_collide_and_move(_obj, _hor_speed) {
	
	//if about to collide in vertical direction
	if(place_meeting(_obj.x + _hor_speed, _obj.y, collision_layer())) {
	
		//while moving vertically, reduce speed until 0
		while(abs(_hor_speed) > 0.1) {
			
			_hor_speed *= 0.5;
		
			//if new projected position isn't colliding, move closer to collider
			if(!place_meeting(_obj.x + _hor_speed, _obj.y, collision_layer()))
				_obj.x += _hor_speed;
		}
		//if obj can't move any close to collider, stop moving
		_hor_speed = 0;
	}

	//move obj horizontally
	_obj.x += _hor_speed;
}