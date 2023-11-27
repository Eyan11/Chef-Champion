/// @description Insert description here
// You can write your code in this editor

if(!paused){ //if game is paused
	with(instance_create_layer((camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 100), (camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2)), "Instances", obj_home_kitchen_button)) {
		image_xscale = 3
		image_yscale = 3
	}//Home Kitchen Button
	with(instance_create_layer((camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) + 100), (camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2)), "Instances", obj_exit_desktop_button)) {
		image_xscale = 3
		image_yscale = 3
	}//Desktop Button
	instance_deactivate_all(true)//basically hide everything
	paused = true
	instance_activate_object(obj_exit_desktop_button)
	instance_activate_object(obj_home_kitchen_button)
}
else {
	instance_activate_all()//unhide everything
	instance_destroy(obj_home_kitchen_button)
	instance_destroy(obj_exit_desktop_button)
	paused = false
}



