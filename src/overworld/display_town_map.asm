
DISPLAY_TOWN_MAP: ;$C4D681
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA #$003C
	STA .LOWORD(UNKNOWN_7EB4AE)
	LDA #$0014
	STA .LOWORD(UNKNOWN_7EB4B0)
	LDA #$000C
	STA .LOWORD(UNKNOWN_7EB4B2)
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSR a:.LOWORD(GET_TOWN_MAP_ID)
	AND #$000F
	TAY
	STY $10
	BNE @SKIP_RETURN
	JMP @RETURN
@SKIP_RETURN:
	TYA
	DEC
	JSR a:.LOWORD(LOAD_TOWN_MAP_DATA)
@UNKNOWN1:
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL OAM_CLEAR
	LDY $10
	TYA
	DEC
	JSR a:.LOWORD(UNKNOWN_C4D43F)
	JSL UNKNOWN_C08B19_ENTRY_POINT_2
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::A_BUTTON | PAD::L_BUTTON
	BNE @UNKNOWN2
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::B_BUTTON | PAD::SELECT_BUTTON
	BNE @UNKNOWN2
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::L_BUTTON
	BNE @UNKNOWN2
	LDA a:.LOWORD(PAD_1_PRESS)
	AND #PAD::X_BUTTON
	BEQ @UNKNOWN1
@UNKNOWN2:
	LDX #$0001
	LDA #$0002
	JSL UNKNOWN_C0887A
	LDX #$0000
	STX $0E
	BRA @UNKNOWN4
@UNKNOWN3:
	JSL WAIT_UNTIL_NEXT_FRAME
	JSL OAM_CLEAR
	LDY $10
	TYA
	DEC
	JSR a:.LOWORD(UNKNOWN_C4D43F)
	JSL UNKNOWN_C08B19_ENTRY_POINT_2
	LDX $0E
	INX
	STX $0E
@UNKNOWN4:
	CPX #$0010
	BCC @UNKNOWN3
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5DD8)
	JSL RELOAD_MAP
	LDA .LOWORD(UNKNOWN_7E5DD6)
	STA .LOWORD(UNKNOWN_7E5DD4)
	JSL UNDRAW_FLYOVER_TEXT
	STZ .LOWORD(UNKNOWN_7E5DD8)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0017
	STA a:.LOWORD(TM_MIRROR)
	LDX #$0001
	REP #PROC_FLAGS::ACCUM8
	LDA #$0002
	JSL UNKNOWN_C0886C
@RETURN:
	LDY $10
	TYA
	PLD
	RTL
