/// @description Insert description here
// You can write your code in this editor	
if (x >= s + 500){
hspeed = horspeed * -1;
 }
 else if(x <= s - 500){
 hspeed = horspeed;
 }


//player can only collide when above the platform
if((obj_player_parent.bbox_bottom - 1) <= self.bbox_top)
	self.is_collidable = true;
else
	self.is_collidable = false;
            
//show_debug_message("is_collidable: ");
//show_debug_message(self.is_collidable);