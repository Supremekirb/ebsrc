
EVENT_301: ;$C311DF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_UNKNOWN_C0A685 $C0, $00
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::DOWN
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_PAUSE $14*FRAMES
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $000F
	EVENT_GET_POSITION_OF_PARTY_MEMBER $FF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
UNKNOWN_C311FC: ;$C311FC
	EVENT_PAUSE 1*FRAME
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_TEMP_1
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(UNKNOWN_C311FC)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1648
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $1608
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_PLAY_SOUND SFX::DOOR_OPEN
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
