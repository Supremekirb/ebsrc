
EVENT_596: ;$C36CDB
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AB26)
	EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_SET_Z $0000
	EVENT_WRITE_WORD_TEMPVAR DIRECTION::DOWN
	EVENT_SET_DIRECTION
	EVENT_LOOP $0A
		EVENT_SET_Z_RELATIVE $0001
		EVENT_PAUSE 1*THIRTIETH_OF_A_SECOND
		EVENT_SET_Z_RELATIVE $FFFF
		EVENT_PAUSE 1*THIRTIETH_OF_A_SECOND
		EVENT_SET_Z_RELATIVE $0002
		EVENT_PAUSE 1*FIFTEENTH_OF_A_SECOND
		EVENT_SET_Z_RELATIVE $FFFE
		EVENT_PAUSE 1*FIFTEENTH_OF_A_SECOND
	EVENT_LOOP_END
	EVENT_UNKNOWN_C46E46
	EVENT_PAUSE 1*TWENTIETH_OF_A_SECOND
	EVENT_SET_Z_VELOCITY $0600
	EVENT_PAUSE $10*FRAMES
	EVENT_UNKNOWN_C46E46
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C020F1
	EVENT_END
