
EVENT_292: ;$C30EB9
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A039)
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY2)
	EVENT_SET_ANIMATION $FF
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48BE1
	EVENT_UNKNOWN_C0A685 $80, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1C60
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $0B70
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::LEFT
	EVENT_SET_DIRECTION
	EVENT_WRITE_WORD_TEMPVAR $0005
	EVENT_UNKNOWN_C0C83B
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_PAUSE $73*FRAMES
	EVENT_UNKNOWN_C0A92D $0440
	EVENT_ADD ACTIONSCRIPT_VARS::V7, $FFFF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C47333
	EVENT_LOOP_TEMPVAR
		EVENT_LOOP $0C
			EVENT_SET_X_VELOCITY $0001
			EVENT_PAUSE 1*FRAME
			EVENT_SET_X_VELOCITY $FFFF
			EVENT_PAUSE 1*FRAME
		EVENT_LOOP_END
	EVENT_LOOP_END
	EVENT_SET_VELOCITIES_ZERO
	EVENT_YIELD_TO_TEXT
	EVENT_UNKNOWN_C03F1E
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
