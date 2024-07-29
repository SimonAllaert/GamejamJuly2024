if (global.killcount > 3){
	if (volume_pino <= 1 ){
		volume_pino += 0.01
	audio_sound_gain(snd_pino,volume_pino,0);
	}	
};
if (global.killcount > 6){
	if (volume_bass <= 1 ){
		volume_bass += 0.02
	audio_sound_gain(snd_bass,volume_bass,0);
	};	
};

if (global.killcount > 8){
	if (volume_cello <= 1){
		volume_cello += 0.01
		audio_sound_gain(snd_cello,volume_cello,0);
	}
};