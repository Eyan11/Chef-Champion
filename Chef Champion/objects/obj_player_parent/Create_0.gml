 /// @description Respawn weapon

audio_listener_orientation(0,1,0,0,0,1);

//despawn any weapons
if(instance_exists(obj_pastry_weapon))
	instance_destroy(obj_pastry_weapon);
	
if(instance_exists(obj_fry_weapon))
	instance_destroy(obj_fry_weapon);
	
if(instance_exists(obj_grill_weapon))
	instance_destroy(obj_grill_weapon);

//spawn inventory weapon
if(!instance_exists(inventory_weapon)) {
	instance_create_layer(0, 0, "Instances", inventory_weapon);
	show_debug_message("Spawned in inventory weapon");
}
