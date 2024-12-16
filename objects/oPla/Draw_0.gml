// Dibuja el sprite del jugador
draw_self();

// Si el texto "Así es la fucking life :(" es visible, dibuja el texto más a la derecha arriba del jugador
if (texto_visible) {
    var texto = "fucking life :("; // Texto ajustado
    var texto_ancho = string_width(texto); // Ancho del texto
    var texto_altura = string_height(texto); // Altura del texto

    // Ajustes para posicionar el texto mucho más a la derecha
    var offset_x = x - texto_ancho / 2 + 100; // Mueve el texto 100 píxeles hacia la derecha
    var offset_y = y - sprite_height - texto_altura - 10; // Posición del texto más arriba del jugador

    // Dibuja el texto directamente (sin rectángulo de fondo)
    draw_set_color(c_white); // Texto blanco
    draw_text(offset_x, offset_y, texto);
}

// Si el mensaje "PURO $AD BOYZ" está activado, dibuja este mensaje más a la derecha arriba del jugador
if (mensaje_activado) {
    var mensaje = "$AD BOYZ"; // Texto del mensaje
    var mensaje_ancho = string_width(mensaje); // Ancho del mensaje
    var mensaje_altura = string_height(mensaje); // Altura del mensaje

    // Ajustes para posicionar el mensaje más a la derecha
    var mensaje_offset_x = x - mensaje_ancho / 2 + 80; // Mueve el mensaje 100 píxeles hacia la derecha
    var mensaje_offset_y = y - sprite_height - mensaje_altura - 25; // Posición del mensaje más arriba del texto principal

    // Dibuja el mensaje directamente (sin rectángulo de fondo)
    draw_set_color(c_black);
    draw_text(mensaje_offset_x, mensaje_offset_y, mensaje);
}
