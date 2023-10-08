/// @functin					player_movement(_player);
/// @description				Movement, jump, and collision for a player object

function player_movement(_player){

//set horizontal and vertical speed
hor_speed = hor_move_input() * walk_speed;
vert_speed += grav;

//reduce coyote jump timer
can_jump_countdown--;
//reduce variable jump height timer
variable_jump_countdown--;

//minimum jump height
if( (can_jump_countdown > 0) && (jump_input()) ) {
	
	vert_speed = jump_speed;
	variable_jump_countdown = variable_jump_time;
	can_jump_countdown = 0;
}

//variable jump height
if( (variable_jump_countdown > 0) && (jump_input()) ) {
	
	vert_speed = jump_speed
}

//horizontal movement and collision
//if about to collide in horizontal direction
if(place_meeting(_player.x + hor_speed, _player.y, collision_layer())) {
	
	//while moving horizontally, reduce speed by hald
	while(abs(hor_speed) > 0.1) {
		hor_speed *= 0.5;
		
		//if new projected position isn't colliding, move closer to collider
		if(!place_meeting(_player.x + hor_speed, _player.y, collision_layer()))
			_player.x += hor_speed;
	}
	hor_speed = 0;
}

_player.x += hor_speed;

//vertical movement and collision
//if about to collide in vertical direction
if(place_meeting(_player.x, _player.y + vert_speed, collision_layer())) {
	
	//if grounded, reset jump timer to coyote time
	if(vert_speed > 0)
		can_jump_countdown = coyote_time;
	
	//while moving vertically, reduce speed until 0
	while(abs(vert_speed) > 0.1) {
		vert_speed *= 0.5;
		
		//if new projected position isn't colliding, move closer to collider
		if(!place_meeting(_player.x, _player.y + vert_speed, collision_layer()))
			_player.y += vert_speed;
	}
	vert_speed = 0;
}

_player.y += vert_speed;

//makes player face movement direction
if(hor_speed != 0)
	_player.image_xscale = sign(hor_speed);

}