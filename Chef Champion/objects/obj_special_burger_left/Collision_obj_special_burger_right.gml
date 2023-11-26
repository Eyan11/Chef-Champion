/// @description Spawn Explosion and despawn self

var _explosion = instance_create_layer(x + ((other.x - x)/2), y, "Instances", obj_special_burger_explosion);
_explosion.damage = damage;

audio_play_sound(snd_burger_explosion, 5, false);
instance_destroy(other);
instance_destroy(self);

