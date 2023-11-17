/// @description Insert description here
// You can write your code in this editor

//draw bars first
draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30, obj_player_pastry.current_health, c_black, c_red, c_red, 0, false, false)
draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30 + 40, obj_player_pastry.current_special_meter, c_black, c_aqua, c_aqua, 0, false, false)

//draw cool sprites over them
draw_sprite(spr_health_special_bar, 0, camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15)
draw_sprite(spr_health_special_bar, 0, camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40)

//xp bar 
draw_healthbar(camera_get_view_x(view_camera[0]) + 288, camera_get_view_y(view_camera[0]) + 490, camera_get_view_x(view_camera[0]) + 672, camera_get_view_y(view_camera[0]) + 500, obj_player_pastry.level_up_threshold_ui, c_green, c_black, c_black, 1, true, true)

//draw level above healthbar
draw_set_font(fnt_ui)
draw_set_halign(fa_center)
draw_set_color(c_green)
draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + 460, "Level " + string(get_level(obj_player_pastry)))

//draw recipe counter and attribute token counter
draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])) - 100, camera_get_view_y(view_camera[0]) + 20, "Recipes - " + string(get_recipes(obj_player_pastry)))
draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])) - 100, camera_get_view_y(view_camera[0]) + 50, "Tokens - " + string(get_attribute_tokens(obj_player_pastry)))