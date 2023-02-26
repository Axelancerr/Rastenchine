enum shambler_state {
	sleeping,
	idle,
	agro,
	charging,
	attacking,
	death,
}

switch (state) {
	case shambler_state.sleeping:
		_speed = 0
		sprite_index = spr_shambler_sleeping
		if (collision_circle(x, y, vision_radius, obj_player, false, false)) && obj_player._speed > 4 {state = shambler_state.agro }
		if (collision_circle(x, y, 50, obj_player, false, false)) && keyboard_check_pressed(ord("E")){
		instance_create_layer(x,y,"other",obj_tamed_shambler)
		instance_destroy()
		}
		break
	case shambler_state.idle:
			sprite_index = idle_sprite
			alarm[3] = 120
			_speed = ENEMY_DEFAULT_SPEED
			if idle_movement = 0 {
				x += _speed * irandom_range(-3, 3)
				y += _speed * irandom_range(-3, 3)
				idle_movement = 1
				alarm[1] = 60
			}
			if ((collision_circle(x, y, agro_radius, obj_player, false, false)) || agro == true) {state = shambler_state.agro} 
			break
	case shambler_state.agro:
		agro = true
		sprite_index = spr_shambler
		if (agro == true) {
			check_for_player()
			if (obj_player.x < x) { image_xscale = -1 } else { image_xscale = 1 } 
		}
		if (collision_circle(x, y, vision_radius, obj_player, false, false)
			&& !collision_circle(x, y, agro_radius, obj_player, false, false)) {state = shambler_state.idle }
		if (collision_circle(x, y,100, obj_player, false, false)) {state = shambler_state.charging}
		break
	case shambler_state.charging:
		sprite_index = spr_shambler_charging
		explode_timer += 0.1
		if sprite_index == spr_shambler_charging{_speed = 0}
		if !(collision_circle(x, y,100, obj_player, false, false)){
			_speed = ENEMY_DEFAULT_SPEED 
			explode_timer = 0 
			state = shambler_state.agro}
		if explode_timer >= 8 {state = shambler_state.attacking}
		break
	case shambler_state.attacking:
		sprite_index = spr_shambler_explode
		if image_index >= 5 {instance_destroy()}
		break
	case shambler_state.death:
		break
}