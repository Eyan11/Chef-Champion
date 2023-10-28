
//movement
player_movement_calculations(self);

player_roll(self);

player_jump(self);

player_collision_and_move(self);

//animations
//roll
if(is_rolling)
	self.sprite_index = spr_pastry_roll;
//in air
else if(!is_grounded)
	self.sprite_index = spr_pastry_idle;
//walking
else if(abs(hor_speed) > 0)
	self.sprite_index = spr_pastry_move;
//idle
else
	self.sprite_index = spr_pastry_idle;


//special countdowns
special_meter_regen_countdown--;
jump_special_cooldown_countdown--;

//regen after cooldown
if(special_meter_regen_countdown < 0)
	regenerate_special_meter(self);
	
//jump special
if(special_input() && can_jump_special && !is_grounded && !is_rolling && 
	(jump_special_cost <= current_special_meter) && (jump_special_cooldown_countdown < 0)) {
	
	jump_special(self, obj_special_eclair)
}

//reset jump special (because you can only use jump special once while in the air)
if(is_grounded)
	can_jump_special = true;
