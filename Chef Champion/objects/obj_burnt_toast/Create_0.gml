/// @description Insert description here
// You can write your code in this editor
event_inherited()
dir = 1
max_speed = 3
spd = max_speed
grv = 0.2
vspd = 0
hspd = 0;
dont_fall = true

current_speed = spd

max_health = 100
current_health = max_health


// Initialize attack variables

is_attacking = false; // State of the enemy's attack
damage = 10; // Damage dealt to the player

// Create Event for Pancake Enemy
attackRange = 150; // Range within which the enemy will attack
timeSinceLastAttack = 0; // Timer for managing attacks
attackCooldown = 60; // Cooldown time between attacks in frames
isAttacking = false; // State of the enemy's attack
facingDirection = 1


jumpSpeed = -4; // Jump speed for attacking
isInAir = false; // Flag to check if the enemy is in the air

dropChance = irandom(2);

