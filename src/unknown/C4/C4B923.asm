
UNKNOWN_C4B923: ;$C4B923
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 24
	STX $16
	STA $04
	LDA #$0000
	STA $14
	BRA @UNKNOWN2
@UNKNOWN0:
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $14
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BEQ @UNKNOWN1
	LDA #$00FE
	STA [$06]
@UNKNOWN1:
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	INC
	STA $14
@UNKNOWN2:
	CMP .LOWORD(UNKNOWN_7EB406)
	BCC @UNKNOWN0
	LDA #$0000
	STA $02
	STA $12
	JMP a:.LOWORD(@UNKNOWN27)
@UNKNOWN3:
	LDA $02
	ASL
	TAY
	LDA ($16),Y
	TAY
	STY $10
	LDA a:.LOWORD(RAM),Y
	BNE @UNKNOWN5
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA a:.LOWORD(RAM)+6,Y
	LDY .LOWORD(UNKNOWN_7EB402)
	JSL MULT16
	LDY $10
	CLC
	ADC a:.LOWORD(RAM)+8,Y
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BNE @UNKNOWN4
	JMP a:.LOWORD(@UNKNOWN26)
@UNKNOWN4:
	LDA #$00FF
	STA [$06]
	JMP a:.LOWORD(@UNKNOWN26)
@UNKNOWN5:
	.A16
	LDA #$0000
	STA $0E
	BRA @UNKNOWN10
@UNKNOWN6:
	LDX #$0000
	BRA @UNKNOWN9
@UNKNOWN7:
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	STX $02
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $0E
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BEQ @UNKNOWN8
	LDA #$00FF
	STA [$06]
@UNKNOWN8:
	INX
@UNKNOWN9:
	CPX .LOWORD(UNKNOWN_7EB402)
	BCC @UNKNOWN7
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	INC
	STA $0E
@UNKNOWN10:
	CMP .LOWORD(UNKNOWN_7EB404)
	BCC @UNKNOWN6
	LDA .LOWORD(UNKNOWN_7EB400)
	SEC
	SBC .LOWORD(UNKNOWN_7EB404)
	STA $0E
	BRA @UNKNOWN15
@UNKNOWN11:
	LDX #$0000
	BRA @UNKNOWN14
@UNKNOWN12:
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	STX $02
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $0E
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BEQ @UNKNOWN13
	LDA #$00FF
	STA [$06]
@UNKNOWN13:
	INX
@UNKNOWN14:
	CPX .LOWORD(UNKNOWN_7EB402)
	BCC @UNKNOWN12
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	INC
	STA $0E
@UNKNOWN15:
	CMP .LOWORD(UNKNOWN_7EB400)
	BCC @UNKNOWN11
	LDX #$0000
	BRA @UNKNOWN20
@UNKNOWN16:
	LDA #$0000
	STA $14
	BRA @UNKNOWN19
@UNKNOWN17:
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	STX $02
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $14
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BEQ @UNKNOWN18
	LDA #$00FF
	STA [$06]
@UNKNOWN18:
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	INC
	STA $14
@UNKNOWN19:
	CMP .LOWORD(UNKNOWN_7EB400)
	BCC @UNKNOWN17
	INX
@UNKNOWN20:
	CPX .LOWORD(UNKNOWN_7EB404)
	BCC @UNKNOWN16
	LDA .LOWORD(UNKNOWN_7EB402)
	SEC
	SBC .LOWORD(UNKNOWN_7EB404)
	TAX
	BRA @UNKNOWN25
@UNKNOWN21:
	LDA #$0000
	STA $14
	BRA @UNKNOWN24
@UNKNOWN22:
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	STX $02
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $14
	JSL MULT16
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BEQ @UNKNOWN23
	LDA #$00FF
	STA [$06]
@UNKNOWN23:
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	INC
	STA $14
@UNKNOWN24:
	CMP .LOWORD(UNKNOWN_7EB400)
	BCC @UNKNOWN22
	INX
@UNKNOWN25:
	CPX .LOWORD(UNKNOWN_7EB402)
	BCC @UNKNOWN21
	LDY $10
	TYX
	STZ a:.LOWORD(RAM)+6,X
	TYX
	STZ a:.LOWORD(RAM)+8,X
@UNKNOWN26:
	REP #PROC_FLAGS::ACCUM8
	LDA $12
	STA $02
	INC $02
	LDA $02
	STA $12
@UNKNOWN27:
	LDA $02
	CMP $04
	BCS @UNKNOWN28
	BEQ @UNKNOWN28
	JMP a:.LOWORD(@UNKNOWN3)
@UNKNOWN28:
	PLD
	RTS
