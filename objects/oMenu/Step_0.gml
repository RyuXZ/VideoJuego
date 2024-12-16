// Detecta la selección de la opción y permite la navegación
if (keyboard_check_pressed(vk_up)) {
    text = (text - 1 + 4) mod 4; // Decrementa text y se asegura de que se mantenga dentro de los límites (0 a 3)
}

if (keyboard_check_pressed(vk_down)) {
    text = (text + 1) mod 4; // Incrementa text y se asegura de que se mantenga dentro de los límites (0 a 3)
}

// Ejecuta una acción al presionar la tecla Enter (o cualquier tecla de selección)
if (keyboard_check_pressed(vk_enter)) {
    switch (text) {
        case 0: // Opción "Jugar"
            audio_stop_sound(snd_menu); // Detiene la música del menú antes de cambiar de sala
            room_goto(Room2); // Cambia a la sala llamada 'Room2'
			
            break;
        case 1: // Opción "Instrucciones"
            show_message("Usa las teclas de flechas para moverte y saltar.");
            break;
        case 2: // Opción "Creditos"
            show_message("MADE BY: José Manuel Tirado Tejeda y Ricardo Nieblas Vega.");
            break;
        case 3: // Opción "Salir"
            game_end(); // Finaliza el juego
            break;
    }
}
