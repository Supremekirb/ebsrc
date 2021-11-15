
TEXT_INPUT_DIALOG: ;$C1E57F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 48
	STY $2E
	STX $2C
	STA $2A
	LDY $40
	STY $28
	LDX $3E
	STX $26
	LDA #$FFFF
	STA $24
	STZ $22
	LDA $22
	STA $20
	LDA $26
	STA $1E
	JSL SET_9622_ONE
	CREATE_WINDOW_NEAR #WINDOW::FILE_SELECT_NAMING_KEYBOARD
	LDA $28
	CMP #$FFFF
	BNE @UNKNOWN0
	MOVE_INT f:NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS+20, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	BRA @UNKNOWN1
@UNKNOWN0:
	MOVE_INT f:NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS+16, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
@UNKNOWN1:
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E5E6D)
	REP #PROC_FLAGS::ACCUM8
	LDA $28
	CMP #$FFFF
	BNE @UNKNOWN2
	LOADPTR NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS, $0A
	LDA $26
	ASL
	ASL
	CLC
	ADC #$0008
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	BRA @UNKNOWN3
@UNKNOWN2:
	LOADPTR NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS, $0A
	LDA $26
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
@UNKNOWN3:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5E6D)
@UNKNOWN4:
	JSL SET_9622_ONE
	LDA $1E
	CMP $26
	BEQL @UNKNOWN10
	.A16
	CREATE_WINDOW_NEAR #WINDOW::FILE_SELECT_NAMING_KEYBOARD
	JSL CALL_C12DD5_WITH_ZERO_9622
	.A16
	LDA $28
	CMP #$FFFF
	BNE @UNKNOWN6
	MOVE_INT f:NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS+20, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	BRA @UNKNOWN7
@UNKNOWN6:
	MOVE_INT f:NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS+16, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
@UNKNOWN7:
	LDA $26
	STA $1E
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E5E6D)
	REP #PROC_FLAGS::ACCUM8
	LDA $28
	CMP #$FFFF
	BNE @UNKNOWN8
	LOADPTR NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS, $0A
	LDA $26
	ASL
	ASL
	CLC
	ADC #$0008
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	BRA @UNKNOWN9
@UNKNOWN8:
	LOADPTR NAME_INPUT_WINDOW_SELECTION_LAYOUT_POINTERS, $0A
	LDA $26
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
@UNKNOWN9:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5E6D)
@UNKNOWN10:
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	STA $1C
@UNKNOWN11:
	JSL CLEAR_9622
	LDX $22
	LDA $20
	JSL UNKNOWN_C438A5
	LDA #$0001
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	LDA #$0021
	JSR a:.LOWORD(UNKNOWN_C10D60)
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C10FEA)
	JSL UNKNOWN_C12DD5
	LDA #$0001
	STA $04
@UNKNOWN12:
	LDA $04
	EOR #$0001
	STA $04
	LDY #window_stats::text_y
	LDA ($1C),Y
	ASL
	LDY #window_stats::window_y
	CLC
	ADC ($1C),Y
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $02
	LDY #window_stats::window_x
	LDA ($1C),Y
	LDY #window_stats::text_x
	CLC
	ADC ($1C),Y
	CLC
	ADC $02
	CLC
	ADC #$7C20
	STA $1A
	LDA $04
	ASL
	STA $02
	LOADPTR UNKNOWN_C3E3F8+14, $06
	LDA $02
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDY $1A
	LDX #$0002
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	LOADPTR UNKNOWN_C3E3F8+18, $06
	LDA $02
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA $1A
	CLC
	ADC #$0020
	TAY
	LDX #$0002
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	LDX #$0000
	STX $18
	JMP @UNKNOWN37
@UNKNOWN13:
	JSL UNKNOWN_C1004E
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::UP
	BEQ @UNKNOWN14
	STZ $0E
	LDA #SFX::UNKNOWN7C
	STA $10
	LDA $20
	STA $12
	LDY #window_stats::height
	LDA ($1C),Y
	LSR
	STA $14
	LDY #$FFFF
	LDX $22
	LDA $20
	JSL MOVE_CURSOR
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN14:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::LEFT
	BEQ @UNKNOWN15
	LOADPTR $7BFFFF, $0E
	LDY #window_stats::width
	LDA ($1C),Y
	STA $12
	LDA $22
	STA $14
	LDY #$0000
	LDX $22
	LDA $20
	JSL MOVE_CURSOR
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN15:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::DOWN
	BEQ @UNKNOWN16
	STZ $0E
	LDA #SFX::UNKNOWN7C
	STA $10
	LDA $20
	STA $12
	LDA #$FFFF
	STA $14
	LDY #$0001
	LDX $22
	LDA $20
	JSL MOVE_CURSOR
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN16:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::RIGHT
	BEQ @UNKNOWN17
	LOADPTR $7B0001, $0E
	LDA #$FFFF
	STA $12
	LDA $22
	STA $14
	LDY #$0000
	LDX $22
	LDA $20
	JSL MOVE_CURSOR
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN17:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::UP
	BEQ @UNKNOWN18
	STZ $0E
	LDA #SFX::UNKNOWN7C
	STA $10
	LDY #$FFFF
	LDX $22
	LDA $20
	JSL UNKNOWN_C20B65
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN18:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::DOWN
	BEQ @UNKNOWN19
	STZ $0E
	LDA #SFX::UNKNOWN7C
	STA $10
	LDY #$0001
	LDX $22
	LDA $20
	JSL UNKNOWN_C20B65
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN19:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::LEFT
	BEQ @UNKNOWN20
	LOADPTR $7BFFFF, $0E
	LDY #$0000
	LDX $22
	LDA $20
	JSL UNKNOWN_C20B65
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN20:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::RIGHT
	BEQ @UNKNOWN21
	LOADPTR $7B0001, $0E
	LDY #$0000
	LDX $22
	LDA $20
	JSL UNKNOWN_C20B65
	TAY
	STY $16
	JMP @UNKNOWN40
@UNKNOWN21:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON | PAD::L_BUTTON
	BEQL @UNKNOWN32
	LDA $22
	CMP #$0006
	BNE @SELECTION_NOT_IN_LINE_6
	LDA $20
	BEQ @DONTCARE_SELECTED
	CMP #$0011
	BEQ @BACKSPACE_SELECTED
	CMP #$0019
	BEQ @OK_SELECTED
	JMP @UNKNOWN36
@DONTCARE_SELECTED:
	LDA #SFX::TEXT_INPUT
	JSL PLAY_SOUND
	LDY $24
	LDX $28
	LDA $2A
	JSR a:.LOWORD(UNKNOWN_C1E4BE)
	STA $24
	JMP @UNKNOWN11
@BACKSPACE_SELECTED:
	LDA #SFX::TEXT_INPUT
	JSL PLAY_SOUND
	LDY #$FFFF
	LDX $2C
	LDA $2A
	JSR a:.LOWORD(UNKNOWN_C1E48D)
	CMP #$0000
	BEQL @UNKNOWN11
	LDA $28
	CMP #$FFFF
	BEQL @UNKNOWN11
	LDA #$0001
	JMP @UNKNOWN48
@OK_SELECTED:
	LDA #SFX::UNKNOWN5E
	JSL PLAY_SOUND
	JMP @UNKNOWN42
@SELECTION_NOT_IN_LINE_6:
	LDA #SFX::TEXT_INPUT
	JSL PLAY_SOUND
	LDA $22
	CMP #$0004
	BNE @UNKNOWN31
	LDA $20
	BEQ @UNKNOWN29
	CMP #$0007
	BEQ @UNKNOWN30
	BRA @UNKNOWN31
@UNKNOWN29:
	STZ $26
	JMP @UNKNOWN4
@UNKNOWN30:
	LDA #$0001
	STA $26
	JMP @UNKNOWN4
@UNKNOWN31:
	LDY $26
	LDX $22
	LDA $20
	LSR
	JSL GET_CHARACTER_AT_CURSOR_POSITION
	TAY
	LDX $2C
	LDA $2A
	JSR a:.LOWORD(UNKNOWN_C1E48D)
	JMP @UNKNOWN11
@UNKNOWN32:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::B_BUTTON | PAD::SELECT_BUTTON
	BEQ @UNKNOWN35
	LDA #SFX::UNKNOWN7D
	JSL PLAY_SOUND
	LDY #$FFFF
	LDX $2C
	LDA $2A
	JSR a:.LOWORD(UNKNOWN_C1E48D)
	CMP #$0000
	BEQL @UNKNOWN11
	LDA $28
	CMP #$FFFF
	BEQL @UNKNOWN11
	LDA #$0001
	JMP @UNKNOWN48
@UNKNOWN35:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::START_BUTTON
	BEQ @UNKNOWN36
	LDA #SFX::UNKNOWN7E
	JSL PLAY_SOUND
	BRA @UNKNOWN42
@UNKNOWN36:
	LDX $18
	INX
	STX $18
@UNKNOWN37:
	STX $02
	LDA #$000A
	CLC
	SBC $02
	JUMPGTS @UNKNOWN13
	JMP @UNKNOWN12
@UNKNOWN40:
	LDX $22
	LDA $20
	JSL UNKNOWN_C438A5
	LDA #$002F
	JSR a:.LOWORD(UNKNOWN_C10D60)
	LDY $16
	CPY #$FFFF
	BEQL @UNKNOWN11
	TYA
	AND #$00FF
	STA $20
	TYA
	AND #$FF00
	XBA
	AND #$00FF
	STA $22
	JMP @UNKNOWN11
@UNKNOWN42:
	PROMOTENEARPTR $1B86, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	JSL STRLEN
	CMP #$0000
	BEQL @UNKNOWN11
	LDA $2A
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	LDX #$0000
	BRA @UNKNOWN45
@UNKNOWN44:
	SEP #PROC_FLAGS::ACCUM8
	STA ($2E)
	REP #PROC_FLAGS::ACCUM8
	INC $2E
	INX
@UNKNOWN45:
	LDA .LOWORD(UNKNOWN_7E1B86),X
	AND #$00FF
	BEQ @UNKNOWN47
	CPX $2C
	BCC @UNKNOWN44
	BRA @UNKNOWN47
@UNKNOWN46:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA ($2E)
	REP #PROC_FLAGS::ACCUM8
	INC $2E
	INX
@UNKNOWN47:
	CPX $2C
	BCC @UNKNOWN46
	LDA #$0000
@UNKNOWN48:
	PLD
	RTS
