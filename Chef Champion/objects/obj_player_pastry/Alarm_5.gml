/// @description Insert description here
// You can write your code in this editor

//make second hitbox
if(obj_player_pastry.image_xscale < 0) {
	//flip swing sprite
	with(instance_create_layer(self.x - 40, self.y, "Instances", obj_grill_hitbox)) {
		image_xscale = -1
	}
}
else {
	instance_create_layer(self.x + 40, self.y, "Instances", obj_grill_hitbox)
}


