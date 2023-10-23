/// @description fall down

//acceleration
fall_speed += grav;

object_vert_collide_and_move(self, fall_speed);

despawn_time--;

if(despawn_time == 0)
	instance_destroy(self);




