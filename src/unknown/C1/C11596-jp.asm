
UNKNOWN_C11596: ;$C11596
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	STA $16
	SEP #PROC_FLAGS::ACCUM8
	LDA $2E
	STA $00
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $2A, $06
	MOVE_INT $26, $0A
	MOVE_INT $0A, $0E
	MOVE_INT $06, $12
	LDA $16
	JSR UNKNOWN_C1153B
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	STA a:menu_option::sound_effect,X
	REP #PROC_FLAGS::ACCUM8
	TXA
	PLD
	RTS
