// Evento Draw de oDead
draw_set_alpha(0.9); // Aumenta la opacidad del fondo
draw_rectangle(0, 0, room_width, room_height, true); // Rectángulo que cubre toda la pantalla
draw_set_alpha(1); // Restablece la transparencia

// Dibuja el sprite de oDead ajustado en Room1
if (room == Room1) {
    draw_sprite(sDead, 0, room_width / 10 - 150, room_height / 2 - 180); // Mucho más arriba en Room1
} else {
    draw_sprite(sDead, 0, room_width / 2 - 150, room_height / 2 - 150); // Mucho más arriba en Room2 y Room3
}
