
EVENT_535: ;$C34E85
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C34E73)
	EVENT_UNKNOWN_C0A685 $40, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1D60
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $0B40
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_DECOMP_ITOI_PRODUCTION
	EVENT_WRITE_BYTE_WRAM $001A, $17
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1D30
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $0B70
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1C70
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $0B70
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_DISPLAY_TEXT_IMMEDIATELY MSG_MD_TOTO_SENCHOU
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
