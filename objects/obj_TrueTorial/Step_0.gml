if (global.killcount > 0){
	if (volume_bass <= 1 ){
		volume_bass += 0.01
	audio_sound_gain(snd_bass,volume_bass,0);
	}	
};
if (global.killcount > 1){
	if (volume_drum <= 1 ){
		volume_drum += 0.02
	audio_sound_gain(snd_drum,volume_drum,0);
	};	
};

if (global.killcount > 2){
	if (volume_pino <= 1){
		volume_pino += 0.01
		audio_sound_gain(snd_pino,volume_pino,0);
	}
};