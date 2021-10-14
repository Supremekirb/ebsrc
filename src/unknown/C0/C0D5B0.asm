
UNKNOWN_C0D5B0: ;$C0D5B0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	LDA .LOWORD(BATTLE_DEBUG)
	BEQ @UNKNOWN0
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN0:
	LDA .LOWORD(UNKNOWN_7E5DC2)
	BEQ @UNKNOWN1
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN1:
	LDA .LOWORD(CURRENT_ENTITY_SLOT)
	STA $02
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BEQ @UNKNOWN2
	LDA $02
	CMP .LOWORD(TOUCHED_ENEMY)
	BEQ @UNKNOWN8
@UNKNOWN2:
	LDA .LOWORD(GAME_STATE) + game_state::unknownB0
	CMP #$0002
	BNE @UNKNOWN3
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN3:
	LDA .LOWORD(MISC_DEBUG_FLAGS)
	AND #$0002
	BEQ @UNKNOWN4
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN4:
	LDA .LOWORD(GAME_STATE)+game_state::walking_style
	CMP #WALKING_STYLE::ESCALATOR
	BNE @UNKNOWN5
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN5:
	LDA .LOWORD(UNKNOWN_7E5D58)
	BEQ @UNKNOWN6
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN6:
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BEQ @UNKNOWN7
	LDA $02
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7E2E3E),X
	BEQ @UNKNOWN8
@UNKNOWN7:
	JSL UNKNOWN_C0D15C
	CMP #$0000
	BNE @UNKNOWN8
	LDA #$0000
	JMP @UNKNOWN25
@UNKNOWN8:
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BNE @UNKNOWN9
	LDA .LOWORD(BATTLE_SWIRL_FLAG)
	BNE @UNKNOWN9
	LDA $02
	ASL
	TAX
	LDA .LOWORD(ENTITY_ENEMY_ID),X
	CMP #ENEMY::MAGIC_BUTTERFLY
	BNE @UNKNOWN9
	LDA #$0001
	JMP @UNKNOWN25
@UNKNOWN9:
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BNE @UNKNOWN15
	LDA .LOWORD(BATTLE_SWIRL_FLAG)
	BNE @UNKNOWN15
	LDA #$0001
	STA .LOWORD(BATTLE_SWIRL_FLAG)
	JSL UNKNOWN_C0D4DE
	LDA $02
	CMP .LOWORD(ENTITY_COLLIDED_OBJECTS)+46
	BNE @UNKNOWN10
	LDA #$0018
	STA .LOWORD(UNKNOWN_7E4DB8)
	BRA @UNKNOWN11
@UNKNOWN10:
	LDA $02
	ASL
	TAX
	LDA .LOWORD(ENTITY_COLLIDED_OBJECTS),X
	STA .LOWORD(UNKNOWN_7E4DB8)
@UNKNOWN11:
	LDA $02
	STA .LOWORD(TOUCHED_ENEMY)
	LDA #$0000
	STA $14
	BRA @UNKNOWN14
@UNKNOWN12:
	CMP #$0017
	BEQ @UNKNOWN13
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA a:.LOWORD(RAM),X
@UNKNOWN13:
	LDA $14
	INC
	STA $14
@UNKNOWN14:
	CMP #$001E
	BCC @UNKNOWN12
	JSL UNKNOWN_C04A88
	LDA #$0001
	JMP @UNKNOWN25
@UNKNOWN15:
	LDA $02
	ASL
	TAX
	LDA #ENTITY_COLLISION_DISABLED
	STA .LOWORD(ENTITY_COLLIDED_OBJECTS),X
	STZ $12
	LDA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
	BEQL @UNKNOWN24
	LDA $02
	CMP .LOWORD(TOUCHED_ENEMY)
	BNE @UNKNOWN17
	TXA
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA a:.LOWORD(RAM),X
	LDA #$0001
	STA $12
	JMP @UNKNOWN24
@UNKNOWN17:
	LDA .LOWORD(ENTITY_ENEMY_ID),X
	STA $04
	LDY #$0000
	STZ $12
	TYA
	STA $10
	BRA @UNKNOWN20
@UNKNOWN18:
	ASL
	TAX
	LDA $04
	CMP .LOWORD(UNKNOWN_7E4A7C),X
	BNE @UNKNOWN19
	TXA
	CLC
	ADC #.LOWORD(UNKNOWN_7E4A84)
	TAX
	LDA a:.LOWORD(RAM),X
	STA $0E
	BEQ @UNKNOWN19
	LDA $0E
	DEC
	STA a:.LOWORD(RAM),X
	LDA #$0001
	STA $12
	LDA $02
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA a:.LOWORD(RAM),X
	LDA .LOWORD(ENEMIES_IN_BATTLE)
	ASL
	TAX
	LDA $04
	STA .LOWORD(UNKNOWN_7E9F8C),X
	INC .LOWORD(ENEMIES_IN_BATTLE)
@UNKNOWN19:
	LDA $10
	ASL
	TAX
	TYA
	CLC
	ADC .LOWORD(UNKNOWN_7E4A84),X
	TAY
	LDA $10
	INC
	STA $10
@UNKNOWN20:
	CMP #$0004
	BNE @UNKNOWN18
	CPY #$0000
	BNE @UNKNOWN24
	JSL UNKNOWN_C2E9C8
	CMP #$0000
	BNE @UNKNOWN24
	LDA #$0000
	STA $14
	BRA @UNKNOWN23
@UNKNOWN21:
	CMP #$0017
	BEQ @UNKNOWN22
	ASL
	CLC
	ADC #.LOWORD(ENTITY_TICK_CALLBACK_HIGH)
	TAX
	LDA a:.LOWORD(RAM),X
	ORA #OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED
	STA a:.LOWORD(RAM),X
@UNKNOWN22:
	LDA $14
	INC
	STA $14
@UNKNOWN23:
	CMP #$001E
	BCC @UNKNOWN21
	LDA #$0001
	STA .LOWORD(BATTLE_SWIRL_COUNTDOWN)
@UNKNOWN24:
	LDA $12
@UNKNOWN25:
	PLD
	RTL
