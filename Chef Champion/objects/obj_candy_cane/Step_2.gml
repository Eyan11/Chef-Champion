// Check for Death Animation
if (state == "death") {
    sprite_index = spr_candy_cane_dead;
    
}

// Health Check for Death
if (health <= 0) {
    state = "death";
    instance_destroy(self)


}




