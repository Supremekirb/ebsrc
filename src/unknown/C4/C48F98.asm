
UNKNOWN_C48F98: ;$C48F98
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TAX
	STX $0E
	TXA
	JSL IS_VALID_ITEM_TRANSFORMATION
	CMP #$0000
	BEQ @UNKNOWN0
	DEC .LOWORD(UNKNOWN_7E9F2A)
	LDX $0E
	TXA
	ASL
	ASL
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(LOADED_TIMED_ITEM_TRANSFORMATIONS) + loaded_timed_item_transformation::sfx_frequency,X
	STZ .LOWORD(LOADED_TIMED_ITEM_TRANSFORMATIONS) + loaded_timed_item_transformation::transformation_countdown,X
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
