event_inherited()

var minionSpawnTimer = 1200; // Timer for spawning minions in Phase 3
var minionSpawnInterval = 60; // Interval for spawning minions


// Step Event
timeSinceLastAttack--;

// Collision Logic
hspd = dir * spd;
vspd = vspd + grv;

// Horizontal Collision
if (place_meeting(x + hspd, y, collision_layer())) {
    while (!place_meeting(x + sign(hspd), y, collision_layer())) {
        x = x + sign(hspd);
    }
    dir = dir * -1; // Change direction upon collision
    hspd = 0;
}
x = x + hspd;

// Vertical Collision
if (place_meeting(x, y + vspd, collision_layer())) {
    while (!place_meeting(x, y + sign(vspd), collision_layer())) {
        y = y + sign(vspd);
    }
    vspd = 0;

    if (dont_fall && !position_meeting(x + (sprite_width / 2) * dir, y + (sprite_height / 2) + 7, collision_layer())) {
        dir = dir * -1; // Change direction upon vertical collision edge condition
    }
}
y = y + vspd;

// Finding the nearest player
var player = instance_nearest(x, y, obj_player_parent);
var playerDistance = point_distance(x, y, player.x, player.y);


// Update sprite facing based on direction and buffer zone logic
if (!isAttacking) {
    image_xscale = dir;
}

//Phase 1
if(current_health >= 900)
{
		// Attack Logic
	if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
	    isAttacking = true;
	    hspd = 0;
	    vspd = 0;
	    sprite_index = spr_kebab_king_phase_1;
	    image_xscale = (player.x < x) ? -1 : 1; // Correctly face towards the player while attacking

	    if (playerDistance < attackRange) {
			if audio_is_playing(sfx_kebab_king_1){
			}
			else {
			audio_play_sound(sfx_kebab_king_1,5,false)
			}
	        take_damage(obj_player_parent, 10);
	        timeSinceLastAttack = attackCooldown;
	    }
	} else if (playerDistance >= attackRange && isAttacking) {
	    isAttacking = false;
	}

	//Resetting Movement and Sprite
	if (!isAttacking) {
	    sprite_index = spr_kebab_king_walk;
	    image_xscale = dir; // Ensure sprite direction is reset after attack phase
	}

}

//Phase 2
else if(current_health <= 900 && current_health > 400)
{	
			// Attack Logic
	if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
		 var minion = instance_create_layer(x, y-200, "Instances", obj_fire_ball);
	    isAttacking = true;
	    hspd = 0;
	    vspd = 0;
	    sprite_index = spr_kebab_king_phase_2;
	    image_xscale = (player.x < x) ? -1 : 1; // Correctly face towards the player while attacking

	    if (playerDistance < attackRange) {
			if audio_is_playing(sfx_kebab_king_fire){
			}
			else {
			audio_play_sound(sfx_kebab_king_fire,5,false)
			}
	        take_damage(obj_player_parent, 5);
	        timeSinceLastAttack = attackCooldown;
	    }
	} else if (playerDistance >= attackRange && isAttacking) {
	    isAttacking = false;
	}
	//Resetting Movement and Sprite
	if (!isAttacking) {
	    sprite_index = spr_kebab_king_walk;
	    image_xscale = dir; // Ensure sprite direction is reset after attack phase
	}

}


//Phase 3
else if(current_health <= 400)
{
	
	// Attack Logic
	if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
	    isAttacking = true;
	    //hspd = 0;
	    //vspd = 0;
	    sprite_index = spr_kebab_king_phase_3;
	    image_xscale = (player.x < x) ? -1 : 1; // Correctly face towards the player while attacking

	    if (playerDistance < attackRange) {
			if audio_is_playing(sfx_kebab_king_phase_3){
			}
			else {
			audio_play_sound(sfx_kebab_king_phase_3,5,false)
			}
	        take_damage(obj_player_parent, 15);
	        timeSinceLastAttack = attackCooldown;
	    }
	} else if (playerDistance >= attackRange && isAttacking) {
	    isAttacking = false;
	}


}
