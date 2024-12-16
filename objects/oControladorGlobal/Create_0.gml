// En el evento Create de oControladorGlobal

// Ajusta el tamaño de la ventana a 1280x720
window_set_size(1280, 720);

// Verifica si la variable global de contador de monedas existe, y si no, la inicializa
if !(variable_global_exists("global.contador_monedas"))
{
    global.contador_monedas = 0; // Inicializa el contador solo si no existe
}

// Evento Create de oControladorGlobal
global.room_inicial = Room1; // Asumiendo que Room1 es el nombre de tu primera sala


// Evento Create de oControladorGlobal o similar
global.frames = 0; // Inicializa el contador de frames

//

global.Ganaste = false;