/// @description Apply and track GREASE effect

if(greased_timer > greased_timer_threshold) {
	greased_damage_counter++;
	take_damage(self, min(greased_max_damage, (2 * greased_damage_counter)));
	alarm[2] = 60;
	greased_timer = 0;
}
else {
	is_greased = false;
}


