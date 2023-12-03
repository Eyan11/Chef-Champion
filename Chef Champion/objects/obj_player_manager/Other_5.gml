 /// @description Save and Despawn Weapons

//despawn any weapons in room
if(instance_exists(obj_pastry_weapon))
	instance_destroy(obj_pastry_weapon);
	
if(instance_exists(obj_fry_weapon))
	instance_destroy(obj_fry_weapon);
	
if(instance_exists(obj_grill_weapon))
	instance_destroy(obj_grill_weapon);


save_game();

