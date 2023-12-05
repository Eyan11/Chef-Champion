 audio_listener_position(x,y,0)//spatial sound connector 
 
//movement
if(!is_dead) {
	player_movement_calculations(self);
	player_roll(self);
	player_jump(self);
}
else {
	//stop moving when dead (except for gravity)
	self.hor_speed = 0;
	self.vert_speed += self.grav;
}

player_collision_and_move(self);


//TODO: Change sprite depending on current character
//animations and sounds

//death
if(is_dead) {
	
	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_death;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_death;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_death;

	if(!audio_is_playing(snd_player_death))
		audio_play_sound(snd_player_death, 5, false);
}

//roll
else if(is_rolling) {
	
	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_roll;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_roll;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_roll;	

	if(!audio_is_playing(snd_player_roll))
		audio_play_sound(snd_player_roll, 5, false);
}
	
//start jump and in air
else if(!is_grounded) {
	
	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_jump;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_jump;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_jump;
	
	if(!audio_is_playing(snd_player_jump) && vert_speed <= jump_speed)
		audio_play_sound(snd_player_jump, 5, false);
}

//landing pastry --------------------------
else if(self.sprite_index == spr_pastry_jump || self.sprite_index == spr_fry_jump ||
	self.sprite_index == spr_grill_jump) {
	
	//Extra: add landing anim, right now it's only playing for 1 step
	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_land;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_land;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_land;
	
	if(!audio_is_playing(snd_player_land))
		audio_play_sound(snd_player_land, 5, false);
}

//idle on moving platform 
else if(on_moving_platform && (hor_speed == instance_nearest(x, y, obj_platform_move_parent).hspeed)) {

	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_idle;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_idle;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_idle;
	
}

//walking
else if(abs(hor_speed) > 0) {
	
	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_move;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_move;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_move;

	if(!audio_is_playing(snd_player_walk))
		audio_play_sound(snd_player_walk, 5, false);
}

//idle
else {

	//set sprite
	if(instance_exists(obj_player_pastry))
		self.sprite_index = spr_pastry_idle;
	else if(instance_exists(obj_player_fry))
		self.sprite_index = spr_fry_idle;
	else if(instance_exists(obj_player_grill))
		self.sprite_index = spr_grill_idle;
	
}

//invincible effect
if(is_invincible) {
	self.image_alpha *= 1 + invincibility_effect_speed;
	
	//if alpha reached lower bound, make alpha increase
	if(self.image_alpha <= 0.3)
		invincibility_effect_speed = abs(invincibility_effect_speed);
	//if alpha reached higher bound, make alpha decrease
	else if(self.image_alpha >= 1)
		invincibility_effect_speed = -abs(invincibility_effect_speed);
		
}
else {
	self.image_alpha = 1;
}

//special countdowns
special_meter_regen_countdown--;
special_cooldown_countdown--;

//regen after cooldown
if(special_meter_regen_countdown < 0)
	regenerate_special_meter(self);
	
//jump special
if(special_input() && can_jump_special && !is_grounded && !is_rolling && !is_dead &&
	(jump_special_cost <= current_special_meter) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, jump_special_cost);
	
	if(obj_player_manager.current_chef == obj_player_pastry)
		jump_special(self, obj_special_eclair, jump_special_spawn_offset);
	if(obj_player_manager.current_chef == obj_player_grill)
		jump_special(self, obj_special_kabob, jump_special_spawn_offset);
	if(obj_player_manager.current_chef == obj_player_fry)
		jump_special(self, obj_special_fry, jump_special_spawn_offset);
		
	special_cooldown_countdown = special_cooldown;
	//can't jump special until they are grounded again
	can_jump_special = false;
}

//reset jump special (because you can only use jump special once while in the air)
if(is_grounded) {
	can_jump_special = true;
}


//Swap Inventory
if(swap_inventory_input() && !is_dead) {
	is_holding_weapon = !is_holding_weapon; //switch to opposite slot (only 2 slots)
	
	//spawn in weapon
	if(is_holding_weapon)
		instance_create_layer(x, y, "Instances", inventory_weapon);
	//despawn weapon
	else
		instance_destroy(inventory_weapon);
	
	show_debug_message("Swapped weapon");
	show_debug_message(is_holding_weapon);
}

//Use Dish
if(!is_holding_weapon && norm_attack_down_input() && !is_dead) {
	show_debug_message("Use Dish");
	
	if(inventory_dish == obj_speed_dish)
		use_speed_dish(self);
	else if(inventory_dish == obj_damage_dish)
		use_damage_dish(self);
	else if(inventory_dish == obj_health_dish)
		use_health_dish(self);
		
}



//kill player if he leaves bottom of map
if(self.y >= 1900) {
	take_damage(self, 99999);
}
      
//making sure player is in front in the kitchen
if(room == kitchen_home) {
	self.depth = -(abs(self.depth))
}