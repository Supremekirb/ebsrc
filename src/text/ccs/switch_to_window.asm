
CC_18_03: ;$C143CC
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	TXA
	JSR SET_WINDOW_FOCUS
	LDA #NULL
	RTS
