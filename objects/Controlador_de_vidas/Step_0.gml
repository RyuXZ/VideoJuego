// Verifica si se presiona la tecla R para reiniciar
if (global.game_over && keyboard_check_pressed(ord("R"))) {
    global.vidas = 3;  // Reinicia las vidas
    global.contador_monedas = 0; // Reinicia el contador de monedas
    global.game_over = false; // Restablece el estado de Game Over
    room_goto(Room2); // Cambia a la habitación principal (Room2)
}

if (global.game_over) {
    var game_over_texto = "Game Over";
    var game_over_x = (room_width / 2) - (string_width(game_over_texto) / 2);
    var game_over_y = (room_height / 2) - 10;

    
    var restart_texto = "Presiona R para volver a Room2";
    var restart_x = (room_width / 2) - (string_width(restart_texto) / 2);
    var restart_y = game_over_y + 20;
    
}
