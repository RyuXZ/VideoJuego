// Inicializa la variable text para definir la opción seleccionada
text = 0; // La opción inicial seleccionada (0 para "Jugar")

// Configuración de la fuente y la alineación de texto
draw_set_font(fntMenu);
draw_set_valign(fa_middle); // Alineación vertical al centro
draw_set_halign(fa_center); // Alineación horizontal al centro

// Define la posición base para centrar las opciones
base_x = room_width / 2; // Centra horizontalmente en la pantalla
base_y = room_height / 2 - 64; // Ajusta la posición vertical para centrar las opciones

// Define el espacio entre las opciones
offset = 80; // Espacio entre las opciones de texto

// Reproduce la música del menú si no se está reproduciendo ya
if (!audio_is_playing(snd_menu)) {
    audio_play_sound(snd_menu, 1, true); // Reproduce el sonido en bucle
}
