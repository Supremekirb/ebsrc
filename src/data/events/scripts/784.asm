
EVENT_784: ;$C39FBA
	EVENT_UNKNOWN_WRITE_121E .LOWORD(UNKNOWN_C09FAE_ENTRY2)
	EVENT_UNKNOWN_C0A679 $00
	EVENT_SET_VELOCITIES_ZERO
	EVENT_SHORTJUMP_UNKNOWN .LOWORD(EVENT_8_ENTRY_2)
	EVENT_UNKNOWN_C0AA6E DIRECTION::DOWN, $00
	EVENT_CALL_C09F82 $003C, $0078, $00B4
	EVENT_WRITE_TEMPVAR_WAITTIMER
	EVENT_SET_X_VELOCITY $0020
@UNKNOWN1: ;$C39FDB
	EVENT_PAUSE $80*FRAMES
	EVENT_SET_VELOCITIES_ZERO
	EVENT_PAUSE $14*FRAMES
	EVENT_SET_X_VELOCITY $FFE0
	EVENT_PAUSE $80*FRAMES
	EVENT_PAUSE $80*FRAMES
	EVENT_SET_VELOCITIES_ZERO
	EVENT_PAUSE $14*FRAMES
	EVENT_SET_X_VELOCITY $0020
	EVENT_PAUSE $80*FRAMES
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN1)
