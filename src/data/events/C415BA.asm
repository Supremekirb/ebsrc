
UNKNOWN_C415BA: ;$C415BA
	EVENT_SET_X $0018
	EVENT_SET_Y $0028
	EVENT_UNKNOWN_C0AA6E DIRECTION::UP, $00
	EVENT_PAUSE $08
	EVENT_UNKNOWN_C0AA6E DIRECTION::RIGHT, $00
	EVENT_PAUSE $08
	EVENT_UNKNOWN_C0AA6E DIRECTION::DOWN, $00
	EVENT_PAUSE $08
	EVENT_UNKNOWN_C0AA6E DIRECTION::LEFT, $00
	EVENT_PAUSE $08
@UNKNOWN0:
	EVENT_SET_ANIMATION $FF
	EVENT_PAUSE $01
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN0)
