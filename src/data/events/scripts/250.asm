
EVENT_250: ;$C305EF
	EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AAAA)
	EVENT_SET_ANIMATION $FF
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0000
	EVENT_UNKNOWN_C46C45
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V2, $0040
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V3, $00A0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB8A)
	EVENT_PLAY_SOUND SFX::UNKNOWN61
	EVENT_PAUSE 1*TWELFTH_OF_A_SECOND
	EVENT_SET_ANIMATION $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V4, $0005
	EVENT_SET_X $1B10
	EVENT_SET_Y $02E8
	EVENT_UNKNOWN_C0A685 $00, $02
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0002
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1B20
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $02E8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_QUEUE_TEXT MSG_EVT_LIBRARY_TOILET
	EVENT_START_TASK .LOWORD(UNKNOWN_C3AFA3)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1BC0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $1BF0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $02B8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_END_LAST_TASK
	EVENT_END_LAST_TASK
	EVENT_PLAY_SOUND SFX::DOOR_OPEN
	EVENT_PAUSE 1*SIXTH_OF_A_SECOND
	EVENT_PLAY_SOUND SFX::DOOR_CLOSE
	EVENT_WRITE_WORD_TEMPVAR $0001
	EVENT_UNKNOWN_C0A857 EVENT_FLAG::FLG_LIBRARY_TOILET
	EVENT_YIELD_TO_TEXT
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
