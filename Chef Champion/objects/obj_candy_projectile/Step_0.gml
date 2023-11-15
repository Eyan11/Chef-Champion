// Projectile movement is handled by speed and direction settings

// Collision check with the player
if (place_meeting(x, y, obj_Player)) {
    // Apply damage to the player
    take_damage(obj_player_parent, 1)
    instance_destroy(); // Destroy the projectile
}



