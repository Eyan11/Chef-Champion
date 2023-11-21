/// @description Remove Damage Buff (From Dish)

//if dish effect has already been removed, leave alarm
if(!using_damage_dish)
	return;

self.additional_weapon_damage -= 5;
self.using_damage_dish = false;
