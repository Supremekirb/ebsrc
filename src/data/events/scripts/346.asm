
EVENT_346: ;$C31B4B
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A039)
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C0A37A)
	EVENT_SET_ANIMATION $00
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48BE1
	EVENT_UNKNOWN_C0A685 $80, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $01F0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $23B0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VELOCITIES_ZERO
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0008
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::DOWN
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0AAAC
	EVENT_PAUSE 1*THIRTIETH_OF_A_SECOND
	EVENT_YIELD_TO_TEXT
	EVENT_PAUSE 1*THIRTIETH_OF_A_SECOND
	EVENT_INITIALIZE_YOUR_SANCTUARY_DISPLAY
	EVENT_WRITE_WORD_TEMPVAR $0007
	EVENT_DISPLAY_YOUR_SANCTUARY_LOCATION
	EVENT_CLEAR_TICK_CALLBACK
	EVENT_PAUSE 1*FRAME
	EVENT_ENABLE_YOUR_SANCTUARY_DISPLAY
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $0006
	EVENT_LOOP $07
		EVENT_WRITE_VAR_TO_TEMPVAR ACTIONSCRIPT_VARS::V1
		EVENT_DISPLAY_YOUR_SANCTUARY_LOCATION
		EVENT_ADD ACTIONSCRIPT_VARS::V1, $FFFF
		EVENT_PAUSE 1*FRAME
	EVENT_LOOP_END
	EVENT_START_TASK .LOWORD(@UNKNOWN2)
	EVENT_LOOP $07
		EVENT_PAUSE $46*FRAMES
		EVENT_ADD ACTIONSCRIPT_VARS::V0, $FFFF
	EVENT_LOOP_END
	EVENT_PAUSE 1*SECOND
	EVENT_LOOP $07
		EVENT_PAUSE $22*FRAMES
		EVENT_ADD ACTIONSCRIPT_VARS::V0, $0001
	EVENT_LOOP_END
@UNKNOWN1: ;$C31BCA
	EVENT_PAUSE 1*FRAME
	EVENT_UNKNOWN_C0A673
	EVENT_ADD_TEMPVAR $FFFC
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(@UNKNOWN1)
	EVENT_END_LAST_TASK
	EVENT_HALT
@UNKNOWN2: ;$C31BD9
	EVENT_WRITE_VAR_TO_WAIT_TIMER ACTIONSCRIPT_VARS::V0
	EVENT_WRITE_WORD_TEMPVAR $0001
	EVENT_GET_DIRECTION_ROTATED_CLOCKWISE
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0AAAC
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN2)
