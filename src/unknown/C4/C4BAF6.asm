
UNKNOWN_C4BAF6: ;$C4BAF6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 37
	STY $23
	STX $04
	STA $02
	STA $21
	LDY $37
	STY $1F
	LDA $35
	STA $1D
	LDX $33
	STX $1B
	LDY #$0002
	LDA ($23),Y
	STA $19
	LDY #$0004
	LDA ($23),Y
	STA $17
	STZ $15
	STZ $13
	LDX .LOWORD(UNKNOWN_7EB408)
	STX .LOWORD(UNKNOWN_7EB40E)
	STX .LOWORD(UNKNOWN_7EB40C)
	LDA #$0000
	STA $11
	BRA @UNKNOWN3
@UNKNOWN0:
	ASL
	ASL
	STA $02
	LDA $04
	CLC
	ADC $02
	TAX
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA a:.LOWORD(RAM),X
	JSL MULT16
	CLC
	ADC a:.LOWORD(RAM)+2,X
	LDX .LOWORD(UNKNOWN_7EB40E)
	STA a:.LOWORD(RAM),X
	LDA .LOWORD(UNKNOWN_7EB40E)
	CMP .LOWORD(UNKNOWN_7EB40A)
	BNE @UNKNOWN1
	LDX .LOWORD(UNKNOWN_7EB408)
	BRA @UNKNOWN2
@UNKNOWN1:
	LDX .LOWORD(UNKNOWN_7EB40E)
	INX
	INX
@UNKNOWN2:
	STX .LOWORD(UNKNOWN_7EB40E)
	LDA $11
	INC
	STA $11
@UNKNOWN3:
	LDX $21
	STX $02
	CMP $02
	BCC @UNKNOWN0
	JMP @UNKNOWN30
@UNKNOWN4:
	LDX .LOWORD(UNKNOWN_7EB40C)
	LDA a:.LOWORD(RAM),X
	STA $02
	LDA .LOWORD(UNKNOWN_7EB40C)
	CMP .LOWORD(UNKNOWN_7EB40A)
	BNE @UNKNOWN5
	LDX .LOWORD(UNKNOWN_7EB408)
	BRA @UNKNOWN6
@UNKNOWN5:
	LDX .LOWORD(UNKNOWN_7EB40C)
	INX
	INX
@UNKNOWN6:
	STX .LOWORD(UNKNOWN_7EB40C)
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	STA $00
	CMP #$00FE
	BCCL @UNKNOWN30
	LDY #$0001
	LDX $02
	REP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA $11
	BRA @UNKNOWN12
@UNKNOWN8:
	LDA #$0000
	STA $04
	BRA @UNKNOWN11
@UNKNOWN9:
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	TXA
	CLC
	ADC $04
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BNE @UNKNOWN10
	LDY #$0000
	BRA @UNKNOWN13
@UNKNOWN10:
	REP #PROC_FLAGS::ACCUM8
	INC $04
@UNKNOWN11:
	LDA $04
	CMP $17
	BCC @UNKNOWN9
	TXA
	CLC
	ADC .LOWORD(UNKNOWN_7EB402)
	TAX
	LDA $11
	INC
	STA $11
@UNKNOWN12:
	CMP $19
	BCC @UNKNOWN8
@UNKNOWN13:
	CPY #$0000
	BNE @UNKNOWN14
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FC
	STA [$06]
	JMP @UNKNOWN30
@UNKNOWN14:
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	CMP #$00FF
	BNE @UNKNOWN15
	REP #PROC_FLAGS::ACCUM8
	INC $15
	LDA ($23)
	CMP #$0001
	BNE @UNKNOWN15
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $02
	JSL DIVISION16S_DIVISOR_POSITIVE
	LDY #$0006
	STA ($23),Y
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $02
	JSL MODULUS16
	LDY #$0008
	STA ($23),Y
@UNKNOWN15:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FC
	STA $00
	LDX #$0000
	STX $0F
	JMP @UNKNOWN23
@UNKNOWN16:
	REP #PROC_FLAGS::ACCUM8
	TXA
	ASL
	TAX
	LDA $02
	CLC
	ADC .LOWORD(UNKNOWN_7EB410),X
	STA $11
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $11
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	STA $01
	CMP #$00FE
	BCC @UNKNOWN21
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EB40C)
	CMP .LOWORD(UNKNOWN_7EB408)
	BNE @UNKNOWN17
	LDY #$0000
	LDA .LOWORD(UNKNOWN_7EB40E)
	CMP .LOWORD(UNKNOWN_7EB40A)
	BNE @UNKNOWN18
	LDY #$0001
	BRA @UNKNOWN18
@UNKNOWN17:
	LDY #$0000
	LDA .LOWORD(UNKNOWN_7EB40E)
	INC
	INC
	CMP .LOWORD(UNKNOWN_7EB40C)
	BNE @UNKNOWN18
	LDY #$0001
@UNKNOWN18:
	CPY #$0000
	BNE @UNKNOWN22
	LDA $11
	LDX .LOWORD(UNKNOWN_7EB40E)
	STA a:.LOWORD(RAM),X
	LDA .LOWORD(UNKNOWN_7EB40E)
	CMP .LOWORD(UNKNOWN_7EB40A)
	BNE @UNKNOWN19
	LDY .LOWORD(UNKNOWN_7EB408)
	BRA @UNKNOWN20
@UNKNOWN19:
	LDY .LOWORD(UNKNOWN_7EB40E)
	INY
	INY
@UNKNOWN20:
	STY .LOWORD(UNKNOWN_7EB40E)
	BRA @UNKNOWN22
@UNKNOWN21:
	LDA $00
	CMP $01
	BLTEQ @UNKNOWN22
	LDA $01
	STA $00
@UNKNOWN22:
	LDX $0F
	INX
	STX $0F
@UNKNOWN23:
	CPX #$0004
	BCCL @UNKNOWN16
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	CMP #$00FC
	BNE @UNKNOWN25
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA [$06]
	BRA @UNKNOWN29
@UNKNOWN25:
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	INC
	STA $0E
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP $1D
	BNE @UNKNOWN29
	LDA #$0000
	STA $11
	BRA @UNKNOWN28
@UNKNOWN26:
	ASL
	TAX
	LDA $02
	CLC
	ADC .LOWORD(UNKNOWN_7EB410),X
	TAX
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	TXA
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FE
	BCC @UNKNOWN27
	LDA #$00FC
	STA [$06]
@UNKNOWN27:
	REP #PROC_FLAGS::ACCUM8
	LDA $11
	INC
	STA $11
@UNKNOWN28:
	CMP #$0004
	BCC @UNKNOWN26
@UNKNOWN29:
	REP #PROC_FLAGS::ACCUM8
	INC $13
	LDA $1F
	CMP $13
	BLTEQ @UNKNOWN31
	LDA $15
	CMP $1B
	BEQ @UNKNOWN31
@UNKNOWN30:
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EB40C)
	CMP .LOWORD(UNKNOWN_7EB40E)
	BNEL @UNKNOWN4
@UNKNOWN31:
	PLD
	RTS
