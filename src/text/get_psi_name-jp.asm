
GET_PSI_NAME: ;$C1C403
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	STA $12
	CMP #$0001
	BNE @NOT_ROCKIN
	PROMOTENEARPTR .LOWORD(GAME_STATE) + game_state::favourite_thing, $06
	BRA @UNKNOWN1
@NOT_ROCKIN:
	.A16
	LOADPTR PSI_NAME_TABLE, $06
	LDA $12
	DEC
	OPTIMIZED_MULT $04, 10
	CLC
	ADC $06
	STA $06
@UNKNOWN1:
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$FFFF
	JSR DISPLAY_CONFIG_MENU_TITLE
	PLD
	RTS
