
OPEN_MENU_BUTTON: ;$C133B0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 35
	JSL UNKNOWN_C0943C
	LDA #SFX::CURSOR1
	JSL PLAY_SOUND
	CREATE_WINDOW_NEAR #WINDOW::UNKNOWN00
	LDA #$0001
	STA $02
	JMP @UNKNOWN7
@UNKNOWN1:
	LDA $02
	CMP #$0003
	BNE @UNKNOWN2
	JSR a:.LOWORD(UNKNOWN_C1C373)
	CMP #$0000
	BNE @UNKNOWN2
	JMP @UNKNOWN6
@UNKNOWN2:
	LDA $02
	CMP #$0001
	BEQ @UNKNOWN3
	LDA $02
	CMP #$0005
	BEQ @UNKNOWN3
	LDA $02
	CMP #$0002
	BNE @UNKNOWN4
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN4
	LDX #$0001
	LDA .LOWORD(GAME_STATE) + game_state::party_members
	AND #$00FF
	JSL GET_CHARACTER_ITEM
	CMP #$0000
	BNE @UNKNOWN4
@UNKNOWN3:
	LDX #$0001
	BRA @UNKNOWN5
@UNKNOWN4:
	LDX #$001B
@UNKNOWN5:
	LDA $02
	DEC
	STA $21
	LOADPTR CMD_WINDOW_TEXT, $06
	LDA $21
	OPTIMIZED_MULT $04, 5
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	TXA
	SEP #PROC_FLAGS::ACCUM8
	STA $16
	REP #PROC_FLAGS::ACCUM8
	LDA $21
	LSR
	TAY
	STY $1F
	LDY #$0002
	LDA $02
	JSL MODULUS16
	OPTIMIZED_MULT $04, 5
	STA $04
	LDA #$0005
	SEC
	SBC $04
	TAX
	LDA $02
	LDY $1F
	JSR a:.LOWORD(UNKNOWN_C11596)
@UNKNOWN6:
	INC $02
@UNKNOWN7:
	LDA $02
	CMP #$0007
	BCS @UNKNOWN8
	BEQ @UNKNOWN8
	JMP @UNKNOWN1
@UNKNOWN8:
	JSR a:.LOWORD(PRINT_MENU_ITEMS)
@MAIN_PAUSE_MENU:
	LDA #$0000
	JSR .LOWORD(SET_WINDOW_FOCUS)
	JSR PRINT_MENU_ITEMS
	LDA #$0001
	JSR .LOWORD(SELECTION_MENU)
	STA $06
	STZ $08
	LDA $06
	CMP #MENU_OPTIONS::TALK_TO
	BEQ @TALK_TO
	CMP #MENU_OPTIONS::GOODS
	BEQ @GOODS
	CMP #MENU_OPTIONS::PSI
	BNE @NOT_PSI
	JMP @PSI
@NOT_PSI:
	CMP #MENU_OPTIONS::EQUIP
	BNE @NOT_EQUIP
	JMP @EQUIP
@NOT_EQUIP:
	CMP #MENU_OPTIONS::CHECK
	BNE @NOT_CHECK
	JMP @CHECK
@NOT_CHECK:
	CMP #MENU_OPTIONS::STATUS
	BNE @NOT_STATUS
	JMP @STATUS
@NOT_STATUS:
	JMP @UNKNOWN75
@TALK_TO:
	JSL TALK_TO
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BNE @T012
	LOADPTR TEXT_WHO_ARE_YOU_TALKING_TO, $06
@T012:
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	JMP @UNKNOWN75
@GOODS:
	JSR a:.LOWORD(UNKNOWN_C1134B)
@UNKNOWN9:
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BNE @GOODS_MANY_PARTY_MEMBERS
	LDY #.LOWORD(GAME_STATE) + game_state::party_members
	STY $1D
	LDX #$0001
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	JSL GET_CHARACTER_ITEM
	CMP #$0000
	BNE @UNKNOWN10
	JMP @MAIN_PAUSE_MENU
@UNKNOWN10:
	LDX #$0002
	LDY $1D
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	JSR a:.LOWORD(INVENTORY_GET_ITEM_NAME)
	LDY $1D
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	STA $06
	STZ $07
	STZ $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $19
	LDA #$0000
	JSR UNKNOWN_C43573
	BRA @UNKNOWN12
@GOODS_MANY_PARTY_MEMBERS:
	LDA #$0000
	JSR a:.LOWORD(UNKNOWN_C193E7)
	LOADPTR UNKNOWN_C1339E, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDX #$0001
	LDA #$0000
	JSR a:.LOWORD(CHAR_SELECT_PROMPT)
	STA $06
	STZ $08
	MOVE_INT $06, $19
@UNKNOWN12:
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
@UNKNOWN13:
	BNE @UNKNOWN14
	LDA #$0002
	JSR CLOSE_WINDOW
	JSR a:.LOWORD(UNKNOWN_C19437)
	JMP @MAIN_PAUSE_MENU
@UNKNOWN14:
	LDX #$0001
	LDA $06
	JSL GET_CHARACTER_ITEM
	CMP #$0000
	BNE @UNKNOWN15
	JMP @UNKNOWN9
@UNKNOWN15:
	LDA #$0001
	JSR a:.LOWORD(UNKNOWN_C193E7)
	LDA #$0002
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	STA $02
	JSR a:.LOWORD(UNKNOWN_C19437)
	LDA $02
	BNE @GOODS_ITEM_SELECTED
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BEQ @GOODS_ONE_MEMBER_CANCEL
	JMP @UNKNOWN9
@GOODS_ONE_MEMBER_CANCEL:
	LDX #$0001
	LDA .LOWORD(GAME_STATE) + game_state::party_members
	AND #$00FF
	JSL GET_CHARACTER_ITEM
	CMP #$0000
	BEQ @UNKNOWN17
	LDA #SFX::MENU_OPEN_CLOSE
	JSL PLAY_SOUND
	JSR UNKNOWN_C3E6F8
@UNKNOWN17:
	LDA #$0002
	JSR CLOSE_WINDOW
	JMP @MAIN_PAUSE_MENU
@GOODS_ITEM_SELECTED:
	CREATE_WINDOW_NEAR #WINDOW::INVENTORY_MENU
	MOVE_INT $19, $06
	LDA $06
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::afflictions,X
	AND #$00FF
	TAX
	BEQ @GOODS_ITEM_SELECTED_ALIVE
	STX $04
	LDA #$0004
	CLC
	SBC $04
	BRANCHLTEQS @GOODS_ITEM_SELECTED_ALIVE
	LDX #$0001
	BRA @UNKNOWN22
@GOODS_ITEM_SELECTED_ALIVE:
	LDX #$0000
@UNKNOWN22:
	TXY
	STY $17
	TYX
	LDA #$0000
	JSR UNKNOWN_C438A5
	BRA @UNKNOWN24
@UNKNOWN23:
	TYX
	INX
	STX $1D
	LOADPTR ITEM_USE_MENU_STRINGS, $0A
	TYA
	OPTIMIZED_MULT $04, 5
	CLC
	ADC $0A
	STA $0A
	STA $0E
	LDA $0C
	STA $10
	MOVE_INT_CONSTANT NULL, $12
	TXA
	JSR a:.LOWORD(UNKNOWN_C115F4)
	LDX $1D
	TXY
	STY $17
@UNKNOWN24:
	LDY $17
	CPY #$0004
	BCC @UNKNOWN23
	LDY #$0000
	TYX
	LDA #$0001
	JSR UNKNOWN_C451FA
@UNKNOWN25:
	LDA #$0003
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	JSR a:.LOWORD(PRINT_MENU_ITEMS)
	LDA #$0001
	JSR a:.LOWORD(SELECTION_MENU)
	STA $0A
	STZ $0C
	LDA $0A
	BEQ @UNKNOWN30
	CMP #$0001
	BEQ @GOODS_ITEM_USE
	CMP #$0004
	BEQ @GOODS_ITEM_HELP
	CMP #$0002
	BNE @UNKNOWN28
	JMP @UNKNOWN34
@UNKNOWN28:
	CMP #$0003
	BNE @UNKNOWN29
	JMP @UNKNOWN48
@UNKNOWN29:
	JMP @UNKNOWN75
@UNKNOWN30:
	JSR a:.LOWORD(CLOSE_FOCUS_WINDOW)
	LDA #$0002
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	JSR a:.LOWORD(PRINT_MENU_ITEMS)
	JMP @UNKNOWN15
@GOODS_ITEM_USE:
	LDY #$0000
	LDX $02
	MOVE_INT $19, $06
	LDA $06
	JSR a:.LOWORD(OVERWORLD_USE_ITEM)
	CMP #$0000
	BEQ @UNKNOWN25
	JMP @UNKNOWN75
@GOODS_ITEM_HELP:
	CREATE_WINDOW_NEAR #WINDOW::TEXT_STANDARD
	LDX $02
	MOVE_INT $19, $06
	LDA $06
	JSL GET_CHARACTER_ITEM
	STA $21
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	LDA $21
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::help_text
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $0A
	MOVE_INT $0A, $0E
	JSL DISPLAY_TEXT
	LDA #$0001
	JSR CLOSE_WINDOW
	LDA #$0003
	JSR CLOSE_WINDOW
	LDA #$0002
	JSR a:.LOWORD(SET_WINDOW_FOCUS)
	JSR PRINT_MENU_ITEMS
	JMP @UNKNOWN15
@UNKNOWN34:
	LDA #$0003
	JSR a:.LOWORD(UNKNOWN_C193E7)
	LOADPTR UNKNOWN_C133A7, $0E
	MOVE_INT_CONSTANT NULL, $12
	LDX #$0001
	LDA #$0002
	JSR a:.LOWORD(CHAR_SELECT_PROMPT)
	STA $04
	STA $1D
	JSR a:.LOWORD(UNKNOWN_C19437)
	LDA #$002C
	JSR CLOSE_WINDOW
	LDA $04
	BNE @UNKNOWN35
	JMP @UNKNOWN25
@UNKNOWN35:
	MOVE_INT $19, $06
	MOVE_INT1632 $04, $0A
	CMP32 $0A, $06
	BEQ @UNKNOWN37
	LDX $02
	LDA $06
	JSL GET_CHARACTER_ITEM
	OPTIMIZED_MULT $04, .SIZEOF(item)
	.A16
	CLC
	ADC #item::flags
	TAX
	LDA f:ITEM_CONFIGURATION_TABLE,X
	AND #$00FF
	AND #ITEM_FLAGS::CANNOT_GIVE
	BEQ @UNKNOWN37
	CREATE_WINDOW_NEAR #WINDOW::TEXT_STANDARD
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	MOVE_INT1632 $02, $0A
	MOVE_INT $0A, $0E
	JSR a:.LOWORD(SET_ARGUMENT_MEMORY)
	DISPLAY_TEXT_PTR TEXT_ONLY_ONE_WHO_SHOULD_CARRY_THIS
	LDA #$0001
	JSR CLOSE_WINDOW
	JMP @UNKNOWN25
@UNKNOWN37:
@UNKNOWN43:
	CREATE_WINDOW_NEAR #WINDOW::TEXT_STANDARD
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	MOVE_INT1632 $02, $0A
	MOVE_INT $0A, $0E
	JSR a:.LOWORD(SET_ARGUMENT_MEMORY)
	DISPLAY_TEXT_PTR $C925C9
	LDA $1D
	STA $04
	STA $0A
	STZ $0C
	MOVE_INT $19, $06
	CMP32 $0A, $06
	BNE @UNKNOWN45
	LDY $02
	LDA $06
	TAX
	LDA $04
	JSL $C2295F
	DISPLAY_TEXT_PTR $C92604
	BRA @UNKNOWN47
@UNKNOWN45:
	LDA $04
	JSL $C43525
	CMP #$0000
	BEQ @UNKNOWN46
	LDY $02
	LDA $06
	TAX
	LDA $04
	JSL $C2295F
	MOVE_INT $0A, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	DISPLAY_TEXT_PTR $C92613
	BRA @UNKNOWN47
@UNKNOWN46:
	MOVE_INT $0A, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	DISPLAY_TEXT_PTR $C92646
@UNKNOWN47:
	LDA #$0001
	JSR CLOSE_WINDOW
	LDA #$0003
	JSR CLOSE_WINDOW
	LDA #$0002
	JSR CLOSE_WINDOW
	JMP @MAIN_PAUSE_MENU
@UNKNOWN48:
	CREATE_WINDOW_NEAR #WINDOW::TEXT_STANDARD
	MOVE_INT $19, $06
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_WORKING_MEMORY)
	MOVE_INT1632 $02, $06
	MOVE_INT $06, $0E
	JSR a:.LOWORD(SET_ARGUMENT_MEMORY)
	DISPLAY_TEXT_PTR $C9266A
	LDA #$0001
	JSR CLOSE_WINDOW
	LDA #$0003
	JSR CLOSE_WINDOW
	LDA #$0002
	JSR CLOSE_WINDOW
	JMP @MAIN_PAUSE_MENU
@PSI:
@UNKNOWN63:
	JSR a:.LOWORD(UNKNOWN_C1134B)
	JSR a:.LOWORD(UNKNOWN_C1C373)
	STA $06
	STZ $08
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BEQ @UNKNOWN66
	LDA $06
	DEC
	JSR UNKNOWN_C43573
@UNKNOWN66:
	JSR a:.LOWORD(UNKNOWN_C1B5B6)
	CMP #$0000
	BNE @UNKNOWN75
@UNKNOWN67:
	JSR a:.LOWORD(UNKNOWN_C1C3B6)
	CMP #$0001
	BEQ @UNKNOWN68
	JMP @MAIN_PAUSE_MENU
@UNKNOWN68:
	LDA #SFX::MENU_OPEN_CLOSE
	JSL PLAY_SOUND
	JSR UNKNOWN_C3E6F8
	JMP @MAIN_PAUSE_MENU
@EQUIP:
	JSR a:.LOWORD(UNKNOWN_C1134B)
	JSR a:.LOWORD(UNKNOWN_C1AA5D)
	LDA .LOWORD(GAME_STATE)+game_state::player_controlled_party_count
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN70
	JMP @MAIN_PAUSE_MENU
@UNKNOWN70:
	LDA #SFX::MENU_OPEN_CLOSE
	JSL PLAY_SOUND
	JSR UNKNOWN_C3E6F8
	JMP @MAIN_PAUSE_MENU
@CHECK:
	JSL CHECK
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BNE @UNKNOWN73
	LOADPTR TEXT_NO_PROBLEM_HERE, $06
@UNKNOWN73:
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	BRA @UNKNOWN75
@STATUS:
	JSR a:.LOWORD(UNKNOWN_C1134B)
	JSR a:.LOWORD(UNKNOWN_C1BB71)
	JMP @MAIN_PAUSE_MENU
@UNKNOWN75:
	JSR CLEAR_9622
	JSR a:.LOWORD(HIDE_HPPP_WINDOWS)
	JSR a:.LOWORD(UNKNOWN_C1008E)
@UNKNOWN76:
	JSL UNKNOWN_C12DD5
	.A16
	LDA .LOWORD(UNKNOWN_7EB4A8)
	CMP #$FFFF
	BNE @UNKNOWN76
	JSL UNKNOWN_C09451
	PLD
	RTL
OPEN_MENU_BUTTON_CHECKTALK:
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	JSL UNKNOWN_C0943C
	LDA #SFX::CURSOR1
	JSL PLAY_SOUND
	JSL TALK_TO
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BNE @UNKNOWN79
	JSL CHECK
	CMP32 $06, $0A
	BNE @UNKNOWN79
	LOADPTR TEXT_NO_PROBLEM_HERE, $06
@UNKNOWN79:
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	JSR CLEAR_9622
	JSR a:.LOWORD(HIDE_HPPP_WINDOWS)
	JSR a:.LOWORD(UNKNOWN_C1008E)
@UNKNOWN80:
	JSL UNKNOWN_C12DD5
	LDA .LOWORD(UNKNOWN_7EB4A8)
	CMP #$FFFF
	BNE @UNKNOWN80
	JSL UNKNOWN_C09451
	PLD
	RTL
