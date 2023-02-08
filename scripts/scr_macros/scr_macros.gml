#macro DEBUG true

// camera view
#macro VIEW_WIDTH  camera_get_view_width(view_camera[0])
#macro VIEW_HEIGHT camera_get_view_height(view_camera[0])
#macro VIEW_MARGIN 10
 
// positions
#macro UI_X1 VIEW_MARGIN
#macro UI_Y1 VIEW_MARGIN
#macro UI_X2 VIEW_WIDTH - VIEW_MARGIN
#macro UI_Y2 VIEW_HEIGHT - VIEW_MARGIN

// spacing
#macro UI_MARGIN   5
#macro UI_PADDING  5
#macro UI_ROUNDING 10
#macro UI_TUNING   2

// colours
#macro UI_BG_COLOUR        #7F7F7F
#macro UI_BG_ACTIVE_COLOUR #A6A6A6
#macro UI_FG_COLOR         #000000

#region Health Bar
// sizes
#macro HEALTH_BAR_SPRITE spr_heart
#macro HEALTH_BAR_SCALE  10
#macro HEALTH_BAR_WIDTH  sprite_get_width(HEALTH_BAR_SPRITE) * HEALTH_BAR_SCALE
#macro HEALTH_BAR_HEIGHT sprite_get_height(HEALTH_BAR_SPRITE)
//bar background
#macro HEALTH_BAR_BG_X1  UI_X2 - HEALTH_BAR_WIDTH - (UI_PADDING * 2) + UI_TUNING
#macro HEALTH_BAR_BG_Y1  UI_Y1 - UI_TUNING
#macro HEALTH_BAR_BG_X2  UI_X2 
#macro HEALTH_BAR_BG_Y2  HEALTH_BAR_BG_Y1 + HEALTH_BAR_HEIGHT + (UI_PADDING * 2) - UI_TUNING
#macro HEALTH_BAR_MIDDLE HEALTH_BAR_BG_Y1 + (HEALTH_BAR_HEIGHT / 2) + UI_PADDING - UI_TUNING
// bar sprite
#macro HEALTH_BAR_X      HEALTH_BAR_BG_X1 + UI_PADDING
#macro HEALTH_BAR_Y      HEALTH_BAR_BG_Y1 + UI_PADDING
#endregion

#region Stamina Bar
// sizes
#macro STAMINA_BAR_SCALE  0.85
#macro STAMINA_BAR_WIDTH  HEALTH_BAR_WIDTH * STAMINA_BAR_SCALE
#macro STAMINA_BAR_HEIGHT HEALTH_BAR_HEIGHT * STAMINA_BAR_SCALE
// bar background
#macro STAMINA_BAR_BG_X1  UI_X2 - STAMINA_BAR_WIDTH - (UI_PADDING * 2)
#macro STAMINA_BAR_BG_Y1  HEALTH_BAR_BG_Y2 + UI_MARGIN
#macro STAMINA_BAR_BG_X2  UI_X2
#macro STAMINA_BAR_BG_Y2  STAMINA_BAR_BG_Y1 + STAMINA_BAR_HEIGHT + (UI_PADDING * 2)
#macro STAMINA_BAR_MIDDLE STAMINA_BAR_BG_Y1 + (STAMINA_BAR_HEIGHT / 2) + UI_PADDING
// bar foreground
#macro STAMINA_BAR_FG_X1  STAMINA_BAR_BG_X1 + UI_PADDING
#macro STAMINA_BAR_FG_Y1  STAMINA_BAR_BG_Y1 + UI_PADDING
#macro STAMINA_BAR_FG_X2  STAMINA_BAR_BG_X2 - UI_PADDING
#macro STAMINA_BAR_FG_Y2  STAMINA_BAR_BG_Y2 - UI_PADDING
#endregion

#region Menu
// spacing
#macro ELEMENT_MARGIN  5
#macro ELEMENT_PADDING 15
// sizes
#macro ELEMENT_HEIGHT  string_height("HEIGHT") + ELEMENT_PADDING
// positions
#macro MENU_X          UI_X1
#macro MENU_PAGE_Y     UI_Y1
#macro MENU_SUB_PAGE_Y (MENU_PAGE_Y + ELEMENT_HEIGHT + ELEMENT_MARGIN) * 1.2 
#endregion