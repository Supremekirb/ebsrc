
UNKNOWN_C41A7D: ;$C41A7D
	EBMOVE_SET_X $0018
	EBMOVE_SET_Y $0020
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $3C
@UNKNOWN0:
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::UP, $00
	EBMOVE_PAUSE $05
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::UP, $01
	EBMOVE_PAUSE $05
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $05
	EBMOVE_SHORTJUMP .LOWORD(@UNKNOWN0)
