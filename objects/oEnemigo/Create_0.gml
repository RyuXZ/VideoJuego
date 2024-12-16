// Evento Create de oEnemigo

// Establecer posición inicial del enemigo
x = 100; // Nueva posición X
y = room_height - 100; // Nueva posición Y (cerca de la parte inferior)

// Inicializa las variables necesarias
pursue = false; // Estado de persecución
pursue_timer = 0; // Temporizador de persecución
pursuing_time = 60; // Tiempo máximo de persecución (en pasos)
direction = irandom(3); // Dirección inicial aleatoria
separation_distance = 30; // Distancia mínima para separación
enemy_speed = 2; // Velocidad del enemigo
