
UNKNOWN_C0DE46: ;$C0DE46
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	JSR a:.LOWORD(UNKNOWN_C0DE16)
	JSL RAND
	XBA
	AND #$FF00
	STA .LOWORD(UNKNOWN_7E9F61)
	LDA .LOWORD(TELEPORT_STYLE)
	CMP #TELEPORT_STYLE::PSI_BETA
	BNE @UNKNOWN0
	LDA #$0004
	STA .LOWORD(UNKNOWN_7E9F63)
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA #$0008
	STA .LOWORD(UNKNOWN_7E9F63)
	STZ .LOWORD(UNKNOWN_7E9F65)
@UNKNOWN1:
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	STA .LOWORD(UNKNOWN_7E9F67)
	LDA .LOWORD(GAME_STATE)+game_state::leader_y_coord
	STA .LOWORD(UNKNOWN_7E9F69)
	RTS
