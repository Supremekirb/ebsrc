
UNKNOWN_C01DED: ;$C01DED
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STA $0E
	LOADPTR SPRITE_GROUPING_PTR_TABLE, $0A
	LDA $0E
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0001
	LDA [$06],Y
	LSR
	LSR
	LSR
	LSR
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	STA UNKNOWN_7E467A
	MOVE_INT $06, $0A
	LDA [$0A]
	AND #$00FF
	STA UNKNOWN_7E467C
	SEP #PROC_FLAGS::ACCUM8
	LDY #$0002
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	PLD
	RTS
