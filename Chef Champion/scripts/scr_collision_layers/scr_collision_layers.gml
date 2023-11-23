//Set collision layers in here so it can all be changed at one place
//if someone changes the objects in a layer or layer name, 
//	then we know to update references in here


/// @function					collision_layer();
/// @description				Returns the layer of objects that the player collides with
function collision_layer() {
	
	//assign _platform variable to the closest moving platform
	if(instance_exists(obj_platform_move_parent))
		var _platform = instance_nearest(obj_player_parent.x, obj_player_parent.y, obj_platform_move_parent);
	
	
	
	//TODO: add all platforms for all chefs
	
	//both jump special and moving platform is collidable
	if(instance_exists(obj_platform_move_parent) && _platform.is_collidable
		&& instance_exists(obj_special_platform_parent) && obj_special_platform_parent.is_collidable) {
		return [obj_special_platform_parent, _platform, layer_tilemap_get_id("collision_tile_set"), obj_border, obj_grill];
	}
		
	//only jump special platform is collidable
	else if(instance_exists(obj_special_platform_parent) && obj_special_platform_parent.is_collidable) {
		return [obj_special_platform_parent, layer_tilemap_get_id("collision_tile_set"), obj_border, obj_grill];
	}
			
	//only moving platform is collidable
	else if(instance_exists(obj_platform_move_parent) && _platform.is_collidable) {
		return [_platform, layer_tilemap_get_id("collision_tile_set"), obj_border, obj_grill];
	}
	
	//neither jump special nor moving platform is collidable (pass through the platforms)
	else {
		return [layer_tilemap_get_id("collision_tile_set"), obj_border, obj_grill];
	}
}



/// @function					special_attack_collision_layer();
/// @description				Returns the layer of objects that special attack objects will collide with
function special_attack_collision_layer() {
	
	//jump special and ground special only collides with these:
	return [layer_tilemap_get_id("collision_tile_set")];
}
