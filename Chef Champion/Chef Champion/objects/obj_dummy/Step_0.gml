/// @description Insert description here
// You can write your code in this editor

if (hp <= 0) {

	instance_destroy(self) //destroy

	obj_dummy_spawner.alarm[0] = room_speed * 3 //respawn after 3 sec

}
