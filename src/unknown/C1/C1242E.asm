
UNKNOWN_C1242E: ;$C1242E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_PARAM_INT16
	STACK_RESERVE_RETURN_INT16
	END_STACK_VARS
	STY @VIRTUAL02
	TXY
	TAX
	BEQ @UNKNOWN0
	TYA
	JSR UNKNOWN_C12362
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX @VIRTUAL02
	TYA
	JSR UNKNOWN_C121B8
@UNKNOWN1:
	PLD
	RTS
