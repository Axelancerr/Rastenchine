draw_self()

draw_circle_color(x, y, _attack_radius, c_green, c_red, true)
draw_circle_color(x, y, _vision_radius, c_green, c_blue, true)
draw_circle_color(x, y, _agro_radius, c_green, c_green, true)

draw_healthbar(x, y - 16, x + 64, y - 5, _hp, c_black, c_red, c_red, 0, false, false)

if (keyboard_check(ord("P"))) {
	draw_path(path, x, y, 0)	
}