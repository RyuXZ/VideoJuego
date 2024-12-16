if (cambio_activo) {
    alpha += velocidad_alpha; // Incrementa la transparencia
    if (alpha >= 1) {
        alpha = 1; // Limita la transparencia al máximo
        room_goto(sala_destino); // Cambia a la sala destino
        cambio_activo = false; // Inicia el desvanecimiento
    }
} else {
    alpha -= velocidad_alpha; // Reduce la transparencia
    if (alpha <= 0) {
        instance_destroy(); // Elimina el objeto cuando termine la transición
    }
}
