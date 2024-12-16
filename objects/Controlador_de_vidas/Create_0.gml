// Evento Create de Controlador_de_vidas
if (!variable_global_exists("vidas")) {
    global.vidas = 3;  // Inicializa las vidas en 3
}
if (!variable_global_exists("game_over")) {
    global.game_over = false; // Inicializa el estado de Game Over
}

// Evento Step de Controlador_de_vidas

if (global.vidas <= 0) {
    global.game_over = true; // Cambia el estado a Game Over
}

// Verifica si se presiona la tecla R para reiniciar
if (global.game_over && keyboard_check_pressed(ord("R"))) {
    global.vidas = 3;  // Reinicia las vidas
    global.contador_monedas = 0; // Reinicia el contador de monedas
    global.game_over = false; // Restablece el estado de Game Over
    room_goto(Room2); // Cambia a la habitación principal (Room2)
}

// Evento Draw de Controlador_de_vidas
var x_pos = 110;  // Posición horizontal para las vidas
var y_pos = 5;  // Posición vertical para las vidas
draw_text(x_pos, y_pos, "Vidas: " + string(global.vidas));

if (global.game_over) {
    var game_over_texto = "Game Over";
    var game_over_x = (room_width / 2) - (string_width(game_over_texto) / 2);
    var game_over_y = (room_height / 2) - 10;
    draw_text(game_over_x, game_over_y, game_over_texto);
    
    var restart_texto = "Presiona R para volver a Room2";
    var restart_x = (room_width / 2) - (string_width(restart_texto) / 2);
    var restart_y = game_over_y + 20;
    draw_text(restart_x, restart_y, restart_texto);
}
