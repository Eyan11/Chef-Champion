/// @description Spawn Grease

//don't spawn grease if despawning
if(sprite_index == spr_onion_ring_despawn)
	return;

instance_create_layer(x, y, "Instances", obj_grease_pool);

alarm[1] = grease_spawn_interval * 60;

show_debug_message("Spawned Grease");
