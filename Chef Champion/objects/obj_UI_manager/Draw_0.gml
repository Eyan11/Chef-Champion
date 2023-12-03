/// @description Insert description here
// You can write your code in this editor

//draw bars first
draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30, obj_player_parent.current_health, c_black, c_red, c_red, 0, false, false)
draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30 + 40, obj_player_parent.current_special_meter, c_black, c_aqua, c_aqua, 0, false, false)

//draw cool sprites over them
draw_sprite(spr_health_special_bar, 0, camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15)
draw_sprite(spr_health_special_bar, 0, camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40)

//xp bar 
draw_healthbar(camera_get_view_x(view_camera[0]) + 288, camera_get_view_y(view_camera[0]) + 540, camera_get_view_x(view_camera[0]) + 864, camera_get_view_y(view_camera[0]) + 560, obj_player_parent.level_up_threshold_ui, c_green, c_black, c_black, 1, true, true)

//draw level above healthbar
draw_set_font(fnt_ui)
draw_set_halign(fa_center)
draw_set_color(c_green)
draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + 500 , "Level " + string(get_level(obj_player_parent)))

//draw recipe counter and attribute token counter
draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])) - 100, camera_get_view_y(view_camera[0]) + 20, "Recipes - " + string(get_recipes(obj_player_parent)))
draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])) - 100, camera_get_view_y(view_camera[0]) + 50, "Tokens - " + string(get_attribute_tokens(obj_player_parent)))


//draw attribute text in home kitchen
draw_set_font(fnt_ui)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_red)
draw_text(obj_combat_background.x, obj_combat_background.y, string(obj_player_parent.combat_attribute_level))
draw_text(obj_survival_background.x, obj_survival_background.y, string(obj_player_parent.survival_attribute_level))
draw_text(obj_special_background.x, obj_special_background.y, string(obj_player_parent.special_attribute_level))
draw_set_font(fnt_hk)
draw_text(obj_combat_background.x, obj_combat_background.y - 35, "Combat")
draw_text(obj_survival_background.x, obj_survival_background.y - 35, "Survival")
draw_text(obj_special_background.x, obj_special_background.y - 35, "Special")