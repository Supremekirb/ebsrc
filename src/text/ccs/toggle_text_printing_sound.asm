
CC_1F_04: ;$C17254
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_RETURN_INT16
	END_STACK_VARS
	TXA
	BEQ @UNKNOWN0
	STORE_INT1632 @VIRTUAL06
	BRA @UNKNOWN1
@UNKNOWN0:
	JSR GET_ARGUMENT_MEMORY
@UNKNOWN1:
	LDA @VIRTUAL06
	JSR SET_TEXT_SOUND_MODE
	LDA #NULL
	PLD
	RTS
