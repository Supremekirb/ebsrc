
SET_TEXT_SOUND_MODE: ;$C10048
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STA TEXT_SOUND_MODE
	RTS
