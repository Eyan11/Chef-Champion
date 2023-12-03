/// @description Insert description here
// You can write your code in this editor

if(other.creator == obj_player_parent.id) {
	enemy_damage(self, other.damage);
	//take damage script can replace above if needed

	//burn enemy
	self.isBurning = true;
	var _fire = instance_create_layer(self.x, self.y, "Foreground_Instances", obj_fire);
	_fire.obj_to_follow = self;
	_fire.following_enemy = true;
}


