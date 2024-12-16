// Evento Step de oPla
if (global.Ganaste == false)
{
if (!global.game_over) { // Si el juego no ha terminado

    // Si el escudo está activado, disminuye el temporizador
    if (global.escudo_activado) {
        if (tiempo_escudo > 0) {
            tiempo_escudo -= 1; // Reduce el temporizador
        } else {
            global.escudo_activado = false; // Desactiva el escudo cuando el tiempo se agota
        }
    }

    if (!dialogo_visible && !mensaje_activado) { // Si no hay diálogos ni mensajes activos

        // Reproducir música si no está sonando
        if (!audio_is_playing(snd_music)) {
            audio_play_sound(snd_music, 1, true);
            audio_sound_gain(snd_music, 0.3, 0);
        }

        // Gravedad y reinicio de velocidad lateral
        ysp += 0.1;  // Gravedad constante
        xsp = 0;     // Reinicio de velocidad en X

        // Movimiento lateral con teclado
        if (keyboard_check(vk_left)) xsp = -1;    
        if (keyboard_check(vk_right)) xsp = 1;

        // Saltos y detección de suelo
        if (place_meeting(x, y + 1, oSolid)) { 
            ysp = 0;                        // Detiene el movimiento en Y si está en el suelo
            puede_saltar = true;            // Permite saltar
            puede_doble_saltar = doble_salto_habilitado; // Permite doble salto si está habilitado

            if (keyboard_check_pressed(vk_up)) { // Salto normal
                ysp = -2; 
                audio_play_sound(snd_up, 1, false);
                puede_saltar = false;
            }
        } else if (puede_doble_saltar && keyboard_check_pressed(vk_up)) { // Doble salto
            ysp = -2;
            audio_play_sound(snd_up, 1, false);
            puede_doble_saltar = false;
        }

        // Movimiento y colisiones con objetos sólidos
        move_and_collide(xsp, ysp, oSolid);

        // Colisión con picos y enemigos (oSpike - oEnemigo)
        if (!global.escudo_activado && (place_meeting(x, y, oSpike) || place_meeting(x, y, oEnemigo))) {
            global.vidas -= 1;
            audio_stop_all();
            audio_play_sound(snd_colision, 1, false);

            if (global.vidas <= 0) { // Game over si las vidas se acaban
                global.game_over = true;
                audio_stop_all();
                audio_play_sound(snd_gameover, 1, false);
                instance_destroy(); // Destruye al jugador

                if (object_exists(oDead)) {
                    var spr_oDead = object_get_sprite(oDead);
                    if (sprite_exists(spr_oDead)) {
                        instance_create_layer(
                            room_width / 2 - sprite_get_width(spr_oDead) / 2,
                            room_height / 2 - sprite_get_height(spr_oDead) / 2,
                            "Instances",
                            oDead
                        );
                    } else {
                        show_error("El objeto oDead no tiene un sprite asignado", true);
                    }
                } else {
                    show_error("El objeto oDead no existe", true);
                }
            } else { // Reinicia la posición del jugador
                x = inicio_x;
                y = inicio_y;
                audio_play_sound(snd_music, 1, true);
                audio_sound_gain(snd_music, 0.3, 0);
            }
        }

        // Recolección de monedas (oMoneda)
        if (place_meeting(x, y, oMoneda)) {
            audio_play_sound(snd_moneda, 1, false);
            var moneda = instance_place(x, y, oMoneda);
            if (moneda != noone) {
                global.contador_monedas += 1; // Incrementa el contador de monedas
                instance_destroy(moneda);    // Elimina la moneda recolectada
            }
        }

        // Colisión con la bandera (oFlag)
        if (place_meeting(x, y, oFlag)) {
            audio_play_sound(snd_bandera, 1, false);
            room_goto_next(); // Cambia a la siguiente sala
        }

        // Interacción con el hongo (habilitar doble salto)
        if (place_meeting(x, y, oHongo)) {
            var hongo = instance_place(x, y, oHongo);
            if (hongo != noone) {
                doble_salto_habilitado = true;  // Habilita el doble salto
                hongo_regeneracion_tiempo = 300;  // Temporizador para que el efecto dure 5 segundos
                instance_destroy(hongo);    // Destruye el hongo
            }
        }

        // Temporizador de doble salto
        if (hongo_regeneracion_tiempo > 0) {
            hongo_regeneracion_tiempo -= 1;
        } else {
            doble_salto_habilitado = false; // Desactiva el doble salto después de 5 segundos
        }

        // Colisión con el escudo (oEscudo) y activar escudo
        if (place_meeting(x, y, oEscudo)) {
            var escudo = instance_place(x, y, oEscudo);
            if (escudo != noone) {
                global.escudo_activado = true;  // Activa el escudo
                tiempo_escudo = 300;            // Establece el tiempo del escudo a 5 segundos (300 frames)
                instance_destroy(escudo);       // Destruye el escudo recolectado
            }
        }

        // Recolección del power-up (dar una vida extra)
        if (place_meeting(x, y, oPower_up)) {
            var power_up = instance_place(x, y, oPower_up);
            if (power_up != noone) {
                global.vidas += 1; // Incrementa las vidas del jugador
                global.contador_monedas += 50; // Incrementa las monedas del jugador
                instance_destroy(power_up); // Elimina el power-up recolectado
				audio_play_sound(snd_Powerup, 1, false);
    }
            }
        }

        /* Cambiar de sala al tocar el portal automáticamente
        if (place_meeting(x, y, oPortal)) {
            room_goto(Room1); // Cambia a la sala Room1 directamente
        }

        // Colisión con el portal de Room1 y cambio a Room2
        if (place_meeting(x, y, oPortal) && room == Room1) {
            room_goto(Room2); // Cambia a la sala Room2
        }*/
    }
	

    // Interacción con NPC (oAfk)
    var afk_instancia = instance_nearest(x, y, oAfk);
    if (afk_instancia != noone && point_distance(x, y, afk_instancia.x, afk_instancia.y) < 35) {
        if (keyboard_check_pressed(ord("E")) && dialogo_destruido) { 
            dialogo_instancia = instance_create_layer(afk_instancia.x, afk_instancia.y - 9, "Instances", oDialogo);
            dialogo_instancia.image_xscale = afk_instancia.image_xscale * 1.5;
            dialogo_instancia.image_yscale = afk_instancia.image_yscale * 1.5;
            dialogo_visible = true;
            dialogo_destruido = false;
            texto_visible = true;
        }

        if (dialogo_visible && keyboard_check_pressed(ord("O"))) { // Destruye el diálogo
            if (instance_exists(dialogo_instancia)) {
                instance_destroy(dialogo_instancia);
                dialogo_instancia = noone;
            }
            dialogo_visible = false;
            dialogo_destruido = true;
            texto_visible = false;
        }
    }

    // Mensaje al interactuar con oCartel
    if (place_meeting(x, y, oCartel)) {
        if (keyboard_check_pressed(ord("E"))) mensaje_activado = true;
        if (keyboard_check_pressed(ord("O"))) mensaje_activado = false;
    }

} else { // Lógica para el game over
    if (keyboard_check_pressed(ord("R"))) { // Reinicia el juego
        global.vidas = 3;
        global.game_over = false;
        room_restart();
        audio_stop_all();
        audio_play_sound(snd_music, 1, true);
    }
}

