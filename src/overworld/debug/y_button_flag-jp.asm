
DEBUG_Y_BUTTON_FLAG: ;$C13D03
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDX #EVENT_FLAG::FLG_TEMP_0
	STX $02
@UNKNOWN0:
	JSR SET_INSTANT_PRINTING
	CREATE_WINDOW_NEAR #WINDOW::FILE_SELECT_MENU
	LDA #$0003
	JSR a:.LOWORD(UNKNOWN_C10EB4)
	MOVE_INT1632 $02, $06
	MOVE_INT $06, $0E
	JSR a:.LOWORD(PRINT_NUMBER)
	LDA #$0020
	JSR PRINT_LETTER
	LDA $02
	JSL GET_EVENT_FLAG
	CMP #$0000
	BEQ @UNKNOWN1
	LOADPTR DEBUG_ON_TEXT, $06
	BRA @UNKNOWN2
@UNKNOWN1:
	LOADPTR DEBUG_OFF_TEXT, $06
@UNKNOWN2:
	MOVE_INT $06, $0E
	LDA #$0100
	JSR a:.LOWORD(PRINT_STRING)
	JSR CLEAR_INSTANT_PRINTING
	JSL WINDOW_TICK
	LDY $02
	STY $12
@UNKNOWN3:
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::UP
	BEQ @UNKNOWN4
	LDY $12
	INY
	STY $12
	BRA @UNKNOWN11
@UNKNOWN4:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::DOWN
	BEQ @UNKNOWN5
	LDY $12
	DEY
	STY $12
	BRA @UNKNOWN11
@UNKNOWN5:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::RIGHT
	BEQ @UNKNOWN6
	LDY $12
	TYA
	CLC
	ADC #$000A
	TAY
	STY $12
	BRA @UNKNOWN11
@UNKNOWN6:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::LEFT
	BEQ @UNKNOWN7
	LDY $12
	TYA
	SEC
	SBC #$000A
	TAY
	STY $12
	BRA @UNKNOWN11
@UNKNOWN7:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON | PAD::L_BUTTON
	BEQ @UNKNOWN10
	LDA $02
	JSL GET_EVENT_FLAG
	CMP #$0000
	BEQ @UNKNOWN8
	LDX #$0000
	BRA @UNKNOWN9
@UNKNOWN8:
	LDX #$0001
@UNKNOWN9:
	LDA $02
	JSL SET_EVENT_FLAG
	BRA @UNKNOWN11
@UNKNOWN10:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::B_BUTTON | PAD::SELECT_BUTTON
	BEQ @UNKNOWN3
	LDA #$0014
	JSR CLOSE_WINDOW
	BRA @UNKNOWN14
@UNKNOWN11:
	LDY $12
	CPY #$07D0
	BCC @UNKNOWN12
	JMP @UNKNOWN0
@UNKNOWN12:
	CPY #$0000
	BEQL @UNKNOWN0
	STY $02
	JMP @UNKNOWN0
@UNKNOWN14:
	PLD
	RTL
