draw_set_font(fnt_menu)
draw_set_valign(fa_middle)
draw_set_halign(fa_left)

draw_rectangle_colour(
	X1, Y1, X2, Y2, 
	_colour, _colour, _colour, _colour, 
	false
)
draw_text_colour(
	X1 + (ELEMENT_PADDING / 2), 
	Y1 + (HEIGHT / 2) + ELEMENT_FONT_TUNING, 
	TEXT,
	TEXT_COLOUR, TEXT_COLOUR, TEXT_COLOUR, TEXT_COLOUR,
	1
)

switch (ACTION) {
	case menu_element_action.shift_value:
		draw_rectangle_colour(
			X2 + ELEMENT_MARGIN, Y1,
			X2 + 200 + ELEMENT_MARGIN, Y2,
			_colour, _colour, _colour, _colour,
			false
		)
		break
}
