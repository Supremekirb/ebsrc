
ESCARGO_EXPRESS_MOVE: ;$C19183
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	STX $02
	TAY
	STY $0E
	LDX $02
	TYA
	JSL GET_CHARACTER_ITEM
	JSR ESCARGO_EXPRESS_STORE
	CMP #$0000
	BEQ @RETURN_ZERO
	LDX $02
	LDY $0E
	TYA
	JSR REMOVE_ITEM_FROM_INVENTORY
	BRA @RETURN
@RETURN_ZERO:
	LDA #$0000
@RETURN:
	PLD
	RTS
