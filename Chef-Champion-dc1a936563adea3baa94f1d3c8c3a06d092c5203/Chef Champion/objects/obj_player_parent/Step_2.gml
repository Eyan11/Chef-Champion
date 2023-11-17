/// @description follow camera 

view_height = camera_get_view_width(view_camera[0] / 2);
view_width = camera_get_view_height(view_camera[0] / 2);

camera_set_view_pos(view_camera[0], x - view_width, y - view_height - 100);


