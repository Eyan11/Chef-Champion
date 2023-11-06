
//movement
player_movement_calculations(self);

player_roll(self);

player_jump(self);

player_collision_and_move(self);


//TODO: Change sprite depending on current character
//animations and sounds
//roll
if(is_rolling)
	self.sprite_index = spr_pastry_roll;
	
//start jump
else if(jump_is_starting) {
	self.sprite_index = spr_pastry_jump;
	audio_play_sound(snd_player_jump, 5, false);

	if(image_index >= image_number - image_speed) {
		self.sprite_index = spr_pastry_air;	
		jump_is_starting = false;
	}	
}

//in air
else if(!is_grounded && !jump_is_starting)
	self.sprite_index = spr_pastry_air;	

//landing
else if((is_grounded && self.sprite_index == spr_pastry_air) || jump_is_ending) {
	self.sprite_index = spr_pastry_land;
	audio_play_sound(snd_player_land, 5, false);
	jump_is_ending = true;
	
	if(image_index >= image_number - image_speed)
		jump_is_ending = false;
}

//walking
else if(abs(hor_speed) > 0) {
	self.sprite_index = spr_pastry_move;
	if(!audio_is_playing(snd_player_walk))
		audio_play_sound(snd_player_walk, 5, false);
}

//idle
else
	self.sprite_index = spr_pastry_idle;


//special countdowns
special_meter_regen_countdown--;
special_cooldown_countdown--;

//regen after cooldown
if(special_meter_regen_countdown < 0)
	regenerate_special_meter(self);
	
//jump special
if(special_input() && can_jump_special && !is_grounded && !is_rolling && 
	(jump_special_cost <= current_special_meter) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, jump_special_cost);
	jump_special(self, obj_special_eclair, jump_special_spawn_offset);
	special_cooldown_countdown = special_cooldown;
	//can't jump special until they are grounded again
	can_jump_special = false;
}

//reset jump special (because you can only use jump special once while in the air)
if(is_grounded)
	can_jump_special = true;
