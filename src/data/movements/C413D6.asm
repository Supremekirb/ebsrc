
UNKNOWN_C413D6: ;$C413D6
	EBMOVE_SET_X $0018
	EBMOVE_SET_Y $002A
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $FF
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $25
@UNKNOWN0:
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $78
	EBMOVE_UNKNOWN_C0AA6E DIRECTION::RIGHT, $00
	EBMOVE_PAUSE $3C
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $14
	EBMOVE_UNKNOWN_C0AAD5 $01, $13E8
	EBMOVE_SET_10F2 $FF
	EBMOVE_PAUSE $B4
	EBMOVE_SHORTJUMP .LOWORD(@UNKNOWN0)
