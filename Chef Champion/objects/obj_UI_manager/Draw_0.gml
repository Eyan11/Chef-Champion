/// @description Insert description here
// You can write your code in this editor

//draw bars first
draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30, obj_player_pastry.current_health, c_black, c_red, c_red, 0, false, false)
draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30 + 40, obj_player_pastry.current_special_meter, c_black, c_aqua, c_aqua, 0, false, false)

//draw cool sprites over them
draw_sprite(spr_health_special_bar, 0, camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15)
draw_sprite(spr_health_special_bar, 0, camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40)