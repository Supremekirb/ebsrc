
EVENT_617: ;$C36F85
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A039)
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY2)
	EVENT_SET_ANIMATION $FF
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48BE1
	EVENT_UNKNOWN_C0A685 $60, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0012
	EVENT_UNKNOWN_C0A92D $0409
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB44)
@UNKNOWN1: ;$C36FA9
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C0A92D $0409
	EVENT_UNKNOWN_C0A8C6
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN1)
