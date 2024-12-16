// Texto de victoria
var mensaje1 = "YOU WIN!";
var mensaje2 = "Press ENTER."; // Texto más directo

// Desplazamiento adicional hacia la derecha
var desplazamiento_derecha = 100; // Ajuste de posición horizontal

// Calcular las posiciones para centrar los textos y desplazarlos
var texto1_x = (320 - string_width(mensaje1)) / 2 + desplazamiento_derecha;
var texto1_y = (180 / 2) - 20; // Centrado verticalmente con ajuste

var texto2_x = (320 - string_width(mensaje2)) / 2 + desplazamiento_derecha;
var texto2_y = texto1_y + 30; // Espaciado más pequeño debajo del primer mensaje

// Cambiar el color del texto y establecer la fuente
draw_set_color(c_yellow); 
draw_set_font(fnt_victoria); 

// Dibujar los textos
draw_text(texto1_x, texto1_y, mensaje1);
draw_text(texto2_x, texto2_y, mensaje2);

// Restaurar el color y la fuente por defecto
draw_set_color(c_white);
draw_set_font(-1);
