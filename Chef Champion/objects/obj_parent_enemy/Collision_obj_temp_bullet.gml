/// @description Insert description here
// You can write your code in this editor

enemy_damage(self, other.damage);

//apply frosted effect
self.isFrosted = true;
var _frosting = instance_create_layer(self.x, self.y, "Foreground_Instances", obj_frosting);
_frosting.obj_to_follow = self;
_frosting.following_enemy = true;
