
EVENT_371: ;$C3240A
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C31D4F)
	EVENT_UNKNOWN_C4258C
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0000
	EVENT_PAUSE $50*FRAMES
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0028
	EVENT_LOOP $0E
		EVENT_PAUSE $50*FRAMES
	EVENT_LOOP_END
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $001E
	EVENT_LOOP $09
		EVENT_PAUSE 1*SECOND
	EVENT_LOOP_END
	EVENT_PAUSE 1*HALF_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::RIGHT, $00
	EVENT_PAUSE 7*FRAMES
	EVENT_UNKNOWN_C0AA6E DIRECTION::UP, $00
	EVENT_PAUSE 2*FIFTEENTHS_OF_A_SECOND
	EVENT_UNKNOWN_C0AA6E DIRECTION::LEFT, $00
	EVENT_PAUSE 7*FRAMES
	EVENT_UNKNOWN_C0AA6E DIRECTION::DOWN, $00
	EVENT_PAUSE 2*FIFTEENTHS_OF_A_SECOND
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0000
	EVENT_PAUSE $5A*FRAMES
	EVENT_SHORTJUMP .LOWORD(UNKNOWN_C323F6)
