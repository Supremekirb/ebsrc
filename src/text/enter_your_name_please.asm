
ENTER_YOUR_NAME_PLEASE: ;$C1EAA6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	TAX
	STX $14
	STZ .LOWORD(UNKNOWN_7E5E6E)
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EB49D)
	JSL SET_9622_ONE
	.A16
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN27
	LDX $14
	BEQL @UNKNOWN2
	LDX #$0000
	TXA
	JSL UNKNOWN_C438A5
	.A16
	PROMOTENEARPTR .LOWORD(GAME_STATE) + game_state::earthbound_playername, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$0018
	JSR a:.LOWORD(DISPLAY_CONFIG_MENU_TITLE)
	LDX #$0001
	LDA #$0000
	JSL UNKNOWN_C438A5
	LDA #$000C
	JSL UNKNOWN_C441B7
	LDA .LOWORD(GAME_STATE)
	AND #$00FF
	BEQ @UNKNOWN1
	PROMOTENEARPTR .LOWORD(GAME_STATE) + game_state::mother2_playername, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$000C
	JSR a:.LOWORD(DISPLAY_CONFIG_MENU_TITLE)
@UNKNOWN1:
	LDX #$0001
	LDA #$0000
	JSL UNKNOWN_C438A5
	STZ $0E
	LDA #$FFFF
	STA $10
	LDY #.LOWORD(GAME_STATE) + game_state::mother2_playername
	LDX #$000C
	LDA #WINDOW::UNKNOWN27
	JSR a:.LOWORD(TEXT_INPUT_DIALOG)
	TAY
	STY $12
	JMP @UNKNOWN4
@UNKNOWN2:
	LDX #$0000
	TXA
	JSL UNKNOWN_C438A5
	LOADPTR NAME_REGISTRY_REQUEST_STRING, $0E
	LDA #$001A
	JSR a:.LOWORD(DISPLAY_CONFIG_MENU_TITLE)
	JSL UNKNOWN_C08F8B
	LDX #$0001
	LDA #$0000
	JSL UNKNOWN_C438A5
	LDA #$0018
	JSL UNKNOWN_C441B7
	LDX #$0001
	LDA #$0000
	JSL UNKNOWN_C438A5
	LDY #.LOWORD(GAME_STATE) + game_state::earthbound_playername
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	BEQ @UNKNOWN3
	LDX #$0018
	TYA
	JSL UNKNOWN_C440B5
@UNKNOWN3:
	LDX #$0001
	LDA #$0000
	JSL UNKNOWN_C438A5
	LDA #.LOWORD(GAME_STATE) + game_state::earthbound_playername
	STA $02
	STZ $0E
	LDA #$FFFF
	STA $10
	LDY $02
	LDX #$0018
	LDA #WINDOW::UNKNOWN27
	JSR a:.LOWORD(TEXT_INPUT_DIALOG)
	TAY
	STY $12
	LDX $02
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	JSL UNKNOWN_C4D065
	PROMOTENEARPTR .LOWORD(UNKNOWN_7E9C9F), $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(game_state::mother2_playername)
	LDA #.LOWORD(GAME_STATE) + game_state::mother2_playername
	JSL MEMCPY16
@UNKNOWN4:
	LDA #$001C
	JSL CLOSE_WINDOW
	LDA #$0027
	JSL CLOSE_WINDOW
	LDA #$00FF
	STA .LOWORD(UNKNOWN_7E5E6E)
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7EB49D)
	LDY $12
	REP #PROC_FLAGS::ACCUM8
	TYA
	PLD
	RTL
