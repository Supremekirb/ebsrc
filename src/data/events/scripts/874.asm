
EVENT_874: ;$C396E7
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39AC7)
@UNKNOWN1: ;$C396EA
	EVENT_PAUSE 1*FRAME
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_PHOTO_BONE
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0750
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V1, $24A8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0020
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0018
	EVENT_TEST_PLAYER_IN_AREA
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C39E01)
	EVENT_QUEUE_TEXT TEXT_EVENT_WANDERING_PHOTOGRAPHER_12
	EVENT_HALT
