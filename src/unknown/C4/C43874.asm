
UNKNOWN_C43874: ;$C43874
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STY $02
	TXY
	STY $10
	STA $0E
	JSL UNKNOWN_C43CAA
	LDA $0E
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDY $10
	TYA
	STA .LOWORD(WINDOW_STATS_TABLE)+14,X
	LDA $02
	STA .LOWORD(WINDOW_STATS_TABLE)+16,X
	PLD
	RTL
