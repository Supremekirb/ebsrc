
UNKNOWN_C121B8: ;$C121B8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STX $18
	STA $16
	STZ $14
	LDA .LOWORD(UNKNOWN_7EAD56)
	BEQ @UNKNOWN0
	LDX #$0000
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX #$0001
@UNKNOWN1:
	STX $04
	LDA .LOWORD(GIYGAS_PHASE)
	BEQ @UNKNOWN2
	LDA #$0001
	STA $04
@UNKNOWN2:
	LDX $14
	LDA $04
	JSR a:.LOWORD(UNKNOWN_C11FBC)
	STA $12
	LDX $14
	LDA $04
	JSR ENEMY_FLASHING_ON
	LDX $14
	LDA $04
	JSR a:.LOWORD(UNKNOWN_C120D6)
	JSL UNKNOWN_C12DD5
@UNKNOWN4:
	JSL UNKNOWN_C12E42
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::UP
	BEQ @UNKNOWN5
	LDA $04
	BNE @UNKNOWN5
	LDA .LOWORD(UNKNOWN_7EAD58)
	BNEL @UNKNOWN16
@UNKNOWN5:
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::DOWN
	BEQ @UNKNOWN6
	LDA $04
	CMP #$0001
	BNE @UNKNOWN6
	LDA .LOWORD(UNKNOWN_7EAD56)
	BNEL @UNKNOWN16
@UNKNOWN6:
	LDA #SFX::CURSOR2
	STA $10
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::LEFT
	BEQ @UNKNOWN9
	LDA $04
	STA $02
	LDY $18
	LDX $12
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C12070)
	TAX
	CPX #$FFFF
	BNEL @UNKNOWN17
	LDA $04
	EOR #$0001
	STA $02
	LDY $18
	LDX $12
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C12070)
	TAX
	CPX #$FFFF
	BEQL @UNKNOWN2
	JMP @UNKNOWN17
@UNKNOWN9:
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::RIGHT
	BEQ @UNKNOWN12
	LDA $04
	STA $02
	LDY $18
	LDX $12
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C12012)
	TAX
	CPX #$FFFF
	BNEL @UNKNOWN17
	LDA $04
	EOR #$0001
	STA $02
	LDY $18
	LDX $12
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C12012)
	TAX
	CPX #$FFFF
	BEQL @UNKNOWN2
	JMP @UNKNOWN17
@UNKNOWN12:
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::A_BUTTON | PAD::L_BUTTON
	BEQ @UNKNOWN13
	JSR ENEMY_FLASHING_OFF
	LDY .LOWORD(UNKNOWN_7EAD56)
	LDA $04
	JSL MULT16
	CLC
	ADC $14
	TAX
	INX
	STX $0E
	LDA #SFX::CURSOR1
	JSL PLAY_SOUND
	BRA @UNKNOWN18
@UNKNOWN13:
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::B_BUTTON | PAD::SELECT_BUTTON
	BEQL @UNKNOWN4
	LDA $16
	CMP #$0001
	BNEL @UNKNOWN4
	JSR ENEMY_FLASHING_OFF
	LDX #$0000
	STX $0E
	LDA #SFX::CURSOR2
	JSL PLAY_SOUND
	BRA @UNKNOWN18
@UNKNOWN16:
	LDA #SFX::CURSOR3
	STA $10
	LDA $04
	EOR #$0001
	STA $02
	LDY $18
	LDX $12
	DEX
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C12012)
	TAX
	CPX #$FFFF
	BNE @UNKNOWN17
	LDY $18
	LDX $12
	INX
	LDA $02
	JSR a:.LOWORD(UNKNOWN_C12070)
	TAX
	CPX #$FFFF
	BEQL @UNKNOWN2
@UNKNOWN17:
	STX $14
	LDA $02
	STA $04
	LDA $10
	JSL PLAY_SOUND
	JMP @UNKNOWN2
@UNKNOWN18:
	JSR a:.LOWORD(CLOSE_FOCUS_WINDOW)
	LDX $0E
	TXA
	PLD
	RTS
