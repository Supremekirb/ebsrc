
UNKNOWN_C2FEF9: ;$C2FEF9
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TAX
	TXY
	TXA
	DEC
	STA $12
	CPY #$0000
	BEQ @UNKNOWN0
	LOADPTR UNKNOWN_C3F8F1, $06
	LDA $12
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #$0020
	LDA #$0380
	JSL MEMCPY16
	MOVE_INT $06, $0E
	LDX #$0020
	LDA #$03A0
	JSL MEMCPY16
	MOVE_INT $06, $0E
	LDX #$0020
	LDA #$03C0
	JSL MEMCPY16
	MOVE_INT $06, $0E
	LDX #$0020
	LDA #$03E0
	JSL MEMCPY16
	LDA #$0010
	JSL UNKNOWN_C0856B
	BRA @UNKNOWN3
@UNKNOWN0:
	LDA #$0080
	STA $12
	BRA @UNKNOWN2
@UNKNOWN1:
	ASL
	TAX
	LDA .LOWORD(CUR_TEXT_PAL),X
	LSR
	LSR
	AND #$1CE7
	STA .LOWORD(CUR_MAP_PAL)+64,X
	LDA $12
	INC
	STA $12
@UNKNOWN2:
	CMP #$00C0
	BCC @UNKNOWN1
	LDA #$0010
	JSL UNKNOWN_C0856B
@UNKNOWN3:
	PLD
	RTL
