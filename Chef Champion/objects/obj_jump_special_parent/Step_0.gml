/// @description move

object_hor_collide_and_move(self, move_speed * hor_dir);
object_vert_collide_and_move(self, move_speed * vert_dir);

//if colliding, delete object, and place platform instead
if(place_meeting(self.x + (move_speed * hor_dir), self.y + (move_speed * vert_dir), special_attack_collision_layer())) {
	
	if(can_become_platform) {
		var _platform;
		if(obj_player_manager.current_chef == obj_player_pastry)
			_platform = instance_create_layer(self.x, self.y, "Instances", obj_platform_eclair);
		if(obj_player_manager.current_chef == obj_player_grill)
			_platform = instance_create_layer(self.x, self.y, "Instances", obj_platform_kabob);
		if(obj_player_manager.current_chef == obj_player_fry)
			_platform = instance_create_layer(self.x, self.y, "Instances", obj_platform_fry);
			
		_platform.image_xscale = hor_dir;
	}
	self.alarm[0] = 1;
}