
MOVEMENT_534: ;$C41020
	EBMOVE_SHORTCALL .LOWORD(UNKNOWN_C40F59)
@UNKNOWN0:
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::DOWN_RIGHT, $00
	EBMOVE_PAUSE $14
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::UP_RIGHT, $00
	EBMOVE_PAUSE $14
	EBMOVE_SHORTJUMP .LOWORD(@UNKNOWN0)
