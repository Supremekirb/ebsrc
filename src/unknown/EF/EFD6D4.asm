
UNKNOWN_EFD6D4: ;$EFD6D4
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 14
	STA $04
	LDA #$0000
	STA $02
	LDX .LOWORD(CURRENT_MUSIC_TRACK)
	STX .LOWORD(UNKNOWN_7EB545)
	STX .LOWORD(UNKNOWN_7EB54B)
	LDA #$0002
	STA .LOWORD(UNKNOWN_7EB54F)
	LDA $04
	JSR a:.LOWORD(UNKNOWN_EFD5D9)
@UNKNOWN0:
	JSL UPDATE_SCREEN
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::Y_BUTTON
	BEQ @UNKNOWN1
	JSR a:.LOWORD(UNKNOWN_EFE175)
	LDA $04
	JSR a:.LOWORD(UNKNOWN_EFD5D9)
@UNKNOWN1:
	JSL OAM_CLEAR
	JSL RUN_ACTIONSCRIPT_FRAME
	LDY .LOWORD(UNKNOWN_7EB54B)
	LDX #$000A
	LDA #$0012
	JSR a:.LOWORD(UNKNOWN_EFD56F)
	LDY .LOWORD(UNKNOWN_7EB54D)
	LDX #$000C
	LDA #$0012
	JSR a:.LOWORD(UNKNOWN_EFD56F)
	LDY .LOWORD(UNKNOWN_7EB54F)
	LDX #$000E
	LDA #$0012
	JSR a:.LOWORD(UNKNOWN_EFD56F)
	LDA a:.LOWORD(PAD_PRESS)
	CMP #PAD::SELECT_BUTTON | PAD::START_BUTTON
	BEQL @UNKNOWN29
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::UP
	BEQ @UNKNOWN3
	LDA $02
	DEC
	STA $02
@UNKNOWN3:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::DOWN
	BEQ @UNKNOWN4
	INC $02
@UNKNOWN4:
	LDA $02
	CMP #$FFFF
	BNE @UNKNOWN5
	LDA #$0002
	STA $02
@UNKNOWN5:
	LDA $02
	CMP #$0003
	BNE @UNKNOWN6
	LDA #$0000
	STA $02
@UNKNOWN6:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::L_BUTTON
	BEQ @UNKNOWN7
	LDA .LOWORD(UNKNOWN_7EB54B)
	STA .LOWORD(UNKNOWN_7EB545)
	LDA #$002E
	STA .LOWORD(UNKNOWN_7EB54B)
@UNKNOWN7:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::B_BUTTON
	BNE @UNKNOWN8
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::R_BUTTON
	BEQ @UNKNOWN9
@UNKNOWN8:
	LDA .LOWORD(UNKNOWN_7EB545)
	STA .LOWORD(UNKNOWN_7EB54B)
@UNKNOWN9:
	LDA $02
	BEQ @UNKNOWN11
	CMP #$0001
	BEQ @UNKNOWN17
	CMP #$0002
	BEQL @UNKNOWN22
	JMP @UNKNOWN27
@UNKNOWN11:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::LEFT
	BEQ @UNKNOWN12
	DEC .LOWORD(UNKNOWN_7EB54B)
@UNKNOWN12:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::RIGHT
	BEQ @UNKNOWN13
	INC .LOWORD(UNKNOWN_7EB54B)
@UNKNOWN13:
	LDA .LOWORD(UNKNOWN_7EB54B)
	CMP #$FFFF
	BNE @UNKNOWN14
	LDA #$00BF
	STA .LOWORD(UNKNOWN_7EB54B)
@UNKNOWN14:
	LDA .LOWORD(UNKNOWN_7EB54B)
	CMP #$00C0
	BNE @UNKNOWN15
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EB54B)
@UNKNOWN15:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON
	BEQL @UNKNOWN27
	JSL STOP_MUSIC
	JSL WAIT_UNTIL_NEXT_FRAME
	LDA .LOWORD(CURRENT_MUSIC_TRACK)
	JSL UNKNOWN_C0AC20
	LDA .LOWORD(UNKNOWN_7EB54B)
	JSL CHANGE_MUSIC
	JMP @UNKNOWN27
@UNKNOWN17:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::LEFT
	BEQ @UNKNOWN18
	DEC .LOWORD(UNKNOWN_7EB54D)
@UNKNOWN18:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::RIGHT
	BEQ @UNKNOWN19
	INC .LOWORD(UNKNOWN_7EB54D)
@UNKNOWN19:
	LDA .LOWORD(UNKNOWN_7EB54D)
	CMP #$FFFF
	BNE @UNKNOWN20
	LDA #$007F
	STA .LOWORD(UNKNOWN_7EB54D)
@UNKNOWN20:
	LDA .LOWORD(UNKNOWN_7EB54D)
	CMP #$0080
	BNE @UNKNOWN21
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EB54D)
@UNKNOWN21:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON
	BEQ @UNKNOWN27
	LDA .LOWORD(UNKNOWN_7EB54D)
	JSL PLAY_SOUND
	BRA @UNKNOWN27
@UNKNOWN22:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::LEFT
	BEQ @UNKNOWN23
	DEC .LOWORD(UNKNOWN_7EB54F)
@UNKNOWN23:
	LDA a:.LOWORD(PAD_HELD)
	AND #PAD::RIGHT
	BEQ @UNKNOWN24
	INC .LOWORD(UNKNOWN_7EB54F)
@UNKNOWN24:
	LDA .LOWORD(UNKNOWN_7EB54F)
	CMP #$FFFF
	BNE @UNKNOWN25
	LDA #$0020
	STA .LOWORD(UNKNOWN_7EB54F)
@UNKNOWN25:
	LDA .LOWORD(UNKNOWN_7EB54F)
	CMP #$0021
	BNE @UNKNOWN26
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EB54F)
@UNKNOWN26:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::A_BUTTON
	BEQ @UNKNOWN27
	LDA .LOWORD(UNKNOWN_7EB54F)
	JSL UNKNOWN_C0AC0C
@UNKNOWN27:
	LDA a:.LOWORD(PAD_PRESS)
	AND #PAD::X_BUTTON
	BEQ @UNKNOWN28
	JSL STOP_MUSIC
	JSL PLAY_SOUND_UNKNOWN0
@UNKNOWN28:
	LDA $04
	ASL
	TAX
	LDA $02
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #$0054
	STA .LOWORD(ENTITY_ABS_Y_TABLE),X
	JMP @UNKNOWN0
@UNKNOWN29:
	PLD
	RTL
