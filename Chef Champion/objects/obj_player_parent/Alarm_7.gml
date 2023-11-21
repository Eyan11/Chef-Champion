/// @description Remove Speed Buff (From Dish)

//if dish effect has already been removed, leave alarm
if(!using_speed_dish)
	return;

self.run_speed -= 3;
self.using_speed_dish = false;
