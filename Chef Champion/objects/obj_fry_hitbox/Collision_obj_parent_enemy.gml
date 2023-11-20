/// @description Insert description here
// You can write your code in this editor

add_xp(obj_player_pastry, irandom_range(30, 70))
obj_player_pastry.current_xp_ui = (100 * obj_player_pastry.current_xp) / obj_player_pastry.level_up_threshold
obj_player_pastry.level_up_threshold_ui = 100 - obj_player_pastry.current_xp_ui


