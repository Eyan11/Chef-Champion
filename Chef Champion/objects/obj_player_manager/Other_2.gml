/// @description Overwrites save (TEMPORARY)


//saves my new changes
// so if I change the players level, in variable definitions, 
// then it will save and load (in room start event) my change, 
// instead of the last value saved in the file from last time project was ran
if(instance_exists(obj_player_pastry))
	current_chef = obj_player_pastry;
else if(instance_exists(obj_player_grill))
	current_chef = obj_player_grill;
else if(instance_exists(obj_player_fry))
	current_chef = obj_player_fry;
save_game();

