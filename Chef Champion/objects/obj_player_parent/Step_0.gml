
//movement
player_movement_calculations(self);

player_roll(self);

player_jump(self);

player_collision_and_move(self);


//special
special_meter_regen_countdown--;

if(special_meter_regen_countdown < 0)
	regenerate_special_meter(self);
	
//jump special
if(special_input() && can_jump_special && !is_grounded && !is_rolling && (jump_special_cost <= current_special_meter))
	jump_special(self, obj_special_eclair)

//because you can only use jump special once while in the air
if(is_grounded)
	can_jump_special = true;
