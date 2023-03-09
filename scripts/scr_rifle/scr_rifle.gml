#macro RIFLE_DAMAGE 10
#macro RIFLE_RANGE 50

#macro RIFLE_MAX_AMMO 60
#macro RIFLE_CLIP     12

#macro RIFLE_RELOAD_FRAMES   FPS * 1.2
#macro RIFLE_COOLDOWN_FRAMES FPS * 0.3
#macro RIFLE_BURST_FRAMES FPS * 0.1
#macro RIFLE_BURST_AMOUNT 3

function Rifle() : Weapon() constructor {

	// from Item
	sprite = spr_rifle
	
	// from Weapon
	damage = RIFLE_DAMAGE
	
	// RIFLE
	ammo = RIFLE_MAX_AMMO
	clip = RIFLE_CLIP
	
	burst = 0;

	static alarm_one = function() {
		state = weapon_state.idle
		instance.sprite_index = spr_rifle
		if ((clip + ammo) < RIFLE_CLIP) {
			clip = ammo
			ammo = 0
		}
		else {
			ammo -= (RIFLE_CLIP - clip)
			clip = RIFLE_CLIP
		}
	}
	
	static alarm_two = function() { 
		state = weapon_state.idle 
	}
	
	static alarm_three = function() {
		state = weapon_state.shooting	
	}
	
	static use = function() {
		switch (state) {
			case weapon_state.idle:
				if ((mouse_check_button(global.ATTACK_BUTTON)) && (clip >= 1)) {
					state = weapon_state.shooting
					if burst == 0 burst = RIFLE_BURST_AMOUNT;
				}
				else if (((keyboard_check_pressed(global.RELOAD_GUN_KEY)) || ((clip <= 0) && (mouse_check_button(global.ATTACK_BUTTON)))) && ammo != 0) {
					state = weapon_state.reloading
					instance.sprite_index = spr_rifle_reloading
				}	
				break
			case weapon_state.reloading:
				if (instance.alarm[1] == -1) {
					instance.alarm[1] = RIFLE_RELOAD_FRAMES
				} 
				break
			case weapon_state.cooldown:
				if (instance.alarm[2] == -1) {
					instance.alarm[2] = RIFLE_COOLDOWN_FRAMES
				} 
				instance_offset = lerp(instance_offset, 25, 0.1);
				break
			case weapon_state.shooting: 
				if (burst > 0)
					{
						var _direction = point_direction(instance.x, instance.y, mouse_x, mouse_y)
						with (instance_create_layer(instance.x, instance.y, "other", obj_projectile, { sprite_index: spr_bullet, speed: 10, direction: _direction, image_angle: _direction })) lifetime = RIFLE_RANGE;
						instance_offset -= 3;
						clip -= 1
						burst--;
						state = weapon_state.special
					}
				else {
				state = weapon_state.cooldown;
				burst = 0;
				}
				break
			case weapon_state.special:
				if (instance.alarm[3] == -1) {
					instance.alarm[3] = RIFLE_BURST_FRAMES
				} 
				break
		}
	}
}