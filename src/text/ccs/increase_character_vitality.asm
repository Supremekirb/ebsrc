
CC_1E_0D: ;$C17646
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TXA
	STA $0E
	LDA #$0001
	CLC
	SBC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	BRANCHLTEQS @UNKNOWN2
	LDA $0E
	SEP #PROC_FLAGS::ACCUM8
	LDX CC_ARGUMENT_GATHERING_LOOP_COUNTER
	STA CC_ARGUMENT_STORAGE,X
	REP #PROC_FLAGS::ACCUM8
	INC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	LDA #.LOWORD(CC_1E_0D)
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA CC_ARGUMENT_STORAGE
	AND #$00FF
	TAX
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::boosted_vitality
	TAY
	LDA $0E
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	LDA __BSS_START__,Y
	CLC
	ADC $00
	STA __BSS_START__,Y
	REP #PROC_FLAGS::ACCUM8
	TXA
	JSL RECALC_CHARACTER_POSTMATH_VITALITY
	REP #PROC_FLAGS::ACCUM8
	LDA #NULL
@UNKNOWN3:
	PLD
	RTS
