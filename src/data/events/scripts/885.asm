
EVENT_885: ;$C39902
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39AC7)
@UNKNOWN1: ;$C39905
	EVENT_PAUSE 1*FRAME
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_PHOTO_SUMS_REST
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $1BD0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $2384
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0020
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $000C
	EVENT_TEST_PLAYER_IN_AREA
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39E01)
	EVENT_QUEUE_TEXT MSG_GLOBAL_PHOTO_24
	EVENT_HALT
