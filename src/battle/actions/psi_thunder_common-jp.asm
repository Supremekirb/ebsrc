
PSI_THUNDER_COMMON: ;$C2966B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STX $1A
	STA $04
	LDY #$0000
	STY $18
	TYX
	STX $16
	BRA @UNKNOWN2
@UNKNOWN0:
	TXA
	JSL IS_CHAR_TARGETTED
	CMP #$0000
	BEQ @UNKNOWN1
	LDY $18
	INY
	STY $18
@UNKNOWN1:
	LDX $16
	INX
	STX $16
@UNKNOWN2:
	CPX #$0020
	BCC @UNKNOWN0
	LDY $18
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $02
	CMP #$0100
	BCC @UNKNOWN3
	LDA #$00FF
	STA $02
@UNKNOWN3:
	MOVE_INT BATTLER_TARGET_FLAGS, $06
	MOVE_INT $06, $12
	LDY #$0000
	STY $18
	JMP @UNKNOWN20
@UNKNOWN4:
	MOVE_INT $12, $06
	MOVE_INT $06, BATTLER_TARGET_FLAGS
	JSL REMOVE_STATUS_UNTARGETTABLE_TARGETS
	LDA #$0000
	STA $06
	LDA #$0000
	STA $08
	MOVE_INT BATTLER_TARGET_FLAGS, $0A
	CMP $08
	BNE @UNKNOWN5
	LDA $0A
	CMP $06
@UNKNOWN5:
	BEQL @UNKNOWN21
	MOVE_INT BATTLER_TARGET_FLAGS, $0A
	MOVE_INT $0A, $0E
	JSL RANDOM_TARGETTING
	MOVE_INT $06, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, BATTLER_TARGET_FLAGS
	LDX #$0000
	STX $16
	BRA @UNKNOWN8
@UNKNOWN7:
	TXA
	JSL IS_CHAR_TARGETTED
	CMP #$0000
	BNE @UNKNOWN9
	LDX $16
	INX
	STX $16
@UNKNOWN8:
	CPX #$0020
	BCC @UNKNOWN7
@UNKNOWN9:
	LDX $16
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)
	STA CURRENT_TARGET
	JSL FIX_TARGET_NAME
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	JSR SUCCESS_255
	.A16
	CMP #$0000
	BEQL @UNKNOWN18
	.A16
	LDA $04
	CMP #$0078
	BNE @UNKNOWN11
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_THUNDER_SMALL
	BRA @UNKNOWN13
@UNKNOWN11:
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_THUNDER_LARGE
	BRA @UNKNOWN13
@UNKNOWN12:
	JSL WINDOW_TICK
@UNKNOWN13:
	JSL UNKNOWN_C2EACF
	CMP #$0000
	BNE @UNKNOWN12
	LDX CURRENT_TARGET
	SEP #PROC_FLAGS::ACCUM8
	STZ a:battler::use_alt_spritemap,X
	LDX CURRENT_TARGET
	REP #PROC_FLAGS::ACCUM8
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNE @UNKNOWN14
	LDX #$0001
	STX $16
	LDX CURRENT_TARGET
	LDA a:battler::row,X
	AND #$00FF
	INC
	LDX $16
	JSL FIND_ITEM_IN_INVENTORY2
	CMP #$0000
	BEQ @UNKNOWN14
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_FRANKLIN_TURN
	LDA #$0001
	STA UNKNOWN_7EAA96
	JSR SWAP_ATTACKER_WITH_TARGET
@UNKNOWN14:
	LDX CURRENT_TARGET
	LDA a:battler::afflictions + STATUS_GROUP::SHIELD,X
	AND #$00FF
	TAX
	CPX #$0001
	BEQ @UNKNOWN15
	CPX #$0002
	BNE @UNKNOWN16
@UNKNOWN15:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	LDX CURRENT_TARGET
	STA a:battler::shield_hp,X
@UNKNOWN16:
	JSR PSI_SHIELD_NULLIFY
	.A16
	CMP #$0000
	BNE @UNKNOWN17
	LDA $04
	JSR FIFTY_PERCENT_VARIANCE
	LDX #$00FF
	JSR CALC_RESIST_DAMAGE
@UNKNOWN17:
	JSR WEAKEN_SHIELD
	BRA @UNKNOWN19
@UNKNOWN18:
	.A16
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_THUNDER_MISS_SE
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_KAMINARI_HAZURE
@UNKNOWN19:
	LDA #$0000
	JSL COUNT_CHARS
	CMP #$0000
	BEQ @UNKNOWN21
	LDA #$0001
	JSL COUNT_CHARS
	CMP #$0000
	BEQ @UNKNOWN21
	LDY $18
	INY
	STY $18
@UNKNOWN20:
	CPY $1A
	BCCL @UNKNOWN4
@UNKNOWN21:
	MOVE_INT_CONSTANT 0, BATTLER_TARGET_FLAGS
	PLD
	RTS
