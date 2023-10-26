/// @description check for player collision

if(place_meeting(self.x, self.y - ((self.bbox_bottom - self.bbox_top)/2), obj_player_parent) && !is_breaking) {
	alarm[0] = time_until_break;
	is_breaking = true;
}





