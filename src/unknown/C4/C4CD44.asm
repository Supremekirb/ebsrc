
UNKNOWN_C4CD44: ;$C4CD44
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 32
	STZ $1E
	LDA #$0000
	STA $04
	MOVE_INT .LOWORD(UNKNOWN_7EB4AA), $0A
	LDA #$0000
	STA $02
	STA $1C
	JMP @UNKNOWN8
@UNKNOWN0:
	LDY #$0004
	LDA [$0A],Y
	CMP #$0003
	BEQ @UNKNOWN1
	JMP @UNKNOWN7
@UNKNOWN1:
	INC $04
	LDY #$0012
	LDA [$0A],Y
	CMP #$0002
	BNE @UNKNOWN2
	INC $1E
	JMP @UNKNOWN7
@UNKNOWN2:
	CMP #$0000
	BEQ @UNKNOWN4
	LDY #$0010
	LDA [$0A],Y
	STA $1A
	AND #$0001
	BNE @UNKNOWN3
	LDA $1A
	TAX
	BRA @UNKNOWN6
@UNKNOWN3:
	LDA $1A
	STA $02
	LDY #$0006
	LDA [$0A],Y
	SEC
	SBC $02
	TAX
	DEX
	BRA @UNKNOWN6
@UNKNOWN4:
	LDY #$0010
	LDA [$0A],Y
	STA $1A
	AND #$0001
	BEQ @UNKNOWN5
	LDA $1A
	TAX
	BRA @UNKNOWN6
@UNKNOWN5:
	LDA $1A
	STA $02
	LDY #$0006
	LDA [$0A],Y
	SEC
	SBC $02
	TAX
	DEX
@UNKNOWN6:
	LDA #$000C
	MOVE_INTY $0A, $06
	CLC
	ADC $06
	STA $06
	STA $16
	LDA $08
	STA $18
	LDA #$0006
	MOVE_INTY $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDY #$0008
	LDA [$0A],Y
	STA $0E
	LDA [$12]
	LSR
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $10
	TXY
	STY $1A
	LDY #$000A
	LDA [$0A],Y
	TAX
	MOVE_INT $16, $06
	LDA [$06]
	LDY $1A
	JSL UNKNOWN_C428FC
	MOVE_INT $0A, $06
	LDA [$06]
	TAX
	MOVE_INT $16, $06
	LDA [$06]
	JSL UNKNOWN_C429AE
	LDA #$0010
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $16
	LDA $08
	STA $18
	LDA [$06]
	INC
	STA $1A
	STA [$06]
	LDA [$12]
	LSR
	STA $02
	LDA $1A
	CMP $02
	BCC @UNKNOWN7
	LDA #$0012
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	STA $12
	LDA $08
	STA $14
	LDA [$12]
	INC
	STA [$12]
	LDA #$0000
	MOVE_INTX $16, $06
	STA [$06]
@UNKNOWN7:
	LDA #$0014
	CLC
	ADC $0A
	STA $0A
	LDA $1C
	STA $02
	INC $02
	LDA $02
	STA $1C
@UNKNOWN8:
	LDA $02
	CMP .LOWORD(UNKNOWN_7EB4A6)
	BCS @UNKNOWN9
	BEQ @UNKNOWN9
	JMP @UNKNOWN0
@UNKNOWN9:
	LDA $04
	SEC
	SBC $1E
	PLD
	RTL
