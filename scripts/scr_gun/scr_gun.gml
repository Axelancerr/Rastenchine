#macro GUN_DAMAGE 5
#macro GUN_RANGE 30

#macro GUN_MAX_AMMO 60
#macro GUN_CLIP     6

#macro GUN_RELOAD_FRAMES   FPS * 1
#macro GUN_COOLDOWN_FRAMES FPS * 0.4

function Gun() : Weapon() constructor {

	// from Item
	sprite = spr_gun
	
	// from Weapon
	damage = GUN_DAMAGE
	
	// Gun
	ammo = GUN_MAX_AMMO
	clip = GUN_CLIP

	static alarm_one = function() {
		state = weapon_state.idle
		instance.sprite_index = spr_gun
		if ((clip + ammo) < GUN_CLIP) {
			clip = ammo
			ammo = 0
		}
		else {
			ammo -= (GUN_CLIP - clip)
			clip = GUN_CLIP
		}
	}
	
	static alarm_two = function() { 
		state = weapon_state.idle 
	}
	
	static use = function() {
		switch (state) {
			case weapon_state.idle:
				if ((mouse_check_button(global.ATTACK_BUTTON)) && (clip >= 1)) {
					var _direction = (point_direction(instance.x, instance.y, mouse_x, mouse_y) + random_range(-5,5))
					with (instance_create_layer(instance.x, instance.y, "other", obj_projectile, { sprite_index: spr_bullet, speed: 10, direction: _direction, image_angle: _direction })) lifetime = GUN_RANGE;
					instance_offset = 7;
					clip -= 1
					state = weapon_state.cooldown
				}
				else if (((keyboard_check_pressed(global.RELOAD_GUN_KEY)) || ((clip <= 0) && (mouse_check_button(global.ATTACK_BUTTON)))) && ammo != 0) {
					state = weapon_state.reloading
					instance.sprite_index = spr_gun_reloading
				}
				break
			case weapon_state.reloading:
				if (instance.alarm[1] == -1) {
					instance.alarm[1] = GUN_RELOAD_FRAMES
				} 
				break
			case weapon_state.cooldown:
				if (instance.alarm[2] == -1) {
					instance.alarm[2] = GUN_COOLDOWN_FRAMES
				} 
				instance_offset = lerp(instance_offset, 25, 0.1);
				break
		}
	}
}