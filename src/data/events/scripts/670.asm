
EVENT_670: ;$C37BFE
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C0A37A)
	EVENT_SET_ANIMATION $00
	EVENT_START_TASK .LOWORD(UNKNOWN_C3A0D8)
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48B3B
	EVENT_UNKNOWN_C0A685 $60, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $04D0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2730
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_END_LAST_TASK
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_PAUSE 1*HALF_OF_A_SECOND
	EVENT_UNKNOWN_C0A685 $40, $00
	EVENT_START_TASK .LOWORD(UNKNOWN_C3A0B2)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $04B0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2730
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB67)
	EVENT_YIELD_TO_TEXT
	EVENT_START_TASK .LOWORD(UNKNOWN_C3A09F)
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0005
	EVENT_START_TASK .LOWORD(@UNKNOWN1)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $05D0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2730
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VELOCITIES_ZERO
	EVENT_PAUSE $F0*FRAMES
	EVENT_START_TASK .LOWORD(@UNKNOWN2)
	EVENT_UNKNOWN_C0A685 $00, $03
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0004
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0003
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0538
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0006
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $04F0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $000C
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $04B0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_YIELD_TO_TEXT
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $04F0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $26C8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VELOCITIES_ZERO
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::DOWN
	EVENT_SET_DIRECTION
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_CLEAR_TICK_CALLBACK
	EVENT_YIELD_TO_TEXT
	EVENT_WRITE_WORD_WRAM .LOWORD(TELEPORT_DESTINATION), $000E
	EVENT_UNKNOWN_C48B2C
	EVENT_HALT
@UNKNOWN1: ;$C37CD8
	EVENT_LOOP $0F
		EVENT_PAUSE 2*FIFTEENTHS_OF_A_SECOND
		EVENT_UNKNOWN_C0A691
		EVENT_ADD_TEMPVAR $0040
		EVENT_UNKNOWN_C0A685_ME2
	EVENT_LOOP_END
	EVENT_END_TASK
@UNKNOWN2: ;$C37CEA
	EVENT_WRITE_VAR_TO_WAIT_TIMER ACTIONSCRIPT_VARS::V0
	EVENT_SET_ANIMATION $01
	EVENT_UNKNOWN_C0A3A4_ME1
	EVENT_WRITE_VAR_TO_WAIT_TIMER ACTIONSCRIPT_VARS::V0
	EVENT_SET_ANIMATION $00
	EVENT_UNKNOWN_C0A3A4_ME3
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(@UNKNOWN2)
