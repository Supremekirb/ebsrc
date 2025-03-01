
;A: current target
CALC_DAMAGE: ;$C27EAF
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STX $04
	TAY
	STY $1A
	STZ $18
	LDA $04
	BNE @UNKNOWN0
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_KIKANAI
	LDA #$0000
	JMP @RETURN
@UNKNOWN0:
	LDA __BSS_START__ + battler::ally_or_enemy,Y
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN2
	LDA __BSS_START__ + battler::id,Y
	CMP #ENEMY::GIYGAS_2
	BNE @UNKNOWN2
	LDA #$0001
	STA $18
	LDA CURRENT_TARGET
	STA $16
@UNKNOWN1:
	JSL RAND
	AND #$0003
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)
	TAX
	STX CURRENT_TARGET
	LDA __BSS_START__ + battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN1
	LDA __BSS_START__ + battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN1
	LDA __BSS_START__ + battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	AND #$00FF
	TAX
	CPX #STATUS_0::UNCONSCIOUS
	BEQ @UNKNOWN1
	CPX #STATUS_0::DIAMONDIZED
	BEQ @UNKNOWN1
	JSL FIX_TARGET_NAME
	LDY CURRENT_TARGET
	STY $1A
	LDA #$0010
	STA UNKNOWN_7EADA8
	LDA #SFX::REFLECT_DAMAGE
	JSL PLAY_SOUND
	LDA #1*HALF_OF_A_SECOND
	JSR WAIT
@UNKNOWN2:
	LDY $1A
	LDA __BSS_START__ + battler::hp_target,Y
	STA $02
	LDA __BSS_START__ + battler::ally_or_enemy,Y
	AND #$00FF
	BEQ @UNKNOWN3
	LDA __BSS_START__ + battler::id,Y
	CMP #ENEMY::MASTER_BELCH_1
	BEQ @UNKNOWN4
	CMP #ENEMY::MASTER_BELCH_3
	BEQ @UNKNOWN4
	CMP #ENEMY::GIYGAS_2
	BEQ @UNKNOWN4
	CMP #ENEMY::GIYGAS_3
	BEQ @UNKNOWN4
	CMP #ENEMY::GIYGAS_5
	BEQ @UNKNOWN4
	CMP #ENEMY::GIYGAS_6
	BEQ @UNKNOWN4
@UNKNOWN3:
	LDX $04
	TYA
	JSR REDUCE_HP
@UNKNOWN4:
	LDY $1A
	LDA __BSS_START__ + battler::ally_or_enemy,Y
	AND #$00FF
	BNE @UNKNOWN8
	LDA __BSS_START__ + battler::hp_target,Y
	BNE @UNKNOWN7
	LDA $02
	CMP #$0001
	BLTEQ @UNKNOWN7
	LDX CURRENT_ATTACKER
	LDA __BSS_START__ + battler::guts,X
	CMP #GUTS_FLOOR_FOR_SMAAAASH_CHANCE
	BCS @UNKNOWN5
	LDX #GUTS_FLOOR_FOR_SMAAAASH_CHANCE
	BRA @UNKNOWN6
@UNKNOWN5:
	TAX
@UNKNOWN6:
	TXA
	JSR SUCCESS_500
	CMP #$0000
	BEQ @UNKNOWN7
	LDX #$0001
	LDY $1A
	TYA
	JSR SET_HP
@UNKNOWN7:
	LDA UNKNOWN_7EAA90
	BEQ @UNKNOWN8
	LDA #$0001
	JSL COUNT_CHARS
	CMP #$0001
	BNE @UNKNOWN8
	LDA #$0000
	JSL COUNT_CHARS
	CMP #$0001
	BNE @UNKNOWN8
	LDX #$0001
	LDY $1A
	TYA
	JSR SET_HP
@UNKNOWN8:
	LDY $1A
	LDA __BSS_START__ + battler::ally_or_enemy,Y
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN12
	LDA __BSS_START__ + battler::id,Y
	CMP #ENEMY::GIYGAS_3
	BEQ @UNKNOWN9
	CMP #ENEMY::GIYGAS_4
	BEQ @UNKNOWN9
	CMP #ENEMY::GIYGAS_5
	BEQ @UNKNOWN9
	CMP #ENEMY::GIYGAS_6
	BNE @UNKNOWN10
@UNKNOWN9:
	LDA #$0010
	STA UNKNOWN_7EADAA
@UNKNOWN10:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0015
	STA __BSS_START__ + 72,Y
	REP #PROC_FLAGS::ACCUM8
	LDA UNKNOWN_7EAA8E
	BEQ @UNKNOWN11
	LOADPTR MSG_BTL_DAMAGE_SMASH_M, $0E
	MOVE_INT1632 $04, $06
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	STZ UNKNOWN_7EAA8E
	JMP @UNKNOWN20
@UNKNOWN11:
	LOADPTR MSG_BTL_DAMAGE_M, $0E
	MOVE_INT1632 $04, $06
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	JMP @UNKNOWN20
@UNKNOWN12:
	LDA __BSS_START__ + battler::npc_id,Y
	AND #$00FF
	BNE @UNKNOWN16
	LDA HP_PP_BOX_BLINK_DURATION
	BNE @UNKNOWN16
	LDA #$0015
	STA HP_PP_BOX_BLINK_DURATION
	LDX #$0000
	BRA @UNKNOWN15
@UNKNOWN13:
	LDA __BSS_START__ + battler::id,Y
	STA $02
	LDA GAME_STATE + game_state::party_members,X
	AND #$00FF
	CMP $02
	BNE @UNKNOWN14
	STX HP_PP_BOX_BLINK_TARGET
	BRA @UNKNOWN16
@UNKNOWN14:
	INX
@UNKNOWN15:
	CPX #$0006
	BCC @UNKNOWN13
@UNKNOWN16:
	LDA __BSS_START__ + battler::hp_target,Y
	BNE @TARGET_SURVIVED
	LDA #DAMAGE_TAKEN_SCREEN_SHAKE_DURATION_MORTAL
	STA VERTICAL_SHAKE_DURATION
	LDA #DAMAGE_TAKEN_SCREEN_SHAKE_DURATION_MORTAL_HOLD
	STA VERTICAL_SHAKE_HOLD_DURATION
	LOADPTR MSG_BTL_DAMAGE_TO_DEATH, $0E
	MOVE_INT1632 $04, $06
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	BRA @UNKNOWN19
@TARGET_SURVIVED:
	LDA UNKNOWN_7EAA8E
	BEQ @UNKNOWN18
	LDA #DAMAGE_TAKEN_SCREEN_SHAKE_DURATION_REGULAR
	STA VERTICAL_SHAKE_DURATION
	LOADPTR MSG_BTL_DAMAGE_SMASH, $0E
	MOVE_INT1632 $04, $06
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	STZ VERTICAL_SHAKE_HOLD_DURATION
	STZ UNKNOWN_7EAA8E
	BRA @UNKNOWN19
@UNKNOWN18:
	LDA #DAMAGE_TAKEN_SCREEN_SHAKE_DURATION_REGULAR_UNKNOWN
	STA VERTICAL_SHAKE_DURATION
	LOADPTR MSG_BTL_DAMAGE, $0E
	MOVE_INT1632 $04, $06
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	STZ VERTICAL_SHAKE_HOLD_DURATION
@UNKNOWN19:
	LDA #$0028
	STA UNKNOWN_7EAD90
@UNKNOWN20:
	LDA $18
	BEQ @UNKNOWN21
	LDA $16
	STA CURRENT_TARGET
	JSL FIX_TARGET_NAME
@UNKNOWN21:
	LDA #$0001
@RETURN:
	PLD
	RTS
