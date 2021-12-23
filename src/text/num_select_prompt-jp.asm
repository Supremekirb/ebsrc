
NUM_SELECT_PROMPT: ;$C1101C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 40
	STA $26
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BNE @UNKNOWN0
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT $06, $2E
	JMP @UNKNOWN24
@UNKNOWN0:
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAX
	LDA a:window_stats::text_x,X
	STA $24
	LDA a:window_stats::text_y,X
	STA $22
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT $06, $1E
	LDA #$0001
	STA $1C
	MOVE_INT_CONSTANT 1, $0A
	MOVE_INT $0A, $18
@UNKNOWN1:
	JSR SET_INSTANT_PRINTING
	LDX $22
	LDA $24
	JSR UNKNOWN_C438A5
	MOVE_INT $1E, $06
	MOVE_INT $06, $0E
	JSR UNKNOWN_C10D7C
	STA $02
	LDA #$0007
	SEC
	SBC $02
	CLC
	ADC #.LOWORD(UNKNOWN_7E895A)
	STA $04
	LDY $26
	STY $16
	BRA @UNKNOWN5
@UNKNOWN2:
	CPY $1C
	BNE @UNKNOWN3
	LDX #$0010
	BRA @UNKNOWN4
@UNKNOWN3:
	LDX #$0030
@UNKNOWN4:
	TXA
	JSR PRINT_LETTER
	LDY $16
	DEY
	STY $16
@UNKNOWN5:
	TYA
	CMP $02
	BGT @UNKNOWN2
	BRA @UNKNOWN10
@UNKNOWN7:
	CPY $1C
	BNE @UNKNOWN8
	LDX #$0010
	BRA @UNKNOWN9
@UNKNOWN8:
	LDX #$0030
@UNKNOWN9:
	STX $02
	LDX $04
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	CLC
	ADC $02
	INC $04
	JSR PRINT_LETTER
	LDY $16
	DEY
	STY $16
@UNKNOWN10:
	CPY #$0000
	BNE @UNKNOWN7
	JSR CLEAR_INSTANT_PRINTING
	JSL WINDOW_TICK
@UNKNOWN11:
	JSL UNKNOWN_C12E42
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::LEFT
	BEQ @UNKNOWN12
	LDA $1C
	CMP $26
	BCS @UNKNOWN12
	LDA #SFX::CURSOR2
	JSL PLAY_SOUND
	INC $1C
	MOVE_INT $18, $0A
	MOVE_INT $0A, $06
	MOVE_INT_CONSTANT 10, $0A
	JSL MULT32
	MOVE_INT $06, $0A
	MOVE_INT $0A, $18
	JMP @UNKNOWN1
@UNKNOWN12:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::RIGHT
	BEQ @UNKNOWN13
	LDA $1C
	CMP #$0001
	BLTEQ @UNKNOWN13
	LDA #SFX::CURSOR2
	JSL PLAY_SOUND
	DEC $1C
	MOVE_INT $18, $0A
	MOVE_INT $0A, $06
	MOVE_INT_CONSTANT 10, $0A
	JSL DIVISION32S_DIVISOR_POSITIVE
	MOVE_INT $06, $0A
	MOVE_INT $0A, $18
	JMP @UNKNOWN1
@UNKNOWN13:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::UP
	BEQL @UNKNOWN17
	LDA #SFX::CURSOR3
	JSL PLAY_SOUND
	MOVE_INT_CONSTANT 9, $12
	MOVE_INT $18, $0A
	JSL DIVISION32S_DIVISOR_POSITIVE
	MOVE_INT_CONSTANT 10, $0A
	JSL MODULUS32
	MOVE_INT $12, $0A
	CMP32 $06, $0A
	BEQ @UNKNOWN16
	MOVE_INT $18, $0A
	MOVE_INT $1E, $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	MOVE_INT $06, $1E
	JMP @UNKNOWN1
@UNKNOWN16:
	MOVE_INT $18, $0A
	MOVE_INT $0A, $06
	MOVE_INT $12, $0A
	JSL MULT32
	MOVE_INT $06, $0A
	MOVE_INT $1E, $06
	SEC
	SUB_INT_ASSIGN $06, $0A
	MOVE_INT $06, $1E
	JMP @UNKNOWN1
@UNKNOWN17:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::DOWN
	BEQL @UNKNOWN21
	LDA #SFX::CURSOR3
	JSL PLAY_SOUND
	MOVE_INT $18, $0A
	JSL DIVISION32S_DIVISOR_POSITIVE
	MOVE_INT_CONSTANT 10, $0A
	JSL MODULUS32
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BEQ @UNKNOWN20
	MOVE_INT $18, $0A
	MOVE_INT $1E, $06
	SEC
	SUB_INT_ASSIGN $06, $0A
	MOVE_INT $06, $1E
	JMP @UNKNOWN1
@UNKNOWN20:
	MOVE_INT $18, $0A
	MOVE_INT $0A, $06
	MOVE_INT_CONSTANT 9, $0A
	JSL MULT32
	MOVE_INT $06, $0A
	MOVE_INT $1E, $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	MOVE_INT $06, $1E
	JMP @UNKNOWN1
@UNKNOWN21:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON | PAD::L_BUTTON
	BEQ @UNKNOWN22
	LDA #SFX::CURSOR1
	JSL PLAY_SOUND
	MOVE_INT $06, $2E
	BRA @UNKNOWN24
@UNKNOWN22:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::B_BUTTON | PAD::SELECT_BUTTON
	BEQL @UNKNOWN11
	LDA #SFX::CURSOR2
	JSL PLAY_SOUND
	MOVE_INT_CONSTANT $FFFFFFFF, $06
	MOVE_INT $06, $2E
@UNKNOWN24:
	PLD
	RTS
