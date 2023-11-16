event_inherited()
state = "idle";
health = 300; // Or any value you want to start with
attack_distance = 100; // Adjust as per requirement
attack_timer = 0;
attack_cooldown = 120; // Cooldown of 2 seconds 
shockwave_timer = 0; 
shockwave_duration = 60; // Duration of 1 second 

burn = false;
frosted = false;
grease = false;
move_direction = 1;  // Start moving to the right
start_x = x;  // Save the initial x position
move_distance = 100;  // Distance to move in both directions. Adjust as needed.
