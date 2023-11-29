/// @description Move and Bounce

//if despawning, don't move/bounce
if(sprite_index == spr_onion_ring_despawn)
	return;
	

//calculate bounce and move speed
vert_speed += grav;

//if colliding with wall, despawn in 1 second
if(place_meeting(x + (hor_speed * dir), y, special_attack_collision_layer())) {
	sprite_index = spr_onion_ring_despawn;
}
//if colliding with floor, bounce upwards
else if(place_meeting(x, y + vert_speed, special_attack_collision_layer())) {
	vert_speed = bounce_speed;
}
//if not colliding, move in x and y direction
else {
	self.x += hor_speed * dir;
	self.y += vert_speed;
}


