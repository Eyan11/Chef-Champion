/// @description save checkpoint

if(!is_reached) {
	checkpoint_save(self);
	self.sprite_index = spr_checkpoint_reached;
	is_reached = true;
}





