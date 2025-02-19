
SMAAAASH: ;$C283F8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	STZ UNKNOWN_7EAA8E
	LDX CURRENT_ATTACKER
	LDA __BSS_START__ + battler::guts,X
	STA $12
	LDX CURRENT_ATTACKER
	LDA __BSS_START__ + battler::ally_or_enemy,X
	AND #$00FF
	BNE @BYPASS_MINIMUM_GUTS
	LDA $12
	CMP #GUTS_FLOOR_FOR_SMAAAASH_CHANCE
	BCS @BYPASS_MINIMUM_GUTS
	LDA #GUTS_FLOOR_FOR_SMAAAASH_CHANCE
	STA $12
@BYPASS_MINIMUM_GUTS:
	LDA $12
	JSR SUCCESS_500
	CMP #$0000
	BEQL @FAILED
	LDX CURRENT_ATTACKER
	LDA __BSS_START__ + battler::ally_or_enemy,X
	AND #$00FF
	BNE @ATTACKER_IS_ENEMY
	LDA #SMAAAASH_FLASH_DURATION
	STA GREEN_FLASH_DURATION
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_SMASH_PLAYER
	BRA @SKIP_ENEMY_FLASH
@ATTACKER_IS_ENEMY:
	LDA #SMAAAASH_FLASH_DURATION
	STA RED_FLASH_DURATION
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_SMASH_MONSTER
@SKIP_ENEMY_FLASH:
	LDX CURRENT_TARGET
	LDA __BSS_START__ + battler::afflictions + STATUS_GROUP::SHIELD,X
	AND #$00FF
	TAX
	CPX #STATUS_6::SHIELD_POWER
	BEQ @TARGET_HAS_SHIELD
	CPX #STATUS_6::SHIELD
	BNE @TARGET_DOES_NOT_HAVE_SHIELD
@TARGET_HAS_SHIELD:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	LDX CURRENT_TARGET
	STA __BSS_START__ + battler::shield_hp,X
@TARGET_DOES_NOT_HAVE_SHIELD:
	REP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA UNKNOWN_7EAA8E
	LDX #$00FF
	STX $12
	LDX CURRENT_ATTACKER
	LDA __BSS_START__ + battler::offense,X
	ASL
	ASL
	LDX CURRENT_TARGET
	SEC
	SBC __BSS_START__ + battler::defense,X
	LDX $12
	JSR CALC_RESIST_DAMAGE
	LDA #$0001
	BRA @RETURN
@FAILED:
	LDA #$0000
@RETURN:
	PLD
	RTS
