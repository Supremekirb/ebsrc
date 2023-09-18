
GAIN_EXP: ;$C1D9E9
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	STX $02
	TAX
	MOVE_INT $20, $06
	TXY
	DEY
	STY $10
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	STA $0E
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::exp
	TAX
	MOVE_INT $06, $0A
	TXY
	MOVE_INT_YPTRSRC __BSS_START__, $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	TXY
	MOVE_INT_YPTRDEST $06, __BSS_START__
	LDA $0E
	TAX
	LDA CHAR_STRUCT+char_struct::level,X
	AND #$00FF
	STA $0E
	STA $04
	LDA #MAX_LEVEL
	CLC
	SBC $04
	JUMPLTEQS @UNKNOWN6
	MOVE_INT $06, $0A
	LOADPTR EXP_TABLE, $06
	LDA $0E
	OPTIMIZED_MULT $04, 4
	STA $04
	INC $04
	INC $04
	INC $04
	INC $04
	LDY $10
	TYA
	LDY #$0190
	JSL MULT16
	CLC
	ADC $04
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $06
	CLC
	LDA $06
	SBC $0A
	LDA $08
	SBC $0C
	BCC @UNKNOWN2
	JMP @UNKNOWN6
@UNKNOWN2:
	LDA $02
	BEQ @UNKNOWN3
	LDA #MUSIC::LEVEL_UP
	JSL CHANGE_MUSIC
@UNKNOWN3:
	LDX $02
	LDY $10
	TYA
	INC
	JSR LEVEL_UP_CHAR
	LDY $10
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA CHAR_STRUCT+char_struct::level,X
	AND #$00FF
	STA $0E
	STA $04
	LDA #MAX_LEVEL
	CLC
	SBC $04
	BRANCHLTEQS @UNKNOWN6
	LOADPTR EXP_TABLE, $06
	LDA $0E
	OPTIMIZED_MULT $04, 4
	STA $04
	INC $04
	INC $04
	INC $04
	INC $04
	LDY $10
	TYA
	LDY #$0190
	JSL MULT16
	CLC
	ADC $04
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $0A
	TXA
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::exp
	TAY
	MOVE_INT_YPTRSRC __BSS_START__, $06
	LDA $06
	CMP $0A
	LDA $08
	SBC $0C
	BCC @UNKNOWN6
	JMP @UNKNOWN3
@UNKNOWN6:
	PLD
	RTL
