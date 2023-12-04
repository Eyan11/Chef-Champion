/// @description Insert description here
// You can write your code in this editor

//draw bars first

if(instance_exists(obj_player_pastry)) {
	draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30, obj_player_pastry.max_health_ui_pastry, c_black, c_red, c_red, 0, false, false)
	draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30 + 40, obj_player_pastry.max_special_ui_pastry, c_black, c_aqua, c_aqua, 0, false, false)
}
if(instance_exists(obj_player_fry)) {
	draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30, obj_player_fry.max_health_ui_fry, c_black, c_red, c_red, 0, false, false)
	draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30 + 40, obj_player_fry.max_special_ui_fry, c_black, c_aqua, c_aqua, 0, false, false)
}
if(instance_exists(obj_player_grill)) {
	draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30, obj_player_grill.max_health_ui_grill, c_black, c_red, c_red, 0, false, false)
	draw_healthbar(camera_get_view_x(view_camera[0]) + 15, camera_get_view_y(view_camera[0]) + 15 + 40, camera_get_view_x(view_camera[0]) + 15 + 242, camera_get_view_y(view_camera[0]) + 15 + 30 + 40, obj_player_grill.max_special_ui_grill, c_black, c_aqua, c_aqua, 0, false, false)
}




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

if(room == kitchen_home) {
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
	
	//draw costs
	draw_set_font(fnt_ui)
	draw_set_color(c_red)
	draw_text(obj_recipe_model1.x +  40, obj_recipe_model1.y, "30")
	draw_text(obj_recipe_model2.x +  40, obj_recipe_model2.y, "5")

	//draw level numbers
	draw_set_font(fnt_hk)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_red)
	draw_text(obj_door_1.x + 32, obj_door_1.y - 40, "Level 1")
	draw_text(obj_door_2.x + 32, obj_door_2.y - 40, "Level 2")
	draw_text(obj_door_3.x + 32, obj_door_3.y - 40, "Level 3")
	draw_text(obj_door_4.x + 32, obj_door_4.y - 40, "Level 4")
	draw_text(obj_door_5.x + 32, obj_door_5.y - 40, "Level 5")
	draw_text(obj_door_6.x + 32, obj_door_6.y - 40, "Level 6")
	
		if(instance_exists(obj_player_pastry)) {
			draw_set_font(fnt_hk)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_set_color(c_red)
			draw_text(obj_buy_hitbox_chef1.x, obj_buy_hitbox_chef1.y - 100, "Fry\nChef")
			draw_text(obj_buy_hitbox_chef2.x, obj_buy_hitbox_chef2.y - 100, "Grill\nChef")
		}
		else if(instance_exists(obj_player_fry)) {
			draw_set_font(fnt_hk)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_set_color(c_red)
			draw_text(obj_buy_hitbox_chef1.x, obj_buy_hitbox_chef1.y - 100, "Grill\nChef")
			draw_text(obj_buy_hitbox_chef2.x, obj_buy_hitbox_chef2.y - 100, "Pastry\nChef")
		}
		else if(instance_exists(obj_player_grill)) {
			draw_set_font(fnt_hk)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_set_color(c_red)
			draw_text(obj_buy_hitbox_chef1.x, obj_buy_hitbox_chef1.y - 100, "Fry\nChef")
			draw_text(obj_buy_hitbox_chef2.x, obj_buy_hitbox_chef2.y - 100, "Pastry\nChef")
		}
		else {
			instance_create_layer(self.x, self.y, "Foreground_Instances", obj_damage_dish)
		}
	
	//draw item descriptions
	if(place_meeting(obj_buy_hitbox_fry.x, obj_buy_hitbox_fry.y, obj_player_parent)){
	
		draw_set_font(fnt_hk)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_red)
		draw_text(obj_buy_hitbox_fry.x, obj_buy_hitbox_fry.y - 80, "Medium-Long range melee.\nSpawns GREASE pools\non hit.")
	
	}

	if(place_meeting(obj_buy_hitbox_grill.x, obj_buy_hitbox_grill.y, obj_player_parent)){
	
		draw_set_font(fnt_hk)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_red)
		draw_text(obj_buy_hitbox_grill.x, obj_buy_hitbox_grill.y - 80, "Short range melee.\nTwo quick hits and\ninflicts BURN.")
	
	}
	if(place_meeting(obj_buy_hitbox_pastry.x, obj_buy_hitbox_pastry.y, obj_player_parent)){
	
		draw_set_font(fnt_hk)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_red)
		draw_text(obj_buy_hitbox_pastry.x, obj_buy_hitbox_pastry.y - 80, "Medium velocity projectile.\nTravels in straight line\nand inflicts FROSTED.")
	
	}
	if(place_meeting(obj_buy_hitbox_damage.x, obj_buy_hitbox_damage.y, obj_player_parent)){
	
		draw_set_font(fnt_hk)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_red)
		draw_text(obj_buy_hitbox_damage.x, obj_buy_hitbox_damage.y - 80, "Temporarily increase your\ndamage on use")
	
	}

	if(place_meeting(obj_buy_hitbox_health.x, obj_buy_hitbox_health.y, obj_player_parent)){
	
		draw_set_font(fnt_hk)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_red)
		draw_text(obj_buy_hitbox_health.x, obj_buy_hitbox_health.y - 80, "Temporarily increase your\nhealth on use")
	
	}
	if(place_meeting(obj_buy_hitbox_speed.x, obj_buy_hitbox_speed.y, obj_player_parent)){
	
		draw_set_font(fnt_hk)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_red)
		draw_text(obj_buy_hitbox_speed.x, obj_buy_hitbox_speed.y - 80, "Temporarily increase your\nspeed on use")
	
	}

	//draw level 5 unlocks for attributes
	if(place_meeting(obj_buy_hitbox_combat.x, obj_buy_hitbox_combat.y, obj_player_parent)){
	
		if(obj_player_parent.combat_attribute_level >= 5){
			draw_set_font(fnt_hk)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_set_color(c_green)
			draw_text(obj_buy_hitbox_combat.x, obj_buy_hitbox_combat.y - 125, "Charge attack\nunlocked!\n(Hold normal attack)")
		}
	
	}

	if(place_meeting(obj_buy_hitbox_survival.x, obj_buy_hitbox_survival.y, obj_player_parent)){
	
		if(obj_player_parent.survival_attribute_level >= 5){
			draw_set_font(fnt_hk)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_set_color(c_green)
			draw_text(obj_buy_hitbox_survival.x, obj_buy_hitbox_survival.y - 125, "Floating\nunlocked!\n(Hold jump)")
		}
	
	}
	if(place_meeting(obj_buy_hitbox_special.x, obj_buy_hitbox_special.y, obj_player_parent)){
	
		if(obj_player_parent.special_attribute_level >= 5){
			draw_set_font(fnt_hk)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_set_color(c_green)
			draw_text(obj_buy_hitbox_special.x, obj_buy_hitbox_special.y - 125, "Special attack\nunlocked!\n(Press C or Y)")
		}
	
	}
	
}

//draw what item you are currently holding
draw_sprite(spr_current_item, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50)

if(obj_player_parent.is_holding_weapon) {
	
	switch(obj_player_parent.inventory_weapon) {
	
	case obj_fry_weapon:
	draw_sprite(spr_fry_weapon_ui_model, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50)
	break
	
	case obj_grill_weapon:
	draw_sprite(spr_grill_weapon_ui_model, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50)
	break
	
	case obj_pastry_weapon:
	draw_sprite(spr_pastry_weapon_ui_model, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50)
	break
	
	default:
	break
	
	}
}
else {
	switch(obj_player_parent.inventory_dish) {
	
	case obj_health_dish:
	draw_sprite_ext(spr_apple_ui, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50, 0.25, 0.25, 0, c_white, 1)
	break
	
	case obj_damage_dish:
	draw_sprite_ext(spr_chicken_ui, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50, 0.25, 0.25, 0, c_white, 1)
	break
	
	case obj_speed_dish:
	draw_sprite_ext(spr_latte_ui, 0, camera_get_view_x(view_camera[0]) + 315, camera_get_view_y(view_camera[0]) + 50, 0.25, 0.25, 0, c_white, 1)
	break
	
	default:
	break
	
	}
}

