//frosted effect
if(isFrosted)
{	
	spd = 0.5 * spd
	frostedTimer--
	if(frostedTimer <= 0)
	{	
		isFrosted = false
	}
}

// Handle burning debuff
if (isBurning) {
    burn_counter++;
    if (burn_counter >= room_speed) {
        current_health -= fireDamage; // Apply fire damage once per second
        burn_counter = 0; // Reset counter
    }
    
    burnTimer--;
    if (burnTimer <= 0) {
        isBurning = false;
    }
}

// Handle grease debuff
if (isInGrease) {
    grease_counter++;
    if (grease_counter >= room_speed) {
        current_health -= greaseDamage; // Apply grease damage once per second
        grease_counter = 0; // Reset counter
    }
    
    greaseTimer--;
    if (greaseTimer <= 0) {
        isInGrease = false;
    }
}








