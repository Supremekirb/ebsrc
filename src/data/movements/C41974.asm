
UNKNOWN_C41974: ;$C41974
	EBMOVE_SET_X_VELOCITY $0000
	EBMOVE_SET_Y_VELOCITY $FE00
@UNKNOWN0:
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::UP, $00
	EBMOVE_PAUSE $04
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::UP, $01
	EBMOVE_PAUSE $04
	EBMOVE_SHORTJUMP .LOWORD(@UNKNOWN0)
