
MOVEMENT_CODE_1C: ;$C09B4D
	LDX $88
	LDA [$80],Y
	STA .LOWORD(UNKNOWN_30X2_TABLE_15),X
	INY
	INY
	SEP #PROC_FLAGS::ACCUM8
	LDA [$80],Y
	STA .LOWORD(UNKNOWN_30X2_TABLE_16),X
	REP #PROC_FLAGS::ACCUM8
	INY
	RTS
