
UNKNOWN_C426ED: ;$C426ED
	REP #PROC_FLAGS::ACCUM8
	PHD
	PHA
	TDC
	SEC
	SBC #$0002
	TCD
	PLA
	LDX #$0000
@UNKNOWN0:
	LDA $7F0200,X
	CLC
	ADC $7F0800,X
	STA $7F0800,X
	BPL @UNKNOWN1
	LDA #$0000
	STA $7F0200,X
	BRA @UNKNOWN2
@UNKNOWN1:
	AND #$1F00
	CMP #$1F00
	BNE @UNKNOWN2
	LDA #$0000
	STA $7F0200,X
	LDA #$1F00
@UNKNOWN2:
	XBA
	STA $00
	LDA $7F0400,X
	CLC
	ADC $7F0A00,X
	STA $7F0A00,X
	BPL @UNKNOWN3
	LDA #$0000
	STA $7F0400,X
	BRA @UNKNOWN4
@UNKNOWN3:
	AND #$1F00
	CMP #$1F00
	BNE @UNKNOWN4
	LDA #$0000
	STA $7F0400,X
	LDA #$1F00
@UNKNOWN4:
	LSR
	LSR
	LSR
	ORA $00
	STA $00
	LDA $7F0600,X
	CLC
	ADC $7F0C00,X
	STA $7F0C00,X
	BPL @UNKNOWN5
	LDA #$0000
	STA $7F0400,X
	BRA @UNKNOWN6
@UNKNOWN5:
	AND #$1F00
	CMP #$1F00
	BNE @UNKNOWN6
	LDA #$0000
	STA $7F0600,X
	LDA #$1F00
@UNKNOWN6:
	ASL
	ASL
	ORA $00
	STA .LOWORD(CUR_TEXT_PAL),X
	INX
	INX
	CPX #$0200
	BEQ @UNKNOWN7
	JMP @UNKNOWN0
@UNKNOWN7:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0018
	STA a:.LOWORD(UNKNOWN_7E0030)
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
