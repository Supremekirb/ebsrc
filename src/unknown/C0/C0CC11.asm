
UNKNOWN_C0CC11: ;$C0CC11
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA CURRENT_ENTITY_SLOT
	STA $04
	ASL
	TAX
	LDA ENTITY_SCRIPT_VAR6_TABLE,X
	SEC
	SBC ENTITY_ABS_X_TABLE,X
	STA $12
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN2
	LDA $12
	EOR #$FFFF
	INC
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA $12
@UNKNOWN3:
	TAY
	LDA $04
	ASL
	TAX
	LDA ENTITY_SCRIPT_VAR7_TABLE,X
	SEC
	SBC ENTITY_ABS_Y_TABLE,X
	STA $12
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN6
	LDA $12
	EOR #$FFFF
	INC
	BRA @UNKNOWN7
@UNKNOWN6:
	LDA $12
@UNKNOWN7:
	STA $02
	TYA
	CMP $02
	BLTEQ @UNKNOWN8
	TYA
	STA $12
	LDA $04
	ASL
	TAX
	LDA ENTITY_DELTA_X_TABLE,X
	STA $10
	LDA ENTITY_DELTA_X_FRACTION_TABLE,X
	STA $0E
	BRA @UNKNOWN9
@UNKNOWN8:
	LDA $02
	STA $12
	LDA $04
	ASL
	TAX
	LDA ENTITY_DELTA_Y_TABLE,X
	STA $10
	LDA ENTITY_DELTA_Y_FRACTION_TABLE,X
	STA $0E
@UNKNOWN9:
	MOVE_INT $0E, $0A
	SEP #PROC_FLAGS::INDEX8
	LDY #$0010
	LDA $12
	JSL ASL16_ENTRY2
	STORE_INT1632 $06
	REP #PROC_FLAGS::INDEX8
	JSL DIVISION32
	LDA $06
	STA $12
	BNE @UNKNOWN10
	LDA #$0001
	STA $12
@UNKNOWN10:
	LDA CURRENT_SCRIPT_SLOT
	ASL
	TAX
	LDA $12
	STA ENTITY_SLEEP_FRAMES,X
	PLD
	RTL
