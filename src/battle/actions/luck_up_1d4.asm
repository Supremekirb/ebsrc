
BTLACT_LUCK_UP_1D4: ;$C2A227
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	LDA #$0004
	JSR RAND_LIMIT
	INC
	STA $16
	LDA CURRENT_TARGET
	CLC
	ADC #$002E
	TAX
	LDA $16
	STA $02
	LDA __BSS_START__,X
	CLC
	ADC $02
	STA __BSS_START__,X
	LOADPTR MSG_BTL_LUCK_UP, $0E
	MOVE_INT1632S $16, $06
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	PLD
	RTL
