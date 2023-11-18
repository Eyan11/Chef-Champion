/// @description fall down

//acceleration
fall_speed += grav;

//move downwards
object_vert_collide_and_move(self, fall_speed);

//if colliding with ground and still on falling anim
if(place_meeting(self.x, self.bbox_bottom, special_attack_collision_layer()) 
	&& self.sprite_index == spr_cake_fall) {
		
	//play exploding sprite and audio
	self.sprite_index = spr_cake_explode;
	audio_stop_sound(snd_cake_fall);
	audio_play_sound(snd_cake_impact, 5, false);
}

//deal damage on the frame the cake explodes
if(image_index == 15)
	self.is_exploding = true;
else
	self.is_exploding = false;

