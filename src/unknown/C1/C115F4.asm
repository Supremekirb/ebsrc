
UNKNOWN_C115F4: ;$C115F4
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	TAY
	STY $16
	MOVE_INT $2A, $0A
	MOVE_INT $26, $06
	MOVE_INT $06, $0E
	MOVE_INT $0A, $06
	MOVE_INT $06, $12
	JSR UNKNOWN_C113D1
	TAX
	LDY $16
	TYA
	STA a:menu_option::userdata,X
	LDA #$0002
	STA a:menu_option::unknown0,X
	TXA
	PLD
	RTS
