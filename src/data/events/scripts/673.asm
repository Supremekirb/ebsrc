
EVENT_673: ;$C37D92
	EVENT_SHORTCALL .LOWORD(EVENT_674_ENTRY_3)
@UNKNOWN0:
	EVENT_WRITE_WORD_TEMPVAR $0000
	EVENT_UNKNOWN_C0A857 EVENT_FLAG::FLG_ANIM_PORT_5
	EVENT_CHOOSE_RANDOM 400, 600, 1200, 1800
	EVENT_WRITE_TEMPVAR_WAITTIMER
	EVENT_WRITE_WRAM_TEMPVAR .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(EVENT_674_ENTRY_2)
	EVENT_WRITE_WRAM_TEMPVAR .LOWORD(BATTLE_SWIRL_FLAG)
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(EVENT_674_ENTRY_2)
	EVENT_UNKNOWN_C46C45
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $00F8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $00F8
	EVENT_TEST_PLAYER_IN_AREA
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN0)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0004
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0004
	EVENT_TEST_PLAYER_IN_AREA
	EVENT_SHORTCALL_CONDITIONAL .LOWORD(@UNKNOWN1)
	EVENT_WRITE_WORD_TEMPVAR $0001
	EVENT_UNKNOWN_C0A857 EVENT_FLAG::FLG_ANIM_PORT_5
@UNKNOWN1:
	EVENT_QUEUE_TEXT MSG_EVT_FOUNTAIN_B
	EVENT_SHORTCALL .LOWORD(EVENT_674_ENTRY_4)
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN0)
