
EVENT_483: ;$C34029
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A039)
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY2)
	EVENT_SET_ANIMATION $FF
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48BE1
	EVENT_UNKNOWN_C0A685 $C0, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_UNKNOWN_C0A938 $00FC
	EVENT_ADD ACTIONSCRIPT_VARS::V6, $FFF8
	EVENT_ADD ACTIONSCRIPT_VARS::V7, $FFEA
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
.IF .DEFINED(USA) && (!.DEFINED(PROTOTYPE19950327))
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_WINS_TASCO_ACROSS
.ELSE
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_PU
.ENDIF
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(UNKNOWN_C34075)
	EVENT_SET_VELOCITIES_ZERO
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
UNKNOWN_C34075: ;$C34075
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::DOWN
	EVENT_SET_DIRECTION
	EVENT_PAUSE 1*THIRTIETH_OF_A_SECOND
	EVENT_YIELD_TO_TEXT
	EVENT_UNKNOWN_C46712
UNKNOWN_C34086: ;$C34086
	EVENT_UNKNOWN_C0A86F $00FC
	EVENT_SET_X_RELATIVE $FFF8
	EVENT_SET_Y_RELATIVE $FFEA
	EVENT_PAUSE 1*FRAME
	EVENT_SHORTJUMP .LOWORD(UNKNOWN_C34086)
