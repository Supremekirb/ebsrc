
UNKNOWN_C0E516: ;$C0E516
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	LDA #$0001
	STA .LOWORD(GAME_STATE) + game_state::unknown90
	JSR a:.LOWORD(UNKNOWN_C0E44D)
	LDX .LOWORD(UNKNOWN_7E9F63)
	LDA .LOWORD(UNKNOWN_7E9F61)
	JSL UNKNOWN_C41FFF
	MOVE_INT $06, $12
	AND #$FF00
	XBA
	BPL @UNKNOWN0
	ORA #$FF00
@UNKNOWN0:
	CLC
	ADC .LOWORD(UNKNOWN_7E9F67)
	TAX
	STX .LOWORD(UNKNOWN_7E9F51) + 2
	LDA $12
	AND #$FF00
	XBA
	BPL @UNKNOWN1
	ORA #$FF00
@UNKNOWN1:
	CLC
	ADC .LOWORD(UNKNOWN_7E9F69)
	STA $16
	STA .LOWORD(UNKNOWN_7E9F55) + 2
	LDA .LOWORD(TELEPORT_STYLE)
	CMP #TELEPORT_STYLE::PSI_BETTER
	BEQ @UNKNOWN4
	LDA $16
	STA $0E
	LDA .LOWORD(GAME_STATE)+game_state::leader_direction
	STA $10
	TXY
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSR a:.LOWORD(UNKNOWN_C0DED9)
	AND #$00C0
	BEQ @UNKNOWN2
	LDA #$0002
	STA .LOWORD(UNKNOWN_7E9F43)
@UNKNOWN2:
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BEQ @UNKNOWN3
	LDA #$0002
	STA .LOWORD(UNKNOWN_7E9F43)
	LDA #$0001
	STA .LOWORD(BATTLE_DEBUG)
@UNKNOWN3:
	LDY .LOWORD(GAME_STATE)+game_state::current_party_members
	LDX .LOWORD(UNKNOWN_7E9F55) + 2
	LDA .LOWORD(UNKNOWN_7E9F51) + 2
	JSL NPC_COLLISION_CHECK
	CMP #$FFFF
	BEQ @UNKNOWN4
	LDA #$0002
	STA .LOWORD(UNKNOWN_7E9F43)
@UNKNOWN4:
	LDA .LOWORD(UNKNOWN_7E9F43)
	CMP #$0002
	BEQ @UNKNOWN5
	LDA .LOWORD(UNKNOWN_7E9F51) + 2
	STA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	LDA .LOWORD(UNKNOWN_7E9F55) + 2
	STA .LOWORD(GAME_STATE)+game_state::leader_y_coord
@UNKNOWN5:
	SEP #PROC_FLAGS::INDEX8
	LDY #$000D
	LDA .LOWORD(UNKNOWN_7E9F61)
	JSL ASR8_UNKNOWN1
	INC
	INC
	AND #$0007
	STA .LOWORD(GAME_STATE)+game_state::leader_direction
	REP #PROC_FLAGS::INDEX8
	LDY #.LOWORD(UNKNOWN_7E9F45)
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	CLC
	LDA $06
	ADC #$1851
	STA $06
	BCC @UNKNOWN6
	INC $08
@UNKNOWN6:
	MOVE_INT_YPTRDEST $06, a:.LOWORD(RAM)
	LDA .LOWORD(TELEPORT_STYLE)
	CMP #TELEPORT_STYLE::PSI_BETA
	BNE @UNKNOWN7
	LDA .LOWORD(UNKNOWN_7E9F61)
	CLC
	ADC #$0A00
	STA .LOWORD(UNKNOWN_7E9F61)
	LDA .LOWORD(UNKNOWN_7E9F63)
	CLC
	ADC #$000C
	STA .LOWORD(UNKNOWN_7E9F63)
	BRA @UNKNOWN8
@UNKNOWN7:
	LDA .LOWORD(UNKNOWN_7E9F65)
	CLC
	ADC #$0020
	STA .LOWORD(UNKNOWN_7E9F65)
	CLC
	ADC .LOWORD(UNKNOWN_7E9F61)
	STA .LOWORD(UNKNOWN_7E9F61)
	LDA .LOWORD(UNKNOWN_7E9F63)
	CLC
	ADC #$0010
	STA .LOWORD(UNKNOWN_7E9F63)
@UNKNOWN8:
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL CENTER_SCREEN
	JSR a:.LOWORD(UNKNOWN_C0E196)
	JSR a:.LOWORD(UNKNOWN_C0E254)
	LDA .LOWORD(TELEPORT_STYLE)
	CMP #TELEPORT_STYLE::PSI_BETA
	BNE @UNKNOWN9
	LDA .LOWORD(UNKNOWN_7E9F63)
	CMP #$1000
	BLTEQ @UNKNOWN10
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9F43)
	JSR a:.LOWORD(UNKNOWN_C0E48A)
	BRA @UNKNOWN10
@UNKNOWN9:
	LDA .LOWORD(UNKNOWN_7E9F65)
	CMP #$1800
	BLTEQ @UNKNOWN10
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E9F43)
	JSR a:.LOWORD(UNKNOWN_C0E48A)
@UNKNOWN10:
	PLD
	RTL
