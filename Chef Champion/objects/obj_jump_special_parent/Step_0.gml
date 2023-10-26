/// @description move

object_hor_collide_and_move(self, move_speed * hor_dir);
object_vert_collide_and_move(self, move_speed * vert_dir);

//if colliding, delete object, and place platform instead
if(place_meeting(self.x + (0.1*hor_dir), self.y + (0.1*vert_dir), collision_layer())) {
	
	if(can_become_platform) {
		var _platform;
		show_debug_message("Spawn platform");
		//WARNING: this needs to be updated if the name of the collision layers change
		//WARNING: the object needs to be updated when different characters are in the game
		_platform = instance_create_layer(self.x, self.y, "Instances", obj_eclair_platform);
	}
	instance_destroy(self);
}