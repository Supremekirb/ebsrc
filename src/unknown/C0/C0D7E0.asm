
UNKNOWN_C0D7E0: ;$C0D7E0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA CURRENT_ENTITY_SLOT
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_30X2_TABLE_41)
	TAX
	LDA __BSS_START__,X
	BEQ @UNKNOWN0
	LDA #$0001
	STA __BSS_START__,X
@UNKNOWN0:
	RTL
