audio_play_sound(gamejam24BaseC, 0, 1, 1.0, undefined, 1.0);

audio_play_sound(gamejam24pino1, 0, 1, 1.0, undefined, 1.0);

audio_sound_gain(gamejam24pino1,0,0);	

balls = audio_create_sync_group(loop)
array_create(2,balls,gamejam24BaseC )
