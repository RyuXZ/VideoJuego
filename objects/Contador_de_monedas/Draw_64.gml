// Evento Draw de Controlador_de_monedas
var monedas_pos = 280; // Posición horizontal para las monedas (ajustada más a la izquierda)
var monedas_y_pos = 25; // Posición vertical para las monedas (ajustada más arriba)
draw_set_color(c_yellow); // Color blanco para el texto
draw_text(monedas_pos, monedas_y_pos, "Monedas: " + string(global.contador_monedas)); // Muestra el contador de monedas
