
UNKNOWN_C47765: ;$C47765
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STY $02
	TAY
	LOADPTR UNKNOWN_7F0900+$2F8, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $0A, $06
	TXA
	SEC
	SBC BG1_Y_POS
	STA $14
	CMP #$007F
	BLTEQ @UNKNOWN0
	SEP #PROC_FLAGS::ACCUM8
	LDA #$007F
	STA [$0A]
	REP #PROC_FLAGS::ACCUM8
	LOADPTR UNKNOWN_7F0900+$2F9, $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	LOADPTR UNKNOWN_7F0900+$2FA, $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	LOADPTR UNKNOWN_7F0900+$2FB, $06
	LDA $14
	SEC
	SBC #$007F
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	TYA
	SEC
	SBC BG1_X_POS
	TAY
	LDA $02
	SEC
	SBC BG1_X_POS
	STA $12
	LDX #$0000
	BRA @UNKNOWN2
@UNKNOWN1:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	TYA
	SEP #PROC_FLAGS::ACCUM8
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	INY
	LDA $12
	SEP #PROC_FLAGS::ACCUM8
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	LDA $12
	DEC
	STA $12
	INX
@UNKNOWN2:
	CPX #$0010
	BCC @UNKNOWN1
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0080
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$007F
	STA [$06]
	REP #PROC_FLAGS::ACCUM8
	INC $06
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA [$06]
	LDX $0E
	REP #PROC_FLAGS::ACCUM8
	LDA $10
	JSL UNKNOWN_C42542
	PLD
	RTL
