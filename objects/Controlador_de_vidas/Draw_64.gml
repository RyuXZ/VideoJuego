// Evento Draw GUI de Controlador_de_vidas

// Color y posición del texto de vidas
var x_pos = 120;  // Posición horizontal para las vidas
var y_pos = 25;  // Posición vertical para las vidas
draw_set_color(c_green); // Color blanco para el texto
draw_text(x_pos, y_pos, "Vidas: " + string(global.vidas));

// Mensaje de Game Over
if (global.game_over) {
    // Dimensiones de la pantalla GUI
    var gui_width = display_get_gui_width();
    var gui_height = display_get_gui_height();

    // Centrar el texto en la GUI
    var center_x = gui_width / 2;
    var center_y = gui_height / 2;

    // Texto principal: "Game Over"
    var game_over_texto = "GAME OVER";
    var restart_texto = "Presiona R para reiniciar";

    // Texto principal: "Game Over"
    var game_over_x = center_x - (string_width(game_over_texto) / 2);
    var game_over_y = center_y - 20;

    draw_set_color(c_red); // Color rojo para el texto de "Game Over"
    draw_text(game_over_x, game_over_y, game_over_texto);

    // Ajustar el texto de reinicio: "Presiona R para reiniciar"
    var restart_x = center_x - (string_width(restart_texto) / 2);
    var restart_y = game_over_y + 40;

    // Desplazar a la derecha el texto de reinicio
    var desplazamiento_derecha = 150;  // Mover el texto más a la derecha
    restart_x += desplazamiento_derecha;  // Aplicar el desplazamiento

    draw_set_color(c_white); // Color blanco para el texto de reinicio
    draw_text(restart_x, restart_y, restart_texto);
}
