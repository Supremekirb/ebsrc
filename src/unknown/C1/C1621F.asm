
UNKNOWN_C1621F: ;$C1621F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	STA $12
	LDA #$0003
	CLC
	SBC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	BRANCHLTEQS @UNKNOWN2
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX CC_ARGUMENT_GATHERING_LOOP_COUNTER
	STA CC_ARGUMENT_STORAGE,X
	REP #PROC_FLAGS::ACCUM8
	INC CC_ARGUMENT_GATHERING_LOOP_COUNTER
	LDA #.LOWORD(UNKNOWN_C1621F)
	JMP @UNKNOWN3
@UNKNOWN2:
	TXA
	STORE_INT1632 $06
	SEP #PROC_FLAGS::INDEX8
	LDY #$0018
	JSL ASL32_ENTRY2
	PUSH32 $06
	LDY #$0010
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 CC_ARGUMENT_STORAGE+2, $06
	REP #PROC_FLAGS::ACCUM8
	JSL ASL32_ENTRY2
	PUSH32 $06
	LDY #$0008
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 CC_ARGUMENT_STORAGE+1, $06
	REP #PROC_FLAGS::ACCUM8
	JSL ASL32_ENTRY2
	MOVE_INT $06, $0A
	SEP #PROC_FLAGS::ACCUM8
	MOVE_INT832 CC_ARGUMENT_STORAGE, $06
	REP #PROC_FLAGS::ACCUM8
	OR_INT_ASSIGN $06, $0A
	PULL32 $0A
	OR_INT_ASSIGN $06, $0A
	PULL32 $0A
	OR_INT_ASSIGN $06, $0A
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	LDA $12
	TAY
	MOVE_INT_YPTRSRC __BSS_START__, $06
	LDA UNKNOWN_7E97D5
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA __BSS_START__,Y
	LDA $08
	STA __BSS_START__+2,Y
	LDA #NULL
@UNKNOWN3:
	PLD
	RTS
