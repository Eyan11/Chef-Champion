/// @description fall down

//acceleration
fall_speed += grav;

object_vert_collide_and_move(self, fall_speed);

//if colliding with ground and not already playing impact audio
if(place_meeting(self.x, self.y + self.sprite_height/2, collision_layer()) 
	&& !audio_is_playing(snd_cake_impact)) {
		
	self.is_damage_frame = true;
		
	audio_stop_sound(snd_cake_fall);
	audio_play_sound(snd_cake_impact, 5, false);
	alarm[0] = 30; // destroy in 0.5 seconds
}
else {
	self.is_damage_frame = false;
}
	
/*
despawn_time--;

if(despawn_time == 0)
	instance_destroy(self);
*/



