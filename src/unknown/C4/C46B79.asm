
UNKNOWN_C46B79: ;$C46B79
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA .LOWORD(UNKNOWN_7E1A42)
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7E9E2D)
	STA .LOWORD(UNKNOWN_30X2_TABLE_9),X
	LDA .LOWORD(UNKNOWN_7E9E2F)
	STA .LOWORD(UNKNOWN_30X2_TABLE_10),X
	RTL
