
SPAWN_VERTICAL: ;$C02B55
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	TXY
	STY $18
	TAX
	STX $16
	LDA #EVENT_FLAG::UNKNOWN_00B
	JSL GET_EVENT_FLAG
	CMP #$0000
	BNEL @UNKNOWN14
	LDA #EVENT_FLAG::USE_POSTGAME_MUSIC
	JSL GET_EVENT_FLAG
	CMP #$0000
	BNEL @UNKNOWN14
	LDA .LOWORD(UNKNOWN_7E4A5A)
	BEQL @UNKNOWN14
	LDX $16
	TXA
	AND #$0007
	BNEL @UNKNOWN14
	CPX #$FFF0
	BCC @UNKNOWN4
	LDX #$0000
@UNKNOWN4:
	CPX #$0400
	BCC @UNKNOWN5
	JMP @UNKNOWN14
@UNKNOWN5:
	TXA
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC @UNKNOWN6
.IF .DEFINED(JPN)
	ORA #$E000
.ELSE
	ORA #$F000
.ENDIF
@UNKNOWN6:
	STA $14
	LDY $18
	TYA
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC @UNKNOWN7
.IF .DEFINED(JPN)
	ORA #$E000
.ELSE
	ORA #$F000
.ENDIF
@UNKNOWN7:
	STA $12
	STA $04
	BRA @UNKNOWN12
@UNKNOWN8:
	LDA $04
	STA $10
	LDA #$0008
	STA .LOWORD(UNKNOWN_7E4A62)
	STA .LOWORD(UNKNOWN_7E4A64)
	LDA #$0001
	STA $02
@UNKNOWN9:
	LDX $04
	LDA $14
	JSL UNKNOWN_C0263D
	STA $18
	LDY $04
	INY
	STY $0E
	TYX
	LDA $14
	JSL UNKNOWN_C0263D
	TAX
	LDA $18
	BEQ @UNKNOWN11
	CPX $18
	BNE @UNKNOWN11
	LDA .LOWORD(UNKNOWN_7E4A64)
	CLC
	ADC #$0008
	STA .LOWORD(UNKNOWN_7E4A64)
	LDY $0E
	STY $04
	INC $02
	LDA $02
	CMP #$0006
	BNE @UNKNOWN9
	BRA @UNKNOWN11
@UNKNOWN10:
	LDY $18
	LDX $10
	LDA $14
	JSR a:.LOWORD(UNKNOWN_C02668)
@UNKNOWN11:
	LDX $02
	LDA $02
	DEC
	STA $02
	CPX #$0000
	BNE @UNKNOWN10
	INC $04
@UNKNOWN12:
	LDA $12
	CLC
	ADC #$0005
	CLC
	SBC $04
	BRANCHGTS @UNKNOWN8
@UNKNOWN14:
	PLD
	RTL
