
UNKNOWN_C3EE4D: ;$C3EE4D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSL UPDATE_PARTY
	JSL UNKNOWN_C07B52
	JSL UNKNOWN_C1004E
	JSL UNKNOWN_C0943C
	LDA UNKNOWN_7EB4A8
	CMP #$FFFF
	BEQ @UNKNOWN0
	LDA UNKNOWN_7EB4A8
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA __BSS_START__,X
	AND #$FFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED)
	STA __BSS_START__,X
@UNKNOWN0:
	RTL
