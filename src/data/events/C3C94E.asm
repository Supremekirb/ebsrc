
UNKNOWN_C3C94E: ;$C3C94E
	EVENT_UNKNOWN_C0A864 $FF
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB26)
	EVENT_SET_Z $FFA0
	EVENT_SET_ANIMATION $00
	EVENT_SET_TICK_CALLBACK UNKNOWN_C48C02
	EVENT_UNKNOWN_C0A443_ME2
	EVENT_UNKNOWN_C0A685 $00, $01
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_SET_Z_VELOCITY $0100
	EVENT_PAUSE $60*FRAMES
	EVENT_SET_Z_VELOCITY $0000
	EVENT_PAUSE $C8*FRAMES
	EVENT_PAUSE $C8*FRAMES
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::RIGHT
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA1E)
	EVENT_SET_Z_VELOCITY $FF00
	EVENT_PAUSE $60*FRAMES
	EVENT_FADE_OUT $01, $01
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3ABE0)
	EVENT_SHORT_RETURN
