
UNKNOWN_C4D744: ;$C4D744
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDX #$0000
	STX $10
	TXY
	STY $0E
	LDA #$003C
	STA UNKNOWN_7EB4AE
	LDA #$0014
	STA UNKNOWN_7EB4B0
	LDA #$000C
	STA UNKNOWN_7EB4B2
	TXA
	JSR LOAD_TOWN_MAP_DATA
@UNKNOWN0:
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL OAM_CLEAR
	LDA PAD_PRESS
	AND #PAD::UP
	BEQ @UNKNOWN1
	LDX $10
	DEX
	STX $10
@UNKNOWN1:
	LDA PAD_PRESS
	AND #PAD::DOWN
	BEQ @UNKNOWN2
	LDX $10
	INX
	STX $10
@UNKNOWN2:
	LDX $10
	CPX #$FFFF
	BNE @UNKNOWN3
	LDX #$0005
	STX $10
@UNKNOWN3:
	CPX #$0006
	BNE @UNKNOWN4
	LDX #$0000
	STX $10
@UNKNOWN4:
	STX $02
	LDY $0E
	TYA
	CMP $02
	BEQ @UNKNOWN5
	TXA
	JSR LOAD_TOWN_MAP_DATA
	LDX $10
	TXY
	STY $0E
@UNKNOWN5:
	TXA
	JSR UNKNOWN_C4D43F
	LDA PAD_PRESS
	AND #PAD::A_BUTTON
	BNE @UNKNOWN6
	JSL UPDATE_SCREEN
	BRA @UNKNOWN0
@UNKNOWN6:
	JSL UNDRAW_FLYOVER_TEXT
	JSL RELOAD_MAP
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0017
	STA TM_MIRROR
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
