//frosted effect
if(isFrosted)
{	
	//spd = spd * 0.5;
	frostedTimer--
	if(frostedTimer <= 0)
	{	
		isFrosted = false
		frostedTimer = 300;
	}
}

// Handle burning debuff
if (isBurning) {
    burn_counter++;
    if (burn_counter >= room_speed) {
        enemy_damage(self, fireDamage); // Apply fire damage once per second
        burn_counter = 0; // Reset counter
    }
    
    burnTimer--;
    if (burnTimer <= 0) {
        isBurning = false;
		burnTimer = 300;
    }
}

// Handle grease debuff
if (isInGrease) {
    grease_counter++;
    if (grease_counter >= room_speed) {
        enemy_damage(self, greaseDamage); // Apply grease damage once per second
        grease_counter = 0; // Reset counter
    }
    
    greaseTimer--;
    if (greaseTimer <= 0) {
        isInGrease = false;
		greaseTimer = 300;
    }
}








