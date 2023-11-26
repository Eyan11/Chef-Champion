/// @description Follow player

//despawn if player is dead or stopped burning
if(!following_enemy && 
	(obj_to_follow.is_dead == true || obj_to_follow.is_burning == false)) {
	
	audio_stop_sound(snd_fire);
	instance_destroy(self);
}
//despawn if enemy is dead or stopped burning
else if(following_enemy && 
	(obj_to_follow.current_health <= 0 || obj_to_follow.isBurning == false)) {
		
	audio_stop_sound(snd_fire);
	instance_destroy(self);
}
//follow burning obj
else {
	self.x = obj_to_follow.x;
	self.y = obj_to_follow.y;
}













