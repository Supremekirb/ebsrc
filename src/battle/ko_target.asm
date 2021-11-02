
;A: battler* target
KO_TARGET: ;$C27550
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 36
	STA $02
	STZ .LOWORD(UNKNOWN_7EAA92)
	LDX $02
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNEL @UNKNOWN22
	LDX $02
	LDA a:battler::afflictions + STATUS_GROUP::PERSISTENT_HARDHEAL,X
	AND #$00FF
	CMP #STATUS_1::POSSESSED
	BNEL @UNKNOWN10
	LDY #$0000
	STY $22
	JMP @UNKNOWN9
@UNKNOWN2:
	TYA
	LDY #.SIZEOF(battler)
	JSL MULT168
	STA $20
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQL @UNKNOWN8
	LDA $20
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::npc_id,X
	AND #$00FF
	BNEL @UNKNOWN8
	LDA $20
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + battler::afflictions
	TAX
	LDA a:STATUS_GROUP::PERSISTENT_HARDHEAL,X
	AND #$00FF
	CMP #STATUS_1::POSSESSED
	BNE @UNKNOWN8
	LDA $20
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)
	STA $04
	LDA $02
	CMP $04
	BNE @UNKNOWN10
	LDA .LOWORD(BATTLERS_TABLE)+(TOTAL_PARTY_COUNT)*.SIZEOF(battler)+battler::npc_id
	AND #$00FF
	CMP #ENEMY::TINY_LIL_GHOST
	BNE @UNKNOWN10
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(BATTLERS_TABLE)+(TOTAL_PARTY_COUNT)*.SIZEOF(battler)+battler::consciousness
	BRA @UNKNOWN7
@UNKNOWN5:
	REP #PROC_FLAGS::ACCUM8
	TYA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN6
	LDA .LOWORD(BATTLERS_TABLE)+battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN6
	TXA
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + battler::afflictions
	TAX
	LDA a:STATUS_GROUP::PERSISTENT_HARDHEAL,X
	AND #$00FF
	CMP #STATUS_1::POSSESSED
	BNE @UNKNOWN6
	LDX #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 6)
	LDA #ENEMY::TINY_LIL_GHOST
	JSL BATTLE_INIT_ENEMY_STATS
	SEP #PROC_FLAGS::ACCUM8
	LDA #ENEMY::TINY_LIL_GHOST
	STA .LOWORD(BATTLERS_TABLE)+(TOTAL_PARTY_COUNT)*.SIZEOF(battler)+battler::npc_id
	LDA #$0001
	STA .LOWORD(BATTLERS_TABLE)+(TOTAL_PARTY_COUNT)*.SIZEOF(battler)+13
@UNKNOWN6:
	LDY $22
	INY
	STY $22
@UNKNOWN7:
	LDY $22
	CPY #$0006
	BCC @UNKNOWN5
	BRA @UNKNOWN10
@UNKNOWN8:
	LDY $22
	INY
	STY $22
@UNKNOWN9:
	CPY #$0006
	BCCL @UNKNOWN2
@UNKNOWN10:
	SEP #PROC_FLAGS::ACCUM8
	LDA #STATUS_0::UNCONSCIOUS
	LDX $02
	STA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::SHIELD,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::HOMESICKNESS,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::CONCENTRATION,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::STRANGENESS,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::TEMPORARY,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::PERSISTENT_HARDHEAL,X
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	CLC
	ADC #battler::npc_id
	TAX
	STX $22
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BEQL @UNKNOWN21
	LOADPTR ENEMY_CONFIGURATION_TABLE, $0A
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::death_text_ptr
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_IN_BATTLE_TEXT
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	STZ a:battler::consciousness,X
	LDX $22
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X ;battler::npc_id
	AND #$00FF
	TAX
	CPX #PARTY_MEMBER::TEDDY_BEAR
	BEQ @UNKNOWN12
	CPX #PARTY_MEMBER::PLUSH_TEDDY_BEAR
	BNE @UNKNOWN14
@UNKNOWN12:
	LDA $02
	CLC
	ADC #battler::row
	TAX
	STX $1E
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	TAX
	LDA .LOWORD(GAME_STATE)+game_state::party_npc_1,X
	AND #$00FF
	BEQL @UNKNOWN62
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	LDX $02
	STA a:battler::consciousness,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	LDX $1E
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	ASL
	TAX
	LDA .LOWORD(GAME_STATE)+game_state::party_npc_1_hp,X
	LDX $02
	STA a:battler::hp_target,X
	LDX $02
	STA a:battler::hp,X
	LDX $1E
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(GAME_STATE)+game_state::party_npc_1,X
	LDX $02
	STA a:battler::npc_id,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	ASL
	TAX
	INX
	LDA f:NPC_AI_TABLE,X
	AND #$00FF
	LDX $02
	STA a:battler::id,X
	JMP @UNKNOWN62
@UNKNOWN14:
	LDA .LOWORD(GAME_STATE)+game_state::party_npc_1
	AND #$00FF
	BEQL @UNKNOWN62
	LDX #.LOWORD(BATTLERS_TABLE)
	LDY #$0000
	BRA @UNKNOWN18
@UNKNOWN16:
	LDA a:battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN17
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNE @UNKNOWN17
	SEP #PROC_FLAGS::ACCUM8
	LDA a:battler::npc_id,X
	CMP .LOWORD(GAME_STATE)+game_state::party_npc_1
	BNE @UNKNOWN17
	STZ a:battler::row,X
	JMP @UNKNOWN62
@UNKNOWN17:
	REP #PROC_FLAGS::ACCUM8
	TXA
	CLC
	ADC #.SIZEOF(battler)
	TAX
	INY
@UNKNOWN18:
	STY $02
	LDA #BATTLER_COUNT
	CLC
	SBC $02
	BRANCHGTS @UNKNOWN16
	JMP @UNKNOWN62
@UNKNOWN21:
	LDX $02
	STZ a:battler::hp_target,X
	LDA $02
	CLC
	ADC #battler::row
	TAX
	STX $1C
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	STZ .LOWORD(CHAR_STRUCT)+char_struct::current_hp_target,X
	LDX $1C
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA #$0001
	STA .LOWORD(CHAR_STRUCT)+char_struct::current_hp,X
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_GOT_HURT_AND_COLLAPSED
	JMP @UNKNOWN62
@UNKNOWN22:
	LDX $02
	LDA a:battler::id,X
	CMP #ENEMY::GIYGAS_2
	BEQL @UNKNOWN62
	CMP #ENEMY::GIYGAS_3
	BEQL @UNKNOWN62
	CMP #ENEMY::GIYGAS_5
	BEQL @UNKNOWN62
	CMP #ENEMY::GIYGAS_6
	BEQL @UNKNOWN62
	LDA #$0001
	JSL COUNT_CHARS
	CMP #$0001
	BNEL @UNKNOWN31
	JSL UNKNOWN_C20F9A
	LDA #$0000
	STA $22
	BRA @UNKNOWN30
@UNKNOWN28:
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	STX $1E
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN29
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,X
	AND #$00FF
	BNE @UNKNOWN29
	LDA .LOWORD(BATTLERS_TABLE)+battler::afflictions,X
	AND #$00FF
	CMP #STATUS_0::UNCONSCIOUS
	BEQ @UNKNOWN29
	LDA .LOWORD(BATTLERS_TABLE)+battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN29
	TXA
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + battler::row
	TAY
	STY $20
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::current_hp,X
	BNE @UNKNOWN29
	LDA #$0001
	LDX $1E
	STA .LOWORD(BATTLERS_TABLE)+battler::hp_target,X
	LDY $20
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA #$0001
	STA .LOWORD(CHAR_STRUCT)+char_struct::current_hp_target,X
@UNKNOWN29:
	LDA $22
	INC
	STA $22
@UNKNOWN30:
	CMP #TOTAL_PARTY_COUNT
	BCC @UNKNOWN28
@UNKNOWN31:
	LDA $02
	CLC
	ADC #battler::exp
	TAY
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $0A
	MOVE_INT .LOWORD(BATTLE_EXP_SCRATCH), $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	MOVE_INT $06, .LOWORD(BATTLE_EXP_SCRATCH)
	LDX $02
	LDA a:battler::money,X
	CLC
	ADC .LOWORD(BATTLE_MONEY_SCRATCH)
	STA .LOWORD(BATTLE_MONEY_SCRATCH)
	LOADPTR ENEMY_CONFIGURATION_TABLE, $18
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::final_action
	TAY
	LDA [$18],Y
	BEQL @UNKNOWN33
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EAA90)
	LDX .LOWORD(CURRENT_ATTACKER)
	STX $1E
	LDY .LOWORD(CURRENT_TARGET)
	STY $16
	MOVE_INT .LOWORD(BATTLER_TARGET_FLAGS), $06
	MOVE_INT $06, $12
	LDA $02
	STA .LOWORD(CURRENT_ATTACKER)
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::final_action
	TAY
	LDA [$18],Y
	LDX $02
	STA a:battler::current_action,X
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::final_action_arg
	TAY
	SEP #PROC_FLAGS::ACCUM8
	LDA [$18],Y
	LDX $02
	STA a:battler::current_action_argument,X
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CURRENT_ATTACKER)
	JSL CHOOSE_TARGET
	LDA .LOWORD(CURRENT_ATTACKER)
	JSL UNKNOWN_C24703
	LDA #$0000
	JSL FIX_ATTACKER_NAME
	JSL UNKNOWN_C23E32
	LOADPTR BATTLE_ACTION_TABLE, $0A
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::final_action
	TAY
	LDA [$18],Y
	OPTIMIZED_MULT $04, 12
	INC
	INC
	INC
	INC
	MOVE_INTX $0A, $06
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_IN_BATTLE_TEXT
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::final_action
	TAY
	LDA [$18],Y
	OPTIMIZED_MULT $04, .SIZEOF(battle_action)
	CLC
	ADC #battle_action::battle_function_pointer
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL UNKNOWN_C240A4
	STZ .LOWORD(UNKNOWN_7EAA90)
	LDX $1E
	STX .LOWORD(CURRENT_ATTACKER)
	LDY $16
	STY .LOWORD(CURRENT_TARGET)
	MOVE_INT $12, $06
	MOVE_INT $06, .LOWORD(BATTLER_TARGET_FLAGS)
	LDA #$0000
	JSL FIX_ATTACKER_NAME
	JSL FIX_TARGET_NAME
	LDA .LOWORD(UNKNOWN_7EAA0E)
	BNEL @UNKNOWN62
@UNKNOWN33:
	LDA .LOWORD(UNKNOWN_7EAA92)
	BNEL @UNKNOWN62
	LOADPTR ENEMY_CONFIGURATION_TABLE, $0A
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::death_text_ptr
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $0E
	JSL DISPLAY_IN_BATTLE_TEXT
	LDA #.LOWORD(BATTLERS_TABLE)
	LDX #$0000
	STX $22
	BRA @UNKNOWN36
@UNKNOWN35:
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ a:battler::unknown75,X
	CLC
	REP #PROC_FLAGS::ACCUM8
	ADC #.SIZEOF(battler)
	LDX $22
	INX
	STX $22
@UNKNOWN36:
	CPX #BATTLER_COUNT
	BCC @UNKNOWN35
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	LDX $02
	STA a:battler::unknown75,X
	REP #PROC_FLAGS::ACCUM8
	LDA #$000A
	JSL UNKNOWN_C2FAD8
	LDA #$0001
	STA $04
	BRA @UNKNOWN38
@UNKNOWN37:
	LDA #$001F
	STA $0E
	TAY
	TAX
	STX $1E
	LDX $02
	LDA a:battler::vram_sprite_index,X
	AND #$00FF
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $04
	LDX $1E
	JSL UNKNOWN_C2FB35
	INC $04
@UNKNOWN38:
	LDA $04
	CMP #$0010
	BCC @UNKNOWN37
	LDA #SIXTH_OF_A_SECOND
	JSR a:.LOWORD(WAIT)
	LDA #$0014
	JSL UNKNOWN_C2FAD8
	LDA #$0001
	STA $04
	BRA @UNKNOWN40
@UNKNOWN39:
	STZ $0E
	LDY #$0000
	TYX
	STX $1E
	LDX $02
	LDA a:battler::vram_sprite_index,X
	AND #$00FF
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $04
	LDX $1E
	JSL UNKNOWN_C2FB35
	INC $04
@UNKNOWN40:
	LDA $04
	CMP #$0010
	BCC @UNKNOWN39
	LDA #THIRD_OF_A_SECOND
	JSR a:.LOWORD(WAIT)
	SEP #PROC_FLAGS::ACCUM8
	LDA #STATUS_0::UNCONSCIOUS
	LDX $02
	STA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::SHIELD,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::HOMESICKNESS,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::CONCENTRATION,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::STRANGENESS,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::TEMPORARY,X
	LDX $02
	STZ a:battler::afflictions + STATUS_GROUP::PERSISTENT_HARDHEAL,X
	LDX $02
	REP #PROC_FLAGS::ACCUM8
	STZ a:battler::hp_target,X
	LDX $02
	LDA a:battler::id,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::death_type
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	AND #$00FF
	BEQL @UNKNOWN54
	LDX #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * (FIRST_ENEMY_INDEX))
	LDY #FIRST_ENEMY_INDEX
	BRA @UNKNOWN44
@UNKNOWN42:
	LDA a:battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN43
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA a:battler::unknown75,X
@UNKNOWN43:
	REP #PROC_FLAGS::ACCUM8
	TXA
	CLC
	ADC #.SIZEOF(battler)
	TAX
	INY
@UNKNOWN44:
	CPY #BATTLER_COUNT
	BCC @UNKNOWN42
	LDA #SFX::ENEMY_DEFEATED
	JSL PLAY_SOUND
	LDA #$000A
	JSL UNKNOWN_C2FAD8
	LDA #$0001
	STA $04
	BRA @UNKNOWN47
@UNKNOWN45:
	LDA $04
	AND #$000F
	BEQ @UNKNOWN46
	LDA #$001F
	STA $0E
	TAY
	TAX
	LDA $04
	JSL UNKNOWN_C2FB35
@UNKNOWN46:
	INC $04
@UNKNOWN47:
	LDA $04
	CMP #$0040
	BCC @UNKNOWN45
	LDA #SIXTH_OF_A_SECOND
	JSR a:.LOWORD(WAIT)
	LDA #$0014
	JSL UNKNOWN_C2FAD8
	LDA #$0001
	STA $04
	BRA @UNKNOWN50
@UNKNOWN48:
	LDA $04
	AND #$000F
	BEQ @UNKNOWN49
	STZ $0E
	LDY #$0000
	TYX
	LDA $04
	JSL UNKNOWN_C2FB35
@UNKNOWN49:
	INC $04
@UNKNOWN50:
	LDA $04
	CMP #$0040
	BCC @UNKNOWN48
	LDA #$0014
	JSR a:.LOWORD(WAIT)
	LDX #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 8)
	LDY #$0008
	BRA @UNKNOWN53
@UNKNOWN51:
	LDA a:battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN52
	SEP #PROC_FLAGS::ACCUM8
	LDA #STATUS_0::UNCONSCIOUS
	STA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
@UNKNOWN52:
	REP #PROC_FLAGS::ACCUM8
	TXA
	CLC
	ADC #.SIZEOF(battler)
	TAX
	INY
@UNKNOWN53:
	CPY #BATTLER_COUNT
	BCC @UNKNOWN51
	JSL UNKNOWN_C2F8F9
	LDA #$0002
	STA .LOWORD(UNKNOWN_7EAA0E)
@UNKNOWN54:
	LDX $02
	LDA a:battler::npc_id,X
	AND #$00FF
	CMP #ENEMY::TINY_LIL_GHOST
	BNEL @UNKNOWN62
	LDY #$0000
	STY $22
	BRA @UNKNOWN58
@UNKNOWN56:
	TYA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN57
	LDA .LOWORD(BATTLERS_TABLE)+battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN57
	TXA
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + battler::afflictions
	TAX
	INX
	LDA a:.LOWORD(RAM),X ; STATUS_GROUP::PERSISTENT_HARDHEAL
	AND #$00FF
	CMP #$0002
	BNE @UNKNOWN57
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	STA a:.LOWORD(RAM),X
	BRA @UNKNOWN61
@UNKNOWN57:
	LDY $22
	INY
	STY $22
@UNKNOWN58:
	CPY #TOTAL_PARTY_COUNT
	BCC @UNKNOWN56
	BRA @UNKNOWN61
@UNKNOWN59:
	REP #PROC_FLAGS::ACCUM8
	TYA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN60
	LDA .LOWORD(BATTLERS_TABLE)+battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN60
	TXA
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + battler::afflictions
	TAX
	LDA a:STATUS_GROUP::PERSISTENT_HARDHEAL,X
	AND #$00FF
	CMP #STATUS_1::POSSESSED
	BNE @UNKNOWN60
	LDX #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 6)
	LDA #ENEMY::TINY_LIL_GHOST
	JSL BATTLE_INIT_ENEMY_STATS
	SEP #PROC_FLAGS::ACCUM8
	LDA #ENEMY::TINY_LIL_GHOST
	STA .LOWORD(BATTLERS_TABLE)+(TOTAL_PARTY_COUNT)*.SIZEOF(battler)+battler::npc_id
	LDA #$0001
	STA .LOWORD(BATTLERS_TABLE)+(TOTAL_PARTY_COUNT)*.SIZEOF(battler)+battler::unknown13
@UNKNOWN60:
	LDY $22
	INY
	STY $22
@UNKNOWN61:
	LDY $22
	CPY #TOTAL_PARTY_COUNT
	BCC @UNKNOWN59
@UNKNOWN62:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
