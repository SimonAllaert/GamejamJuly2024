if (global.killcount > 2){
	if (volume_GuitarTheme <= 1 ){
		volume_GuitarTheme += 0.01
	audio_sound_gain(snd_GuitarTheme,volume_GuitarTheme,0);
	}	
};
if (global.killcount > 4){
	if (volume_GuitarMain <= 1 ){
		volume_GuitarMain += 0.02
	audio_sound_gain(snd_GuitarMain,volume_GuitarMain,0);
	};	
	if (volume_GuitarFast <= 1 ){
		volume_GuitarFast += 0.02
	audio_sound_gain(snd_GuitarFast,volume_GuitarFast,0);
	};	
	if (volume_GuitarDemp > 0 ){
		volume_GuitarDemp -= 0.02
	audio_sound_gain(snd_GuitarDemp,volume_GuitarDemp,0);
	};	
};

if (global.killcount > 6){
	if (volume_GuitarSolo <= 1){
		volume_GuitarSolo += 0.01
		audio_sound_gain(snd_GuitarSolo,volume_GuitarSolo,0);
	}
};
