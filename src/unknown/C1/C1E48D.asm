
UNKNOWN_C1E48D: ;$C1E48D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STY $10
	STX $0E
	STA $02
	JSL SET_INSTANT_PRINTING
	LDA $02
	JSR SET_WINDOW_FOCUS
	LDY $10
	LDX $0E
	LDA $02
	JSL UNKNOWN_C442AC
	TAX
	STX $0E
	LDA #$001C
	JSR SET_WINDOW_FOCUS
	LDX $0E
	TXA
	PLD
	RTS
