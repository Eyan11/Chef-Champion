
//movement
player_movement_calculations(self);

player_roll(self);

player_jump(self);

player_collision_and_move(self);


//special
special_meter_regen_countdown--;

if(special_meter_regen_countdown < 0)
	regenerate_special_meter(self);
	
