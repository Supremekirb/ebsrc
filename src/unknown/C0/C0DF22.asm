
UNKNOWN_C0DF22: ;$C0DF22
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	STA $12
	LDA .LOWORD(UNKNOWN_7E9F43)
	CMP #$0001
	BEQ @UNKNOWN0
	CMP #$0003
	BEQ @UNKNOWN4
	JMP @UNKNOWN8
@UNKNOWN0:
	LDA .LOWORD(GAME_STATE) + game_state::unknown92
	CMP #$0003
	BNE @UNKNOWN2
	MOVE_INT .LOWORD(UNKNOWN_7E9F45), $06
	CLC
	LDA $06
	ADC #$051E
	STA $06
	BCC @UNKNOWN1
	INC $08
@UNKNOWN1:
	MOVE_INT $06, $0E
	JMP @UNKNOWN12
@UNKNOWN2:
	MOVE_INT .LOWORD(UNKNOWN_7E9F45), $06
	CLC
	LDA $06
	ADC #$3333
	STA $06
	BCC @UNKNOWN3
	INC $08
@UNKNOWN3:
	MOVE_INT $06, $0E
	JMP @UNKNOWN12
@UNKNOWN4:
	LDA .LOWORD(GAME_STATE) + game_state::unknown92
	CMP #$0003
	BNE @UNKNOWN6
	MOVE_INT .LOWORD(UNKNOWN_7E9F45), $06
	SEC
	LDA $06
	SBC #$1999
	STA $06
	BCS @UNKNOWN5
	DEC $08
@UNKNOWN5:
	MOVE_INT $06, $0E
	BRA @UNKNOWN12
@UNKNOWN6:
	MOVE_INT .LOWORD(UNKNOWN_7E9F45), $06
	SEC
	LDA $06
	SBC #$1999
	STA $06
	BCS @UNKNOWN7
	DEC $08
@UNKNOWN7:
	MOVE_INT $06, $0E
	BRA @UNKNOWN12
@UNKNOWN8:
	LDA .LOWORD(GAME_STATE) + game_state::unknown92
	CMP #$0003
	BNE @UNKNOWN10
	MOVE_INT .LOWORD(UNKNOWN_7E9F45), $06
	CLC
	LDA $06
	ADC #$29FB
	STA $06
	BCC @UNKNOWN9
	INC $08
@UNKNOWN9:
	MOVE_INT $06, $0E
	BRA @UNKNOWN12
@UNKNOWN10:
	MOVE_INT .LOWORD(UNKNOWN_7E9F45), $06
	CLC
	LDA $06
	ADC #$1851
	STA $06
	BCC @UNKNOWN11
	INC $08
@UNKNOWN11:
	MOVE_INT $06, $0E
@UNKNOWN12:
	MOVE_INT $0E, $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F45)
	LDA $12
	AND #$0001
	BEQ @UNKNOWN15
	MOVE_INT $0E, $06
	ASR8_INT $06
	MOVE_INT_CONSTANT $B505, $0A
	JSL MULT32
	ASR8_INT $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F49)
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F4D)
	BRA @UNKNOWN16
@UNKNOWN15:
	MOVE_INT $0E, $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F4D)
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F49)
@UNKNOWN16:
	LDA $12
	BEQ @UNKNOWN19
	CMP #$0004
	BEQ @UNKNOWN20
	CMP #$0006
	BEQ @UNKNOWN21
	CMP #$0002
	BEQ @UNKNOWN22
	CMP #$0001
	BEQ @UNKNOWN23
	CMP #$0007
	BEQL @UNKNOWN24
	CMP #$0005
	BEQL @UNKNOWN25
	JMP @UNKNOWN26
@UNKNOWN19:
	MOVE_INT .LOWORD(UNKNOWN_7E9F4D), $06
	SEC
	NEGATE_INT_ASSIGN $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F4D)
@UNKNOWN20:
	MOVE_INT_CONSTANT NULL, .LOWORD(UNKNOWN_7E9F49)
	JMP @UNKNOWN26
@UNKNOWN21:
	MOVE_INT .LOWORD(UNKNOWN_7E9F49), $06
	SEC
	NEGATE_INT_ASSIGN $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F49)
@UNKNOWN22:
	MOVE_INT_CONSTANT NULL, .LOWORD(UNKNOWN_7E9F4D)
	BRA @UNKNOWN26
@UNKNOWN23:
	MOVE_INT .LOWORD(UNKNOWN_7E9F4D), $06
	SEC
	NEGATE_INT_ASSIGN $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F4D)
	BRA @UNKNOWN26
@UNKNOWN24:
	MOVE_INT .LOWORD(UNKNOWN_7E9F4D), $06
	SEC
	NEGATE_INT_ASSIGN $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F4D)
@UNKNOWN25:
	MOVE_INT .LOWORD(UNKNOWN_7E9F49), $06
	SEC
	NEGATE_INT_ASSIGN $06
	MOVE_INT $06, .LOWORD(UNKNOWN_7E9F49)
@UNKNOWN26:
	PLD
	RTS
