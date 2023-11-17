/// @description Insert description here
// You can write your code in this editor
if(!is_reached) {
	checkpoint_save(self);
	self.sprite_index = spr_checkpoint_reached;
	add_xp(other, xp);
	is_reached = true;
}



