if (activo) {
    // Reducir el tiempo del escudo
    tiempo_escudo -= 1 / room_speed;
    
    // Si el tiempo llega a 0, desactivar el escudo
    if (tiempo_escudo <= 0) {
        jugador.escudo_activo = false; // Desactivar protección en el jugador
        instance_destroy(); // Eliminar el objeto escudo
    }
}
