
UNKNOWN_C48A6D: ;$C48A6D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA CURRENT_ENTITY_SLOT
	STA $02
	ASL
	TAX
	LDA ENTITY_SCRIPT_VAR1_TABLE,X
	STA $12
	AND #$0001
	BEQ @UNKNOWN0
	LDA $12
	LSR
	ASL
	ASL
	ASL
	ASL
	STORE_INT1632 $06
	CLC
	VAR_ADD_CONST_INT_ASSIGN $7F4000, $06
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $12
	LSR
	ASL
	ASL
	ASL
	ASL
	STORE_INT1632 $06
	CLC
	VAR_ADD_CONST_INT_ASSIGN $7F1000, $06
@UNKNOWN1:
	LOADPTR UNKNOWN_7F0000+2, $0A
	LDY #$0000
	BRA @UNKNOWN5
@UNKNOWN2:
	LDX #$0000
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA [$06]
	STA [$0A]
	INC $0A
	INC $0A
	LDA #$0010
	CLC
	ADC $06
	STA $06
	INX
@UNKNOWN4:
	CPX #$001E
	BCC @UNKNOWN3
	LDA #$01DE
	EOR #$FFFF
	INC
	CLC
	ADC $06
	STA $06
	INY
@UNKNOWN5:
	CPY #$0008
	BCC @UNKNOWN2
	LOADPTR UNKNOWN_7F0000, $0E
	LDX #$024C
	LDA #$0328
	JSL UNKNOWN_C3F705
	LDA $02
	ASL
	TAY
	CLC
	ADC #.LOWORD(ENTITY_SCRIPT_VAR1_TABLE)
	TAX
	LDA __BSS_START__,X
	INC
	STA __BSS_START__,X
	LDX #$0000
	CMP ENTITY_SCRIPT_VAR0_TABLE,Y
	BLTEQ @UNKNOWN6
	LDX #$0001
@UNKNOWN6:
	TXA
	PLD
	RTL
