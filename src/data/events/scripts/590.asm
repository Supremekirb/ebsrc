
EVENT_590: ;$C36B4B
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_TWSN_TONZURABUS_APPEAR
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY4)
	EVENT_SET_ANIMATION $FF
	EVENT_SHORTJUMP .LOWORD(EVENT_8_ENTRY_2)
@UNKNOWN1: ;$C36B60
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C36A41)
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $06A0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $19B8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_PAUSE 1*HALF_OF_A_SECOND
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $08FC
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $19B8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $06B8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1BF8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0898
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1BF8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0278
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2218
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $04E8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2218
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
