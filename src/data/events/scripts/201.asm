
EVENT_201: ;$C3D5D8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3DBDB_ENTRY2)
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_SURFACE_FLAGS SURFACE_FLAGS::OBSCURE_LOWER_BODY
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1708
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $24C8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1740
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2488
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1560
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2488
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1528
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $24C8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_DIRECTION8 DIRECTION::LEFT
	EVENT_PAUSE $01
	EVENT_UNKNOWN_C03F1E
	EVENT_PREPARE_NEW_ENTITY_AT_SELF
	EVENT_QUEUE_TEXT MSG_EVT_TBUS_TOUCH_THRK_L
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48B3B
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A023)
	EVENT_PAUSE $01
	EVENT_LOOP $0A
		EVENT_SET_Y_RELATIVE $FFFF
		EVENT_PAUSE $03
		EVENT_SET_Y_RELATIVE $0001
		EVENT_PAUSE $03
	EVENT_LOOP_END
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1558
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2498
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB67)
	EVENT_PAUSE $1E
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_PAUSE $8C
	EVENT_YIELD_TO_TEXT
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
