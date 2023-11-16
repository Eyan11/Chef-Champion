
//movement
if(!is_dead) {
	player_movement_calculations(self);
	player_roll(self);
	player_jump(self);
}

player_collision_and_move(self);


//TODO: Change sprite depending on current character
//animations and sounds

//death
if(is_dead) {
	self.sprite_index = spr_pastry_death;
	if(!audio_is_playing(snd_player_death))
		audio_play_sound(snd_player_death, 5, false);
}

//roll
else if(is_rolling) {
	self.sprite_index = spr_pastry_roll;
	if(!audio_is_playing(snd_player_roll))
		audio_play_sound(snd_player_roll, 5, false);
}
	
//start jump and in air
else if(!is_grounded) {
	self.sprite_index = spr_pastry_jump;
	if(!audio_is_playing(snd_player_jump) && vert_speed <= jump_speed)
		audio_play_sound(snd_player_jump, 5, false);
}

//landing
else if((self.sprite_index == spr_pastry_jump)) {
	//Extra: add landing anim, right now it's only playing for 1 step
	self.sprite_index = spr_pastry_land;
	if(!audio_is_playing(snd_player_land))
		audio_play_sound(snd_player_land, 5, false);
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
<<<<<<< HEAD
if(special_input() && can_jump_special && !is_grounded && !is_rolling && 
	(jump_special_cost <= current_special_meter) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, jump_special_cost);
	jump_special(self, obj_special_eclair, jump_special_spawn_offset);
	special_cooldown_countdown = special_cooldown;
	//can't jump special until they are grounded again
	can_jump_special = false;
}

//reset jump special (because you can only use jump special once while in the air)
=======
if(special_input() && can_jump_special && !is_grounded && !is_rolling && (jump_special_cost <= current_special_meter))
	jump_special(self, obj_special_eclair)

//because you can only use jump special once while in the air
>>>>>>> parent of 7c5b059 (obstacles and more)
if(is_grounded)
	can_jump_special = true;
