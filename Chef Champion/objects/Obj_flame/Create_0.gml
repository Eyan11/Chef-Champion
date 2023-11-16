 /// @description Insert description here
// You can write your code in this editor
t = 180
time = 0

emit = audio_emitter_create()
audio_max = 600 
audio_drop = 50



audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emit,x,y,0);
audio_emitter_falloff(emit,audio_drop,audio_max,1);

state = 0
