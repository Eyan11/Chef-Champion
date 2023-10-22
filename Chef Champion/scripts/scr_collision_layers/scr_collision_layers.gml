//Set collision layers in here so it can all be changed at one place
//if someone changes the objects in a layer or layer name, 
//	then we know to update references in here

/// @function					collision_layer();
/// @description				Returns the layer of objects that the player collides with
function collision_layer() {
	
	return layer_tilemap_get_id("Temp_Tiles");
	
}