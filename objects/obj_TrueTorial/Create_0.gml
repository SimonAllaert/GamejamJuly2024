event_inherited();

//Nothing = 0, Wall = 1, Path = 2, Spawn = 3, Goal = 4, Rat = 5, Dragon = 6
variable_global_set("layout", [
    [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
    [1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1],
    [1, 5, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 5, 2, 4, 2, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1],
    [1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1],
    [1, 3, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 2, 2, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1],
    [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
    [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
    [1, 1, 1, 1, 1, 1, 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 6, 2, 1],
    [1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 1],
    [0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0],
]);

variable_global_set("origin", [48, 48])



tilepoint_x = global.origin[0];
tilepoint_y = global.origin[1];
volume_bass = 0;
volume_cello = 1;
volume_drum = 0;
volume_pino = 0;


audio_play_in_sync_group(global.sync_group,snd_bass);
audio_play_in_sync_group(global.sync_group,snd_cello);
audio_play_in_sync_group(global.sync_group,snd_drum);
audio_play_in_sync_group(global.sync_group,snd_pino);


audio_sound_gain(snd_bass,0,0);
audio_sound_gain(snd_drum,0,0);
audio_sound_gain(snd_pino,0,0);



audio_start_sync_group(global.sync_group);




generate_map_new()