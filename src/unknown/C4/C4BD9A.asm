
UNKNOWN_C4BD9A: ;$C4BD9A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 46
	STY $2C
	STX $2A
	TAX
	LDA a:.LOWORD(RAM),X
	STA $28
	LDA a:.LOWORD(RAM)+2,X
	STA $26
	LDY #$0000
	STY $24
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $28
	JSL MULT16
	CLC
	ADC $26
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	STA $00
	CMP #$00FB
	BLTEQ @UNKNOWN0
	REP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JMP @UNKNOWN14
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	LDA $2A
	BNE @UNKNOWN1
	LDA #$0000
	JMP @UNKNOWN14
@UNKNOWN1:
	LDX $2C
	LDA $28
	STA a:.LOWORD(RAM),X
	LDA $26
	STA a:.LOWORD(RAM)+2,X
	LDA #$0001
	STA $22
	JMP @UNKNOWN12
@UNKNOWN2:
	LDA #$029A
	STA $20
	STA $1E
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	DEC
	STA $00
	LDY $24
	STY $02
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	STA $1C
	STZ $24
	JMP @UNKNOWN7
@UNKNOWN3:
	LDA $02
	ASL
	ASL
	TAY
	LDA .LOWORD(UNKNOWN_7EB418),Y
	CLC
	ADC $28
	TAX
	LDA .LOWORD(UNKNOWN_7EB41A),Y
	CLC
	ADC $26
	STA $1A
	LDA $02
	INC
	AND #$0003
	STA $04
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $1A
	STA $02
	LDY .LOWORD(UNKNOWN_7EB402)
	TXA
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP $00
	BNEL @UNKNOWN6
	REP #PROC_FLAGS::ACCUM8
	LDA $20
	CMP #$029A
	BNE @UNKNOWN5
	LDA $1C
	STA $02
	STA $20
	STX $0E
	LDA $1A
	STA $10
@UNKNOWN5:
	LDA $1C
	STA $02
	ASL
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7EB428),X
	CLC
	ADC $28
	STA $18
	LDA .LOWORD(UNKNOWN_7EB42A),X
	CLC
	ADC $26
	TAY
	STY $16
	LDA $00
	AND #$00FF
	DEC
	PHA
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	STY $02
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $18
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	PLY
	STY $02
	CMP $02
	BNE @UNKNOWN6
	LDA $04
	ASL
	ASL
	TAX
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA .LOWORD(UNKNOWN_7EB41A),X
	CLC
	ADC $26
	STA $02
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA .LOWORD(UNKNOWN_7EB418),X
	CLC
	ADC $28
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP $00
	BNE @UNKNOWN6
	REP #PROC_FLAGS::ACCUM8
	LDA $1C
	STA $02
	STA $1E
	LDA $18
	STA $12
	LDY $16
	STY $14
	BRA @UNKNOWN8
@UNKNOWN6:
	REP #PROC_FLAGS::ACCUM8
	LDA $04
	STA $02
	STA $1C
	INC $24
@UNKNOWN7:
	LDA $24
	CMP #$0004
	BCCL @UNKNOWN3
@UNKNOWN8:
	LDA $1E
	CMP #$029A
	BEQ @UNKNOWN9
	LDA $12
	STA $28
	LDA $14
	STA $26
	LDY $1E
	STY $24
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	DEC
	STA $00
	BRA @UNKNOWN10
@UNKNOWN9:
	.A16
	LDA $20
	CMP #$029A
	BEQ @UNKNOWN13
	LDA $0E
	STA $28
	LDA $10
	STA $26
	LDY $20
	STY $24
@UNKNOWN10:
	REP #PROC_FLAGS::ACCUM8
	LDA $2A
	CMP $22
	BNE @UNKNOWN11
	LDA $22
	BRA @UNKNOWN14
@UNKNOWN11:
	LDA $22
	ASL
	ASL
	CLC
	ADC $2C
	TAX
	LDA $28
	STA a:.LOWORD(RAM),X
	LDA $26
	STA a:.LOWORD(RAM)+2,X
	INC $22
@UNKNOWN12:
	LDA $00
	AND #$00FF
	BNEL @UNKNOWN2
@UNKNOWN13:
	LDA $22
@UNKNOWN14:
	PLD
	RTS
