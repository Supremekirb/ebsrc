
UNKNOWN_C33C1D: ;$C33C1D
.IF .DEFINED(JPN) || .DEFINED(PROTOTYPE19950327)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $0000
.ENDIF
	EVENT_WRITE_VAR_TO_TEMPVAR ACTIONSCRIPT_VARS::V2
	EVENT_LOOP_TEMPVAR
		EVENT_UNKNOWN_C47B77
		EVENT_BREAK_IF_FALSE .LOWORD(UNKNOWN_C33C2F)
		EVENT_WRITE_VAR_TO_WAIT_TIMER ACTIONSCRIPT_VARS::V3
		EVENT_ADD ACTIONSCRIPT_VARS::V1, $0001
	EVENT_LOOP_END
UNKNOWN_C33C2F: ;$C33C2F
	EVENT_SHORT_RETURN
