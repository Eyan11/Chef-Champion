 /// @description Insert description here
// You can write your code in this editor
hspeed = -5;
image_angle = direction + 180;

emit = audio_emitter_create()
audio_max = 300 
audio_drop = 50



audio_falloff_set_model(audio_falloff_linear_distance);

audio_emitter_falloff(emit,audio_drop,audio_max,1);

state = 0


if (x == -10) {
	instance_destroy();
}

