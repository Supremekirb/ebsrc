
UNKNOWN_C4CC2F: ;$C4CC2F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 32
	STZ $1E
	LDA #$0000
	STA $04
	MOVE_INT .LOWORD(UNKNOWN_7EB4AA), $06
	MOVE_INT $06, $1A
	LDA #$0000
	STA $02
	STA $18
	JMP @UNKNOWN4
@UNKNOWN0:
	LDY #$0004
	LDA [$1A],Y
	CMP #$0002
	BEQ @UNKNOWN1
	JMP @UNKNOWN3
@UNKNOWN1:
	INC $04
	MOVE_INT $1A, $06
	LDA #$0012
	CLC
	ADC $06
	STA $06
	STA $14
	LDA $08
	STA $16
	LDA [$14]
	CMP #$0002
	BNE @UNKNOWN2
	INC $1E
	JMP @UNKNOWN3
@UNKNOWN2:
	MOVE_INT $1A, $0A
	LDA #$0010
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	STA $12
	LDY #$0006
	LDA [$1A],Y
	LSR
	LSR
	LSR
	TAX
	LDY #$0008
	LDA $12
	JSL MODULUS16
	ASL
	STA $02
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA $12
	LSR
	LSR
	LSR
	JSL MULT16
	CLC
	ADC $02
	STA $12
	MOVE_INT $1A, $06
	LDA #$000C
	CLC
	ADC $06
	STA $06
	STX $0E
	LDA $12
	TAY
	STY $10
	LDY #$000A
	LDA [$1A],Y
	TAX
	LDA [$06]
	LDY $10
	JSL UNKNOWN_C428D1
	LDY #$0000
	LDA [$1A],Y
	TAX
	LDA [$06]
	JSL UNKNOWN_C429AE
	LDA [$0A]
	INC
	INC
	STA [$0A]
	LDY #$0008
	CMP [$1A],Y
	BCC @UNKNOWN3
	LDA #$0001
	STA [$0A]
	LDA [$14]
	INC
	STA [$14]
@UNKNOWN3:
	MOVE_INT $1A, $06
	LDA #$0014
	CLC
	ADC $06
	STA $06
	STA $1A
	LDA $08
	STA $1C
	LDA $18
	STA $02
	INC $02
	LDA $02
	STA $18
@UNKNOWN4:
	LDA $02
	CMP .LOWORD(UNKNOWN_7EB4A6)
	BCS @UNKNOWN5
	BEQ @UNKNOWN5
	JMP @UNKNOWN0
@UNKNOWN5:
	LDA $04
	SEC
	SBC $1E
	PLD
	RTL
