
UNKNOWN_C468AF: ;$C468AF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA a:.LOWORD(PAD_STATE)
	RTL
