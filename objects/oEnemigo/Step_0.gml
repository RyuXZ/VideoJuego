// Evento Step de oEnemigo

// Definir límites del área de movimiento
var left_limit = 50; // Límite izquierdo
var right_limit = room_width - 50; // Límite derecho
var top_limit = 50; // Límite superior
var bottom_limit = room_height - 50; // Límite inferior

// Lógica para perseguir al jugador
var player = instance_nearest(x, y, oPla); // Encuentra al jugador más cercano

if (player != noone && pursue)
{
    // Mueve el enemigo hacia el jugador
    var distance_to_player = point_distance(x, y, player.x, player.y);
    
    if (distance_to_player > 30) // Distancia mínima antes de detenerse
    {
        if (player.x > x)
        {
            x += 1; // El enemigo se mueve a la derecha
        }
        else if (player.x < x)
        {
            x -= 1; // El enemigo se mueve a la izquierda
        }
        
        // Movimiento vertical si es necesario
        if (player.y > y)
        {
            y += 1; // El enemigo se mueve hacia abajo
        }
        else if (player.y < y)
        {
            y -= 1; // El enemigo se mueve hacia arriba
        }
    }
    
    // Actualiza el temporizador de persecución
    pursue_timer++;
    
    // Si el temporizador se ha agotado, detén la persecución
    if (pursue_timer >= pursuing_time)
    {
        pursue = false; // Deja de perseguir
        pursue_timer = 0; // Reinicia el temporizador
    }
}
else if (player != noone)
{
    // Si el jugador está muy cerca, comienza a perseguir
    if (point_distance(x, y, player.x, player.y) < 100) // Cambia el rango según sea necesario
    {
        pursue = true; // Inicia persecución
        pursue_timer = 0; // Reinicia el temporizador
    }
}

// Si no se está persiguiendo al jugador, movimiento aleatorio
if (!pursue)
{
    // Lógica para que los enemigos cambien de dirección aleatoriamente
    if (random(100) < 10) // Cambia de dirección con una probabilidad del 10%
    {
        direction = irandom(3); // Elige una nueva dirección aleatoria
    }

    // Movimiento en la dirección elegida
    switch (direction)
    {
        case 0: // Izquierda
            x -= 1;
            break;
        case 1: // Derecha
            x += 1;
            break;
        case 2: // Arriba
            y -= 1;
            break;
        case 3: // Abajo
            y += 1;
            break;
    }
}

// Comprobación de límites del área de movimiento
if (x < left_limit) 
{
    x = left_limit; // No permitir que el enemigo se salga por el límite izquierdo
}
else if (x > right_limit)
{
    x = right_limit; // No permitir que el enemigo se salga por el límite derecho
}

if (y < top_limit) 
{
    y = top_limit; // No permitir que el enemigo se salga por el límite superior
}
else if (y > bottom_limit)
{
    y = bottom_limit; // No permitir que el enemigo se salga por el límite inferior
}

// Lógica para evitar que los enemigos se junten entre sí
with (oEnemigo)
{
    if (id != other.id) // Asegúrate de que no esté comparando consigo mismo
    {
        var dist = point_distance(x, y, other.x, other.y);
        if (dist < separation_distance) // Si están demasiado cerca
        {
            // Alejarse del otro enemigo
            var angle = point_direction(x, y, other.x, other.y);
            x += lengthdir_x(enemy_speed, angle + 180); // Mueve en la dirección opuesta
            y += lengthdir_y(enemy_speed, angle + 180);
        }
    }
}

// Lógica para evitar bloquear el camino del jugador
if (player != noone)
{
    var player_dist = point_distance(x, y, player.x, player.y);
    if (player_dist < 50) // Si el enemigo está demasiado cerca del jugador
    {
        // Alejarse del jugador
        var angle_to_player = point_direction(x, y, player.x, player.y);
        x += lengthdir_x(enemy_speed, angle_to_player + 180); // Mueve en la dirección opuesta al jugador
        y += lengthdir_y(enemy_speed, angle_to_player + 180);
    }
}
