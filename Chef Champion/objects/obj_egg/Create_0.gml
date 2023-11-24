/// @description Insert description here
// You can write your code in this editor

dir = -1
spd = 3
grv = 0.2
vspd = 0
hspd = 0;
dont_fall = true


max_health = 50
current_health = max_health

// Initialize attack properties
attackCooldown = 120; // 2 seconds cooldown at 60 fps
timeSinceLastAttack = attackCooldown; // Start ready to attack
attackRange = 200; // Pixels
isAttacking = false
