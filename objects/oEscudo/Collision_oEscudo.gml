if (!activo) {
    // Activar el escudo
    jugador = other; // Guardar referencia al jugador
    jugador.escudo_activo = true; // Activar protección en el jugador
    activo = true; // Cambiar estado del escudo
    visible = false; // Hacer el objeto invisible
}
