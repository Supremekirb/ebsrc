
UNKNOWN_C3B70C: ;$C3B70C
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A039)
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY2)
	EVENT_SET_ANIMATION $FF
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48BE1
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_ADD ACTIONSCRIPT_VARS::V7, $FFFF
	EVENT_UNKNOWN_C0A685 $C0, $00
	EVENT_UNKNOWN_C46ADB
	EVENT_UNKNOWN_C47044
	EVENT_UNKNOWN_C46B0A
	EVENT_SET_DIRECTION
@UNKNOWN1: ;$C3B737
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C0A8DC
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
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
	EVENT_SHORT_RETURN
