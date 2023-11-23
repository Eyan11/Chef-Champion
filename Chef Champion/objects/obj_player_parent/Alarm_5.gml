/// @description Charge Attack

var isChargedAttack = false

if(obj_player_pastry.current_charge >= obj_player_pastry.max_charge) {
		isChargedAttack = true
}
player_normal_attack_grill_hitbox(obj_grill_weapon, self, isChargedAttack, 1)




