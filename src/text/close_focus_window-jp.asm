
CLOSE_FOCUS_WINDOW: ;$C10084
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA CURRENT_FOCUS_WINDOW
	JSR CLOSE_WINDOW
	RTS
