
EVENT_294: ;$C30F9C
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_SET_POSITION_CHANGE_CALLBACK .LOWORD(UNKNOWN_C0A039)
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48BE1
	EVENT_UNKNOWN_C0A685 $A0, $00
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V5, $0001
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0060
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2138
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0080
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2208
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0070
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2280
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_YIELD_TO_TEXT
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $00B8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2340
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0078
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2478
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $00A0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2550
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_TLPT_SKRB
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(@UNKNOWN1)
	EVENT_START_TASK .LOWORD(@UNKNOWN2)
@UNKNOWN1: ;$C31009
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $00A8
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $25B0
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $00D0
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2600
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_YIELD_TO_TEXT
	EVENT_PAUSE 1*FRAME
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0098
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2668
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0080
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $2710
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V6, $0098
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V7, $27B8
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB59)
	EVENT_WRITE_WORD_WRAM .LOWORD(UNKNOWN_7E438A), $00BD
	EVENT_WRITE_WORD_WRAM .LOWORD(UNKNOWN_7E438C), $01E3
	EVENT_YIELD_TO_TEXT
	EVENT_HALT
@UNKNOWN2: ;$C31055
	EVENT_SET_VAR ACTIONSCRIPT_VARS::V0, $0000
	EVENT_LOOP $0C
		EVENT_ADD ACTIONSCRIPT_VARS::V0, $FFFF
		EVENT_UNKNOWN_C47499
		EVENT_PAUSE 2*FIFTEENTHS_OF_A_SECOND
	EVENT_LOOP_END
	EVENT_END_TASK
