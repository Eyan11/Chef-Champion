/// @description Apply and track BURN effect


if(burn_counter >= burn_time) {
	
	is_burning = false;
	burn_counter = 0;
}
else {
	take_damage(self, burn_damage);
	burn_counter++;	
	alarm[1] = 60;
}


