
EVENT_258: ;$C30796
	EVENT_TEST_EVENT_FLAG EVENT_FLAG::UNKNOWN_0144
	EVENT_SHORTCALL_CONDITIONAL_NOT .LOWORD(EVENT_8)
	EVENT_DISABLE_CURRENT_ENTITY_COLLISION2
	EVENT_SET_PHYSICS_CALLBACK .LOWORD(UNKNOWN_C09FAE_ENTRY4)
	EVENT_SET_ANIMATION $FF
	EVENT_SHORTJUMP .LOWORD(EVENT_8_ENTRY_2)
