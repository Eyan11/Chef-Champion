/// @description Follow player
	
//despawn if player is dead or stopped frosting
if(!following_enemy && !is_despawning &&
	(obj_to_follow.is_dead == true || obj_to_follow.is_frosted == false)) {
	
	audio_stop_sound(snd_frosting);
	is_despawning = true;
}
//despawn if enemy is dead or stopped frosting
else if(following_enemy && !is_despawning &&
	(obj_to_follow.current_health <= 0 || obj_to_follow.isSlowed == false)) {
		
	audio_stop_sound(snd_frosting);
	is_despawning = true;
}
//follow frosted obj
else {
	self.x = obj_to_follow.x;
	self.y = obj_to_follow.y;
	
	//frosting matches the size of the obj
	self.image_xscale = (abs(obj_to_follow.sprite_width)/64) * 0.9;
	self.image_yscale = self.image_xscale;
}


//Make frosting more opaque every step
if(is_despawning)
	self.image_alpha *= 0.95;
//despawn sprite once almost invisible
else if(is_despawning && self.image_alpha <= 0.1)
	instance_destroy(self);
	