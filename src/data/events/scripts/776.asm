
EVENT_776: ;$C39E8B
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY4)
	EVENT_SET_VELOCITIES_ZERO
	EVENT_SET_ANIMATION $FF
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0006
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $0000
.IF .DEFINED(PROTOTYPE19950327) || .DEFINED(JPN)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0008
.ELSE
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0078
.ENDIF
	EVENT_UNKNOWN_C47A9E
	EVENT_PLAY_SOUND SFX::MISSED
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C33C1D)
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
