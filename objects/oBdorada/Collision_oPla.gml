instance_create_layer(x, y, "Instances", oVictoria); // Crear el mensaje de victoria
instance_destroy(oBdorada); // Destruir la bandera dorada
audio_stop_all();
audio_play_sound(snd_victoria, 1, false);
global.Ganaste = true;