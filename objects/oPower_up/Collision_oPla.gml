// Activar la habilidad de eliminar enemigos
with (other) {
    puede_eliminar_enemigos = true;  // Habilitar la habilidad de eliminar
    tiempo_habilidad = room_speed * 5; // Duración de 5 segundos
}

// Destruir el power-up después de recogerlo
instance_destroy();
