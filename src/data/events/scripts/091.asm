
EVENT_91: ;$C3BAEA
	EVENT_UNKNOWN_C0A87A $0000, $0050
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::FLG_TUNNEL_TWSN_THRK_WR
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(@UNKNOWN1)
	EVENT_SET_X_RELATIVE $0100
	EVENT_PREPARE_NEW_ENTITY_AT_TELEPORT_DESTINATION $0F
	EVENT_SHORTJUMP .LOWORD(@UNKNOWN2)
@UNKNOWN1: ;$C3BB06
	EVENT_PREPARE_NEW_ENTITY_AT_TELEPORT_DESTINATION $12
@UNKNOWN2: ;$C3BB0B
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3AA38)
	EVENT_SHORTCALL .LOWORD(UNKNOWN_C3BB73)
	EVENT_YIELD_TO_TEXT
	EVENT_SET_VELOCITIES_ZERO
	EVENT_HALT
