
OVERWORLD_USE_ITEM: ;$C1AF74
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 46
	STX $2C
	STA $04
	STA $2A
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT $06, $26
	LDA #$0000
	STA $02
	STA $24
	LDX $2C
	LDA $04
	JSL GET_CHARACTER_ITEM
	SEP #PROC_FLAGS::ACCUM8
	STA $01
	REP #PROC_FLAGS::ACCUM8
	LDA $01
	AND #$00FF
	STA $22
	LOADPTR ITEM_CONFIGURATION_TABLE, $06
	LDA $22
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC $06
	STA $06
	STA $1E
	LDA $08
	STA $20
	LDY #item::type
	LDA [$1E],Y
	AND #$00FF
	TAX
	STX $1C
	TXA
	AND #ITEM_FLAGS::TRANSFORM | ITEM_FLAGS::CANNOT_GIVE
	BEQ @UNKNOWN1
	CMP #ITEM_FLAGS::TRANSFORM
	BEQ @UNKNOWN2
	CMP #ITEM_FLAGS::CANNOT_GIVE
	BEQ @UNKNOWN3
	CMP #ITEM_FLAGS::TRANSFORM | ITEM_FLAGS::CANNOT_GIVE
	BEQL @UNKNOWN4
	JMP @UNKNOWN18
@UNKNOWN1:
	LDA #$0001
	STA $02
	STA $24
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	INC
	INC
	INC
	INC
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN2:
	LOADPTR MSG_SYS_GOODS_EQUIP, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN3:
	LDA #$0001
	STA $02
	STA $24
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	INC
	INC
	INC
	INC
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN4:
	LDY #item::flags
.IF .DEFINED(JPN)
	LDA $2A
	STA $04
.ENDIF
	LDX $04
	DEX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_USABLE_FLAGS,X
	AND [$1E],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BNE @CHAR_CAN_USE_ITEM
	LOADPTR MSG_SYS_GOODS_USE_NG_USER, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@CHAR_CAN_USE_ITEM:
	LDX $1C
	TXA
	AND #$000C
	BEQ @UNKNOWN6
	CMP #$0004
	BEQ @UNKNOWN7
	CMP #$0008
	BEQ @UNKNOWN8
	JMP @UNKNOWN18
@UNKNOWN6:
	LDA #$0001
	STA $02
	STA $24
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	INC
	INC
	INC
	INC
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN7:
	LOADPTR MSG_SYS_GOODS_USE_NG_HERE, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN8:
	TXA
	AND #$0003
	BEQ @UNKNOWN10
	CMP #$0001
	BEQ @UNKNOWN10
	CMP #$0002
	BEQ @UNKNOWN11
	CMP #$0003
	BEQL @UNKNOWN14
	JMP @UNKNOWN18
@UNKNOWN10:
	LDA #$0001
	STA $02
	STA $24
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	INC
	INC
	INC
	INC
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN11:
	JSR UNKNOWN_C1AD7D
	TAX
	LDA $22
	STA $02
	TXA
	CMP $02
	BNE @UNKNOWN13
	LDA $22
	CMP #$00B0
	BNE @UNKNOWN12
	JSL UNKNOWN_C03C4B
	CMP #$0000
	BEQ @UNKNOWN12
	LOADPTR MSG_SYS_BICYCLE_ATARI_HERE, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN12:
	LDA #$0001
	STA $02
	STA $24
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	INC
	INC
	INC
	INC
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN13:
	LOADPTR MSG_SYS_GOODS_USE_NG_HERE, $06
	MOVE_INT $06, $26
	JMP @UNKNOWN18
@UNKNOWN14:
	LDA #$0001
	STA $02
	STA $24
	JSR UNKNOWN_C1AD42
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN15
	CMP #$0003
	BNE @UNKNOWN16
@UNKNOWN15:
	LOADPTR NPC_CONFIG_TABLE, $0A
	LDA CURRENT_TPT_ENTRY
	STA $04
	ASL
	ASL
	ASL
	ASL
	ADC $04
	CLC
	ADC #$000D
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
@UNKNOWN16:
	MOVE_INT_CONSTANT NULL, $0A
	MOVE_INT $26, $06
	CMP $0C
	BNE @UNKNOWN17
	LDA $06
	CMP $0A
@UNKNOWN17:
	BNE @UNKNOWN18
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	INC
	INC
	INC
	INC
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $26
@UNKNOWN18:
	LDA $2A
	STA $04
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $24
	STA $02
	BEQ @UNKNOWN20
	LDX $04
	LDY #item::effect
	LDA [$1E],Y
	JSR DETERMINE_TARGETTING
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	BNE @UNKNOWN19
	LDA #$0000
	JMP @UNKNOWN43
@UNKNOWN19:
	LDY #item::flags
	LDA [$1E],Y
	AND #$00FF
	AND #ITEM_FLAGS::CONSUMED_ON_USE
	BEQ @UNKNOWN20
	LDX $2C
	LDA $04
	JSR REMOVE_ITEM_FROM_INVENTORY
@UNKNOWN20:
	LDA #$0003
.IF .DEFINED(JPN)
	JSR CLOSE_WINDOW
.ELSE
	JSL CLOSE_WINDOW
.ENDIF
	LDA #$0002
.IF .DEFINED(JPN)
	JSR CLOSE_WINDOW
.ELSE
	JSL CLOSE_WINDOW
.ENDIF
	LDX #.SIZEOF(char_struct::name)
	LDA $04
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	JSR UNKNOWN_C1AC4A
	SEP #PROC_FLAGS::ACCUM8
	LDA $01
	JSR UNKNOWN_C1ACF8
	.A16
	CREATE_WINDOW_NEAR #WINDOW::TEXT_STANDARD
.IF .DEFINED(JPN)
	MOVE_INT1632 $04, $0A
	MOVE_INT $0A, $0E
.ELSE
	MOVE_INT1632 $04, $06
	MOVE_INT $06, $0E
.ENDIF
	JSR SET_WORKING_MEMORY
.IF .DEFINED(JPN)
	MOVE_INT1632 $2C, $0A
	MOVE_INT $0A, $0E
.ELSE
	MOVE_INT1632 $2C, $06
	MOVE_INT $06, $0E
.ENDIF
	JSR SET_ARGUMENT_MEMORY
	LDA $00
	AND #$00FF
	TAY
	CPY #$00FF
	BEQ @UNKNOWN21
.IF .DEFINED(JPN)
	LDX #$0004
.ELSE
	LDX #$0005
.ENDIF
	TYA
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	.A16
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	JSR UNKNOWN_C1ACA1
@UNKNOWN21:
	MOVE_INT_CONSTANT NULL, $0A
	MOVE_INT $26, $06
	CMP $0C
	BNE @UNKNOWN22
	LDA $06
	CMP $0A
@UNKNOWN22:
	BNE @UNKNOWN23
	LOADPTR MSG_SYS_GOODS_USE_NG, $06
	MOVE_INT $06, $26
@UNKNOWN23:
	LDA $02
	BEQL @UNKNOWN41
	LOADPTR BATTLE_ACTION_TABLE, $18
	MOVE_INT $1E, $0A
	LDA #item::effect
	CLC
	ADC $0A
	STA $0A
	STA $14
	LDA $0C
	STA $16
	MOVE_INT $18, $06
	LDA [$0A]
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	CLC
	ADC #$0008
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $06
	MOVE_INT_CONSTANT NULL, $0A
	CMP32 $06, $0A
	BEQL @UNKNOWN41
	LDA #.LOWORD(BATTLERS_TABLE)
	STA CURRENT_ATTACKER
	TAX
	LDA $2A
	STA $04
	JSL BATTLE_INIT_PLAYER_STATS
	SEP #PROC_FLAGS::ACCUM8
	LDA $01
	LDX CURRENT_ATTACKER
	STA __BSS_START__+battler::current_action_argument,X
	REP #PROC_FLAGS::ACCUM8
	LDA $2C
	SEP #PROC_FLAGS::ACCUM8
	LDX CURRENT_ATTACKER
	STA __BSS_START__+7,X
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $26, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
	SEP #PROC_FLAGS::ACCUM8
	LDA $01
	JSR UNKNOWN_C1ACF8
	.A16
	LDX #.LOWORD(BATTLERS_TABLE) + .SIZEOF(battler)
	STX CURRENT_TARGET
	LDA $00
	AND #$00FF
	TAY
	CPY #$00FF
	BNEL @UNKNOWN36
	LDY #$0000
	STY $22
	JMP @UNKNOWN33
@UNKNOWN28:
	TYA
	CLC
.IF .DEFINED(JPN)
	ADC #.LOWORD(GAME_STATE)
	CLC
	ADC #game_state::party_members
	STA $02
	LDX #$0004
.ELSE
	ADC #.LOWORD(GAME_STATE) + game_state::party_members
	STA $02
	LDX #$0005
.ENDIF
	STX $12
	LDX $02
	LDA __BSS_START__,X
	AND #$00FF
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	.A16
	CLC
	ADC #.LOWORD(CHAR_STRUCT)
	LDX $12
	JSR UNKNOWN_C1ACA1
	LDX CURRENT_TARGET
	STX $12
	LDX $02
	LDA __BSS_START__,X
	AND #$00FF
	LDX $12
	JSL BATTLE_INIT_PLAYER_STATS
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDY #item::effect
	LDA [$1E],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	CLC
	ADC #$0008
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	PHA
	MOVE_INT $06, UNKNOWN_7E00BC
	PLA
	JSL UNKNOWN_C09279
	LDA #$0000
	STA $2C
	BRA @UNKNOWN30
@UNKNOWN29:
	LDA $2C
	STA $02
	LDY $22
	TYA
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::afflictions
	CLC
	ADC $02
	PHA
	LDA $2C
	CLC
	ADC CURRENT_TARGET
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__+29,X
	PLX
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $2C
	INC
	STA $2C
@UNKNOWN30:
	STA $02
	LDA #$0007
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN29
	LDY $22
	INY
	STY $22
@UNKNOWN33:
	STY $02
	LDA GAME_STATE+game_state::player_controlled_party_count
	AND #$00FF
	CLC
	SBC $02
	JUMPGTS @UNKNOWN28
	JMP @UNKNOWN40
@UNKNOWN36:
	TYA
	JSL BATTLE_INIT_PLAYER_STATS
	MOVE_INT $14, $0A
	LDA [$0A]
	STA $04
	ASL
	ADC $04
	ASL
	ASL
	CLC
	ADC #$0008
	PHA
	MOVE_INT $18, $0A
	PLA
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	PHA
	MOVE_INT $06, UNKNOWN_7E00BC
	PLA
	JSL UNKNOWN_C09279
	LDA #$0000
	STA $2C
	BRA @UNKNOWN38
@UNKNOWN37:
	LDA $2C
	STA $02
	LDA $00
	AND #$00FF
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::afflictions
	CLC
	ADC $02
	PHA
	LDA $2C
	CLC
	ADC CURRENT_TARGET
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__+battler::afflictions,X
	PLX
	STA __BSS_START__,X
	REP #PROC_FLAGS::ACCUM8
	LDA $2C
	INC
	STA $2C
@UNKNOWN38:
	STA $02
	LDA #$0007
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN37
@UNKNOWN40:
	JSL UNKNOWN_C3EE4D
	BRA @UNKNOWN42
@UNKNOWN41:
	MOVE_INT $26, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_TEXT
@UNKNOWN42:
	LDA #$0001
.IF .DEFINED(JPN)
	JSR CLOSE_WINDOW
.ELSE
	JSL CLOSE_WINDOW
.ENDIF
	LDA #$0001
@UNKNOWN43:
	PLD
	RTS
