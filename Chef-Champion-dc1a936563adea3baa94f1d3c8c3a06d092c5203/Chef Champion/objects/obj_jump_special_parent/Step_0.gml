/// @description move

object_hor_collide_and_move(self, move_speed * hor_dir);
object_vert_collide_and_move(self, move_speed * vert_dir);

//if colliding, delete object, and place platform instead
if(place_meeting(self.x + (move_speed * hor_dir), self.y + (move_speed * vert_dir), special_attack_collision_layer())) {
	
	if(can_become_platform) {
		var _platform;
		//WARNING: the object needs to be updated when different characters are in the game
		_platform = instance_create_layer(self.x, self.y, "Instances", obj_eclair_platform);
	}
	self.alarm[0] = 1;
}