// Dibuja una pantalla negra con transparencia
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1); // Restablece la opacidad a normal
