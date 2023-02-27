var player = instance_place(x, y, obj_player)

if ((light == undefined) && (player != noone)) {
	light = light_create_point(x, y, 64000, $FFFFFFFF, 500, 0)
	light_add_to_world(light)
}

if (light != undefined) {
	if (player == noone) {
		if (light[| eLight.Intensity] > 0.2) {
			light[| eLight.Intensity] = lerp(light[| eLight.Intensity], 0, 0.1)
		}
		else {
			light_remove_from_world(light)
			light = light_destroy(light)
		}
	}
	else if (light[| eLight.Intensity] < 4.9) {
		light[| eLight.Intensity] = lerp(light[| eLight.Intensity], 5, 0.05)
	}
}