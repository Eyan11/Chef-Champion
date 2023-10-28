/// @description check for player collision

if(place_meeting(self.x, self.y - ((self.bbox_bottom - self.bbox_top)/2), obj_player_parent) && !is_breaking) {
	alarm[0] = time_until_break;
	is_breaking = true;
}

//so player can pass through platform, until above it
if((obj_player_parent.bbox_bottom - 1) <= self.bbox_top)
	is_collidable = true;
else
	is_collidable = false;




