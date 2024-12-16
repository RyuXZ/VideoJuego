// Evento Create de oPla

// Variables de control del diálogo
dialogo_visible = false;       // Indica si hay un diálogo visible en pantalla
dialogo_instancia = noone;     // Referencia a la instancia de diálogo creada
dialogo_destruido = true;      // Indica si el diálogo ha sido destruido
texto_visible = false;         // Controla la visibilidad del texto de diálogo

// Posición inicial del jugador
inicio_x = x;                  // Almacena la posición inicial en X
inicio_y = y;                  // Almacena la posición inicial en Y

// Velocidad del jugador
xsp = 0;                       // Velocidad en el eje X
ysp = 0;                       // Velocidad en el eje Y

// Variables para habilidades y saltos
doble_salto_habilitado = false; // Habilidad de doble salto activada
puede_doble_saltar = false;     // Controla si el jugador puede hacer un doble salto
puede_saltar = false;           // Controla si el jugador puede realizar un salto normal
tiempo_doble_salto = 0;         // Temporizador para la duración del doble salto

// Regeneración del hongo
hongo_regeneracion_tiempo = 0;  // Temporizador para regenerar el hongo
hongo_inicial_x = x;            // Posición inicial del hongo en X para regenerarlo
hongo_inicial_y = y;            // Posición inicial del hongo en Y para regenerarlo

// Mensajes
mensaje_activado = false;       // Controla si un mensaje está activado

// Variables auxiliares para colisiones y otros comportamientos
speed_x = 0;                    // Velocidad auxiliar en X (para otros objetos, como NPCs)
speed_y = 0;                    // Velocidad auxiliar en Y (para otros objetos, como NPCs)

// Inicialización del escudo
global.escudo_activado = false; // El escudo está desactivado inicialmente
tiempo_escudo = 0;              // Temporizador para la duración del escudo (0 al inicio)
