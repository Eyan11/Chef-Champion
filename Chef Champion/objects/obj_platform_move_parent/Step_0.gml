/// @description Insert description here
// You can write your code in this editor	
if (x >= s + 500){
hspeed = horspeed * -1;
 }
 else if(x <= s - 500){
 hspeed = horspeed;
 }

//if((obj_player_grill.bbox_bottom - 1) <= self.bbox_top)
//player can only collide when above the platform
if(instance_exists(obj_player_parent) && 
	((obj_player_parent.bbox_bottom - 1) <= self.bbox_top))
	self.is_collidable = true;
else
	self.is_collidable = false;
            
//show_debug_message("is_collidable: ");
//show_debug_message(self.is_collidable);