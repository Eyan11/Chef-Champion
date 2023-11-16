//Set collision layers in here so it can all be changed at one place
//if someone changes the objects in a layer or layer name, 
//	then we know to update references in here

/// @function					collision_layer();
/// @description				Returns the layer of objects that the player collides with
function collision_layer() {
	
	//TODO: add all platforms for all chefs
	//collide with jump special platforms when above them
	if(instance_exists(obj_eclair_platform) && obj_eclair_platform.is_collidable)
			return [layer_tilemap_get_id("Dessert_Tile_Set"), obj_border, obj_eclair_platform, obj_grill, obj_platform_move_parent];
	//if below a platform, pass through it
	else
		return [layer_tilemap_get_id("Dessert_Tile_Set"), obj_border,obj_platform_move_parent,obj_grill];
	
	//return [layer_tilemap_get_id("Dessert_Tile_Set"), obj_border];
	
}