
EVENT_868: ;$C395C1
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39AC7)
@UNKNOWN1: ;$C395C4
	EVENT_PAUSE 1*FRAME
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_PHOTO_TACY
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $025C
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $0D34
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $000C
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0014
	EVENT_TEST_PLAYER_IN_AREA
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39E01)
	EVENT_QUEUE_TEXT MSG_GLOBAL_PHOTO_7
	EVENT_HALT
