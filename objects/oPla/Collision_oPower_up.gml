image_xscale = 1.5;
image_yscale = 1.5;

// Temporizador para revertir efecto
alarm[0] = room_speed * 5; // 5 segundos de power-up

// Destruir power-up
instance_destroy(other);