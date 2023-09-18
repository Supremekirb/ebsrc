
ENTER_YOUR_NAME_PLEASE: ;$C1EAA6
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	TAX
	STX $14
	JSR SET_INSTANT_PRINTING
	.A16
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN27
	LDX $14
	BEQL @UNKNOWN4_
	.A16
	PROMOTENEARPTR GAME_STATE + game_state::earthbound_playername, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$0018
	JSR PRINT_STRING
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDX #$0000
	STX $14
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA #$005C
	JSR PRINT_LETTER
	LDX $14
	INX
	STX $14
@UNKNOWN2:
	CPX #$000C
	BCC @UNKNOWN1
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDA GAME_STATE
	AND #$00FF
	BEQ @UNKNOWN3
	PROMOTENEARPTR GAME_STATE + game_state::mother2_playername, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$000C
	JSR PRINT_STRING
	LDA #$89D0
	STA $02
	LDA $8C96
	ASL
	TAX
	LDA $8C26,X
	LDY #$004C
	JSL MULT168
	CLC
	ADC $02
	TAX
	LDA __BSS_START__,X
	CMP #$000C
	BCS @UNKNOWN4
	LDA #$0040
	JSR PRINT_LETTER
	LDA $8C96
	ASL
	TAX
	LDA $8C26,X
	LDY #$004C
	JSL MULT168
	CLC
	ADC $02
	TAX
	LDA __BSS_START__,X
	DEC
	STA __BSS_START__,X
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA #$0040
	JSR PRINT_LETTER
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C438A5
@UNKNOWN4:
	LDA #$0000
	STA $0E
	LDA #$FFFF
	STA $10
	LDY #.LOWORD(GAME_STATE) + game_state::mother2_playername
	LDX #$000C
	LDA #WINDOW::UNKNOWN27
	JSR TEXT_INPUT_DIALOG
	TAY
	STY $12
	JMP @UNKNOWN9
@UNKNOWN4_:
	LOADPTR NAME_REGISTRY_REQUEST_STRING, $0E
	LDA #$000B
	JSR PRINT_STRING
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDX #$0000
	STX $14
	BRA @UNKNOWN6
@UNKNOWN5:
	LDA #$005C
	JSR PRINT_LETTER
	LDX $14
	INX
	STX $14
@UNKNOWN6:
	CPX #$0018
	BCC @UNKNOWN5
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C438A5
	LDX #.LOWORD(GAME_STATE) + game_state::earthbound_playername
	LDA __BSS_START__,X
	AND #$00FF
	BEQ @UNKNOWN7
	TXA
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA #$0018
	JSR PRINT_STRING
	LDA #$89D0
	STA $02
	LDA $8C96
	ASL
	TAX
	LDA $8C26,X
	LDY #$004C
	JSL MULT168
	CLC
	ADC $02
	TAX
	LDA __BSS_START__,X
	CMP #$0018
	BCS @UNKNOWN8
	LDA #$0040
	JSR PRINT_LETTER
	LDA $8C96
	ASL
	TAX
	LDA $8C26,X
	LDY #$004C
	JSL MULT168
	CLC
	ADC $02
	TAX
	LDA __BSS_START__,X
	DEC
	STA __BSS_START__,X
	BRA @UNKNOWN8
@UNKNOWN7:
	LDA #$0040
	JSR PRINT_LETTER
	LDX #$0001
	LDA #$0000
	JSR UNKNOWN_C438A5
@UNKNOWN8:
	LDA #.LOWORD(GAME_STATE) + game_state::earthbound_playername
	STA $02
	LDA #$0002
	STA $0E
	LDA #$FFFF
	STA $10
	LDY $02
	LDX #$0018
	LDA #WINDOW::UNKNOWN27
	JSR TEXT_INPUT_DIALOG
	TAY
	STY $12
	LDX $02
	LDA #.LOWORD(UNKNOWN_7E9C9F)
	JSL UNKNOWN_C4D065
	PROMOTENEARPTR UNKNOWN_7E9C9F, $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(game_state::mother2_playername)
	LDA #.LOWORD(GAME_STATE) + game_state::mother2_playername
	JSL MEMCPY16
@UNKNOWN9:
	LDA #$001C
	JSR CLOSE_WINDOW
	LDA #$0027
	JSR CLOSE_WINDOW
	LDY $12
	TYA
	PLD
	RTL
