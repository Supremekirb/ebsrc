
EVENT_186: ;$C3D31D
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3DBDB_ENTRY2)
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1350
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $24D8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1390
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2498
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1500
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2498
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C0A685 $80, $01
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1580
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2498
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_UNKNOWN_C03F1E
	EVENT_PREPARE_NEW_ENTITY_AT_SELF
	EVENT_QUEUE_TEXT MSG_EVT_TBUS_TOUCH_THRK
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48B3B
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A023)
	EVENT_PAUSE 1*FRAME
	EVENT_LOOP $0A
		EVENT_SET_Y_RELATIVE $FFFF
		EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
		EVENT_SET_Y_RELATIVE $0001
		EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
	EVENT_LOOP_END
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_PAUSE $78*FRAMES
	EVENT_YIELD_TO_TEXT
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
