/// @description Move and Bounce

//if despawning, don't move/bounce
if(sprite_index == spr_onion_ring_despawn)
	return;
	

//calculate bounce and move speed
vert_speed += grav;



//---------------- VERTICAL COLLISION/MOVEMENT -------------------

//if spawned in wall, move onion ring without any collisions, until outside of wall
if(bottom_in_wall) {
	self.y += vert_speed;
	
	//if no longer in wall, turn on vertical collisions
	if(!place_meeting(x, y + vert_speed, special_attack_collision_layer()))
		bottom_in_wall = false;
}
//if hit ceiling bounce down
else if((vert_speed <= 0) && place_meeting(x, y - (self.sprite_height/20), special_attack_collision_layer()))
	vert_speed = bounce_down_speed;

//if hit floor bounce up
else if((vert_speed >= 0) && place_meeting(x, y + vert_speed, special_attack_collision_layer()))
	vert_speed = bounce_up_speed;

//if not colliding, move 
else
	self.y += vert_speed;





//-------------- HORIZONTAL COLLISION/MOVEMENT -------------------------

//if spawned in wall, move onion ring without any collisions, until outside of wall
if(side_in_wall) {
	self.x += hor_speed * dir;
	
	//if no longer in wall, turn on horizontal collisions
	if(!place_meeting(x + (hor_speed * dir), y, special_attack_collision_layer()))
		side_in_wall = false;
}
//if colliding with wall, despawn in 1 second
else if(place_meeting(x + (hor_speed * dir), y, special_attack_collision_layer()) && !side_in_wall) {
	sprite_index = spr_onion_ring_despawn;
	audio_play_sound(snd_onion_ring_despawn, 5, false);
}
//if not colliding, move horizontally
else
	self.x += hor_speed * dir;
