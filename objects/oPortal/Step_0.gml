if place_meeting(x,y,oPla) && !instance_exists(oAnimacion)
	{
		
		//global.player_layer = layer_get_id("obj_player");
		var inst = instance_create_depth(0,0,-9999,oAnimacion);
		inst.target_x = target_x;
		inst.target_y = target_y;
		inst.target_rm = target_rm;
	}
