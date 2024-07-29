
event_inherited();


//Nothing = 0, Wall = 1, Path = 2, Spawn = 3, Goal = 4, Rat = 5, Dragon = 6
variable_global_set("layout", [
	[0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
	[1, 6, 5, 2, 6, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
	[1, 5, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 6, 6, 2, 1],
	[1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 5, 1, 2, 1, 5, 2, 1],
	[1, 2, 2, 2, 6, 1, 2, 5, 5, 5, 1, 2, 2, 5, 5, 1, 5, 1, 2, 5, 1],
	[1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 6, 1, 2, 1, 1, 1, 1],
	[1, 5, 2, 1, 2, 1, 1, 2, 2, 2, 1, 5, 6, 5, 1, 2, 2, 2, 6, 6, 1],
	[1, 5, 5, 1, 2, 1, 2, 2, 3, 2, 1, 2, 4, 2, 1, 2, 2, 2, 2, 5, 1],
	[1, 2, 2, 1, 2, 1, 2, 2, 2, 2, 1, 5, 2, 5, 1, 1, 1, 1, 2, 2, 1],
	[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 5, 2, 1],
	[1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1, 5, 1, 2, 1, 5, 1, 1],
	[0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0],
]);

variable_global_set("origin", [48, 48])



tilepoint_x = global.origin[0];
tilepoint_y = global.origin[1];


volume_GuitarTheme = 0;
volume_GuitarDemp = 1;
volume_GuitarMain = 0;
volume_GuitarFast = 0;
volume_GuitarSolo = 0;
volume_MetalBass = 1;
volume_MetalDrum = 1;

audio_play_in_sync_group(global.sync_group,snd_GuitarDemp);
audio_play_in_sync_group(global.sync_group,snd_GuitarMain);
audio_play_in_sync_group(global.sync_group,snd_GuitarSolo);
audio_play_in_sync_group(global.sync_group,snd_GuitarFast);
audio_play_in_sync_group(global.sync_group,snd_GuitarTheme);
audio_play_in_sync_group(global.sync_group,snd_MetalDrum);
audio_play_in_sync_group(global.sync_group,snd_MetalDrum);
audio_sound_gain(snd_GuitarDemp,1,0);

audio_sound_gain(snd_GuitarFast,0,0);
audio_sound_gain(snd_GuitarSolo,0,0);
audio_sound_gain(snd_GuitarFast,0,0);
audio_sound_gain(snd_GuitarTheme,0,0);
audio_sound_gain(snd_GuitarMain,0,0);


audio_start_sync_group(global.sync_group);




generate_map_new()
