#macro PLAYER_HEALTH  (100)

#macro PLAYER_MIN_STAMINA (0)
#macro PLAYER_MAX_STAMINA (100)

#macro PLAYER_DODGE_FRAMES        (FPS / 2)

#macro PLAYER_WALK_SPEED      (4)
#macro PLAYER_RUN_SPEED       (7)
#macro PLAYER_DODGE_SPEED     (10)
#macro PLAYER_EXHAUSTED_SPEED (2)

event_inherited()

_health = PLAYER_HEALTH
inventory = new Inventory()

enum player_movement_state {
	not_moving,
	walking,
	running,
	dodging,
	exhausted,
}
movement_state = player_movement_state.not_moving

x_input = 0
y_input = 0
wasd_input = false
run_input = false
dodge_input = false

_direction = 0
x_movement = 0
y_movement = 0

_speed = PLAYER_WALK_SPEED

stamina = PLAYER_MAX_STAMINA
stamina_lock = false

// make everything dark
global.ambientShadowIntensity = 0.95

// spawn light instances
instance_create_layer(x, y, "Player", obj_flash_light)
instance_create_layer(x, y, "Player", obj_area_light)
