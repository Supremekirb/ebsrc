
EVENT_715: ;$C389BD
	EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_SET_PRIORITY $03
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY4)
	EVENT_SET_ANIMATION $00
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C0A3A4_ME2
	EVENT_PAUSE $20*FRAMES
	EVENT_LOOP $08
		EVENT_SET_ANIMATION $FF
		EVENT_PAUSE 1*FRAME
		EVENT_SET_ANIMATION $00
		EVENT_PAUSE 1*FRAME
	EVENT_LOOP_END
	EVENT_SHORTJUMP .LOWORD(EVENT_35)
