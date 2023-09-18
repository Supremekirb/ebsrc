
FILL_CHARACTER_PP_TILE_BUFFER: ;$C20F26
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STY $04
	STA $02
	LDY $1E
	STY $0E
	LDA __BSS_START__+STATUS_GROUP::CONCENTRATION,X
	AND #$00FF
	BEQ @CAN_CONCENTRATE
	LDA $02
	JSR FILL_HP_PP_TILE_BUFFER_X
	BRA @RETURN
@CAN_CONCENTRATE:
	LDA $04
	JSR SEPARATE_DECIMAL_DIGITS
	LDY $0E
	LDX #$0001
	LDA $02
	JSR FILL_HP_PP_TILE_BUFFER
@RETURN:
	PLD
	RTS
