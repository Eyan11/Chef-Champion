
function save_game() {
	
	//empty array to hold save data
	var _array = [];
	
	with(obj_player_parent) {
		
		var _struct = 
		{
			object: object_get_name(object_index),
			current_recipes: current_recipes,
			current_level: current_level,
			current_xp: current_xp,
			level_up_threshold: level_up_threshold,
			current_attribute_tokens: current_attribute_tokens,
			survival_attribute_level: survival_attribute_level,
			combat_attribute_level: combat_attribute_level,
			special_attribute_level: special_attribute_level,
			run_speed: run_speed,
			max_health: max_health,
			additional_weapon_damage: additional_weapon_damage,
			crit_percent: crit_percent,
			max_special_meter: max_special_meter,
			jump_special_damage: jump_special_damage,
			ground_special_damage: ground_special_damage,
			inventory_dish: inventory_dish,
			inventory_weapon: inventory_weapon,
			total_speed_dishes: total_speed_dishes,
			total_damage_dishes: total_damage_dishes,
			total_health_dishes: total_health_dishes,
			own_pastry_weapon: own_pastry_weapon,
			own_grill_weapon: own_grill_weapon,
			own_fry_weapon: own_fry_weapon
		};
		
		array_push(_array, _struct);
	}
	
	//TODO: add other players
	
	//converts array from json to string format
	var _string = json_stringify(_array);
	
	//opens save file to write to it
	var _file = file_text_open_write("save.txt");
	
	//writes to the file
	file_text_write_string(_file, _string);
	
	//closes file
	file_text_close(_file);
}

function load_game() {
	
	if(file_exists("save.txt")) {
		
		//opens save file to read from it
		var _file = file_text_open_read("save.txt");
		
		//read file in json format
		var _json = file_text_read_string(_file);
		
		//convert from json to string and store in array
		var _array = json_parse(_json);
		
		instance_destroy(obj_player_parent);
		
		//cycles through array of save data
		for(var _i = 0; _i < array_length(_array); _i += 1) {
			
			//retrieves every struct saved in array
			var _struct = _array[_i];
			
			//creates instance object and assigns values in struct to the object
			//Old respawn: instance_create_layer(get_checkpoint().x, get_checkpoint().y, "Instances", asset_get_index(_struct.object), _struct);
			instance_create_layer(get_checkpoint().x, get_checkpoint().y - 5, "Instances", obj_player_manager.current_chef, _struct);
		}
		
		//closes file
		file_text_close(_file);
	}	
}