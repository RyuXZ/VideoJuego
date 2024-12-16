// Evento Draw del menú principal

// Verifica que la fuente esté disponible y la configura
if (fntMenu != undefined) {
    draw_set_font(fntMenu); // Usa la fuente del menú
} else {
    show_debug_message("Fuente fntMenu no encontrada. Usando la fuente predeterminada.");
}

// Dibuja el título del menú
draw_set_color(c_black); // Color del texto
draw_text(base_x, base_y - 100, "Menu_Principal"); // Título centrado en la parte superior

// Verifica y dibuja las opciones con la opción actual en color amarillo
if (text == 0) {
    draw_set_color(c_yellow); // Resalta "Jugar" en amarillo
    draw_text(base_x, base_y, "Jugar");
    draw_set_color(c_white); // Las demás opciones en blanco
    draw_text(base_x, base_y + offset, "Instrucciones");
    draw_text(base_x, base_y + 2 * offset, "Creditos");
    draw_text(base_x, base_y + 3 * offset, "Salir");
}

if (text == 1) {
    draw_set_color(c_white); // Las demás opciones en blanco
    draw_text(base_x, base_y, "Jugar");

    draw_set_color(c_yellow); // Resalta "Instrucciones" en amarillo
    draw_text(base_x, base_y + offset, "Instrucciones");

    draw_set_color(c_white); // Las otras opciones en blanco
    draw_text(base_x, base_y + 2 * offset, "Creditos");
    draw_text(base_x, base_y + 3 * offset, "Salir");
}

if (text == 2) {
    draw_set_color(c_white); // Las demás opciones en blanco
    draw_text(base_x, base_y, "Jugar");
    draw_text(base_x, base_y + offset, "Instrucciones");

    draw_set_color(c_yellow); // Resalta "Creditos" en amarillo
    draw_text(base_x, base_y + 2 * offset, "Creditos");

    draw_set_color(c_white); // Las otras opciones en blanco
    draw_text(base_x, base_y + 3 * offset, "Salir");
}

if (text == 3) {
    draw_set_color(c_white); // Las demás opciones en blanco
    draw_text(base_x, base_y, "Jugar");
    draw_text(base_x, base_y + offset, "Instrucciones");
    draw_text(base_x, base_y + 2 * offset, "Creditos");

    draw_set_color(c_yellow); // Resalta "Salir" en amarillo
    draw_text(base_x, base_y + 3 * offset, "Salir");
}
