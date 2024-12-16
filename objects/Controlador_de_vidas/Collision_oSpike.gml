// Evento Draw de Controlador_de_vidas
var x_pos = 110;  // Posición horizontal para las vidas
var y_pos = 5;  // Posición vertical para las vidas

// Dibuja el texto de vidas
var vidas_texto = "Vidas: " + string(global.vidas); // Esto mostrará 0 si global.vidas es 0
draw_text(x_pos, y_pos, vidas_texto);

// Dibuja el mensaje de Game Over si se han perdido todas las vidas
if (global.vidas <= 0) {
    var game_over_texto = "Game Over";
    var game_over_x = (room_width / 2) - (string_width(game_over_texto) / 2); // Centrado horizontalmente
    var game_over_y = (room_height / 2) - 10; // Un poco más arriba del centro

    // Dibuja el mensaje de Game Over
    draw_text(game_over_x, game_over_y, game_over_texto);
}
