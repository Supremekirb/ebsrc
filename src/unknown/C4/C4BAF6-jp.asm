
UNKNOWN_C4BAF6: ;$C4BAF6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 39
	STY $25
	STX $04
	STA $02
	STA $23
	LDY $39
	STY $21
	LDA $37
	STA $1F
	LDX $35
	STX $1D
	LDY #$0002
	LDA ($25),Y
	STA $1B
	LDY #$0004
	LDA ($25),Y
	STA $19
	STZ $17
	STZ $15
	LDX .LOWORD(UNKNOWN_7EB408)
	STX .LOWORD(UNKNOWN_7EB40E)
	STX .LOWORD(UNKNOWN_7EB40C)
	LDA #$0000
	STA $13
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
	LDA $13
	INC
	STA $13
@UNKNOWN3:
	LDX $23
	STX $02
	CMP $02
	BCC @UNKNOWN0
	JMP @UNKNOWN30
@UNKNOWN4:
	LDX .LOWORD(UNKNOWN_7EB40C)
	LDA a:.LOWORD(RAM),X
	STA $04
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
	LDA $04
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	STA $00
	CMP #$00FE
	BCS @UNKNOWN7
	BEQ @UNKNOWN7
	JMP @UNKNOWN30
@UNKNOWN7:
	REP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA $02
	STA $11
	LDY $04
	LDX #$0000
	BRA @UNKNOWN12
@UNKNOWN8:
	LDA #$0000
	STA $0F
	BRA @UNKNOWN11
@UNKNOWN9:
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $0F
	STA $02
	TYA
	CLC
	ADC $02
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	CMP #$00FD
	BNE @UNKNOWN10
	REP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA $02
	STA $11
	BRA @UNKNOWN13
@UNKNOWN10:
	REP #PROC_FLAGS::ACCUM8
	LDA $0F
	INC
	STA $0F
@UNKNOWN11:
	CMP $19
	BCC @UNKNOWN9
	TYA
	CLC
	ADC .LOWORD(UNKNOWN_7EB402)
	TAY
	INX
@UNKNOWN12:
	CPX $1B
	BCC @UNKNOWN8
@UNKNOWN13:
	LDA $11
	STA $02
	BNE @UNKNOWN14
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $04
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
	INC $17
	LDA ($25)
	CMP #$0001
	BNE @UNKNOWN15
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $04
	JSL DIVISION16S_DIVISOR_POSITIVE
	LDY #$0006
	STA ($25),Y
	LDY .LOWORD(UNKNOWN_7EB402)
	LDA $04
	JSL MODULUS16
	LDY #$0008
	STA ($25),Y
@UNKNOWN15:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FC
	STA $00
	LDX #$0000
	STX $13
	BRA @UNKNOWN23
@UNKNOWN16:
	REP #PROC_FLAGS::ACCUM8
	TXA
	ASL
	TAX
	LDA $04
	CLC
	ADC .LOWORD(UNKNOWN_7EB410),X
	STA $0F
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $0F
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
	LDA .LOWORD(UNKNOWN_7EB40E)
	CMP .LOWORD(UNKNOWN_7EB40A)
	BEQ @UNKNOWN22
	BRA @UNKNOWN18
@UNKNOWN17:
	LDA .LOWORD(UNKNOWN_7EB40E)
	INC
	INC
	CMP .LOWORD(UNKNOWN_7EB40C)
	BEQ @UNKNOWN22
@UNKNOWN18:
	LDA $0F
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
	BCC @UNKNOWN22
	BEQ @UNKNOWN22
	LDA $01
	STA $00
@UNKNOWN22:
	LDX $13
	INX
	STX $13
@UNKNOWN23:
	CPX #$0004
	BCS @UNKNOWN24
	BEQ @UNKNOWN24
	JMP @UNKNOWN16
@UNKNOWN24:
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	CMP #$00FC
	BNE @UNKNOWN25
	MOVE_INT .LOWORD(UNKNOWN_7EB3FC), $06
	LDA $04
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
	LDA $04
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA $0E
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP $1F
	BNE @UNKNOWN29
	LDA #$0000
	STA $0F
	BRA @UNKNOWN28
@UNKNOWN26:
	ASL
	TAX
	LDA $04
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
	LDA $0F
	INC
	STA $0F
@UNKNOWN28:
	CMP #$0004
	BCC @UNKNOWN26
@UNKNOWN29:
	REP #PROC_FLAGS::ACCUM8
	INC $15
	LDA $21
	CMP $15
	BCC @UNKNOWN31
	BEQ @UNKNOWN31
	LDA $17
	CMP $1D
	BEQ @UNKNOWN31
@UNKNOWN30:
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EB40C)
	CMP .LOWORD(UNKNOWN_7EB40E)
	BEQ @UNKNOWN31
	JMP @UNKNOWN4
@UNKNOWN31:
	PLD
	RTS
