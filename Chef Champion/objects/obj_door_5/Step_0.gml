/// @description Insert description here
// You can write your code in this editor

if(!collision_rectangle(self.x - 32, self.y - 40, self.x + 32, self.x + 40, obj_player_parent, false, true)){
	self.sprite_index = spr_door
	time = 0
}


