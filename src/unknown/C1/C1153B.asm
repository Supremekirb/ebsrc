
UNKNOWN_C1153B: ;$C1153B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STX $02
	STA $04
	MOVE_INT $2C, $06
	MOVE_INT $06, $16
	MOVE_INT $28, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $16, $06
	MOVE_INT $06, $12
	TYX
	LDA $02
	JSR UNKNOWN_C114B1
	TAX
	LDA $04
	STA a:menu_option::userdata,X
	LDA #$0002
	STA a:menu_option::unknown0,X
	TXA
	PLD
	RTS
