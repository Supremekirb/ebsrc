
EVENT_796: ;$C4238B
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C4220E)
	EVENT_SET_ANIMATION $06
.IF .DEFINED(PROTOTYPE19950327)
	EVENT_SET_Y $006C
.ELSE
	EVENT_SET_Y $0064
.ENDIF
	EVENT_WRITE_WRAM_TEMPVAR .LOWORD(UNKNOWN_7E9F75)
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(@UNKNOWN1)
	EVENT_SET_X $021B
	EVENT_SET_X_VELOCITY $FD9C
	EVENT_PAUSE $96
	EVENT_SET_VELOCITIES_ZERO
@UNKNOWN1:
	EVENT_SET_X $00B4
	EVENT_HALT
