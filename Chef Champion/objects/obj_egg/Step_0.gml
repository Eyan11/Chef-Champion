/// @description Insert description here
// You can write your code in this editor

//collision Logic
hspd = dir * spd
vspd = vspd + grv


//horizontal collision
if(place_meeting(x+hspd,y,collision_layer()))
{
	while(!place_meeting(x+sign(hspd),y,collision_layer()))
	{
		x = x + sign(hspd)
	}
	dir = dir * -1
	hspd = 0

}
x = x + hspd;

if(place_meeting(x,y+vspd,collision_layer()))
{
	while(!place_meeting(x,y+sign(vspd),collision_layer()))
	{
		y = y + sign(vspd)
	}
	vspd = 0
	
	if(dont_fall && !position_meeting(x+(sprite_width/2)*dir, y+(sprite_height/2)+7,collision_layer()))
	{
		dir = dir * -1
	}

}
y = y + vspd;

// Attack Logic
timeSinceLastAttack--;
var playerDistance = distance_to_object(obj_player_parent);
if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
    isAttacking = true; // Set attacking state
	 hspd = 0; // Stop horizontal movement
     vspd = 0; // Stop vertical movement
    sprite_index = spr_egg_attack;
   

  if (place_meeting(x, y, obj_player_parent)) {
       take_damage(obj_player_parent, 0.1)
	}
} else if (playerDistance >= attackRange && isAttacking) {
    isAttacking = false; // Reset attacking state
}

// Resetting Movement and Sprite
if (!isAttacking) {
    // Adjust sprite based on movement if not in attack mode
    sprite_index = (hspd != 0 || vspd != 0) ? spr_egg_walk : sprite_index;
}