
UNKNOWN_C4D830: ;$C4D830
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STA $14
	BRA @UNKNOWN1
@UNKNOWN0:
	JSL UNKNOWN_C1004E
@UNKNOWN1:
	LDA UNKNOWN_7EB4B4
	BNE @UNKNOWN0
	LOADPTR UNKNOWN_C3FD2D + (7*4), $0A
	LDA $14
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	BRA @UNKNOWN4
@UNKNOWN2:
	MOVE_INTX $06, $0A
	INC $0A
	INC $0A
	JSL UNKNOWN_C46028
	TAX
	CPX #$FFFF
	BEQ @UNKNOWN3
	LOADPTR EVENT_SCRIPT_POINTERS, $06
	MOVE_INT $06, $10
	LDA [$0A]
	OPTIMIZED_MULT $04, 3
	STA $0E
	INC
	INC
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	TAY
	LDA $0E
	PHA
	MOVE_INT $10, $06
	PLA
	CLC
	ADC $06
	STA $06
	LDA [$06]
	JSL INIT_ENTITY_UNKNOWN1
@UNKNOWN3:
	MOVE_INT $0A, $06
	INC $06
	INC $06
@UNKNOWN4:
	LDA [$06]
	BNE @UNKNOWN2
@UNKNOWN5:
	LDY #.LOWORD(ENTITY_SCRIPT_TABLE)
	LDA #$FFFF
	STA $0E
	LDX #$0000
	BRA @UNKNOWN7
@UNKNOWN6:
	LDA __BSS_START__,Y
	STA $02
	LDA $0E
	AND $02
	STA $0E
	INY
	INY
	INX
@UNKNOWN7:
	CPX #PARTY_LEADER_ENTITY_INDEX - 1
	BCC @UNKNOWN6
	JSL UNKNOWN_C1004E
	LDA $0E
	CMP #$FFFF
	BNE @UNKNOWN5
	PLD
	RTL
