/// @description Insert description here
// You can write your code in this editor
time += 1
self.sprite_index = spr_door_open;
show_debug_message("gets here in collision")
show_debug_message("door time: " + string(time))
if(time >= 30) {
	show_debug_message("gets here in collision for alarm")
	alarm[0] = 1
}

 






