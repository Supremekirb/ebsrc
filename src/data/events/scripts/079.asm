
EVENT_79: ;$C3B8A5
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AAB8)
	EVENT_UNKNOWN_C0A443_ME2
	EVENT_UNKNOWN_C46C45
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0038
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $0038
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB8A)
	EVENT_UNKNOWN_C0A857 EVENT_FLAG::FLG_THRK_BIKINIZOMBI_P_APPEAR
	EVENT_WRITE_WORD_TEMPVAR $0001
	EVENT_UNKNOWN_C0A857 EVENT_FLAG::FLG_THRK_HOTELZOMBI_APPEAR
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1E70
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2438
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_PLAY_SOUND SFX::DOOR_CLOSE
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
