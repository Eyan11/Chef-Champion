/// @description Apply and track sear damage


if(sear_count >= sear_time ) {
	take_damage(self, sear_damage);
	
	alarm[3] = 60;
	sear_count = 0;
}
else {
	is_seared = false;
}
 
