
UNKNOWN_C3BAA3: ;$C3BAA3
	EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3BB5C)
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3BB73)
	EVENT_QUEUE_TEXT MSG_EVT_GHOST_1
@UNKNOWN1: ;$C3BAB5
	EVENT_PAUSE 1*FRAME
	EVENT_GET_POSITION_OF_PARTY_MEMBER $FF
	EVENT_SET_VELOCITIES_ZERO
	EVENT_UNKNOWN_C0A8C6
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN1)
