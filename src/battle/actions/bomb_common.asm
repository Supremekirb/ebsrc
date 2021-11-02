
BOMB_COMMON: ;$C2A658
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 28
	STA $1A
	STZ $18
	LDA #$0000
	STA $04
	LDA $1A
	JSR a:.LOWORD(FIFTY_PERCENT_VARIANCE)
	LDX #$00FF
	JSR a:.LOWORD(CALC_RESIST_DAMAGE)
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNE @UNKNOWN8
	LDX #$0000
	STX $16
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:.LOWORD(RAM),X
	STA $02
	LDX $16
	LDA .LOWORD(GAME_STATE) + game_state::party_members,X
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN2
	INX
	STX $16
@UNKNOWN1:
	CPX #$0006
	BCC @UNKNOWN0
@UNKNOWN2:
	CPX #$0000
	BEQ @UNKNOWN3
	TXA
	DEC
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)
	STA $04
@UNKNOWN3:
	LDA .LOWORD(GAME_STATE) + game_state::party_members + 1,X
	AND #$00FF
	STA $14
	STA $02
	LDA #$0001
	CLC
	SBC $02
	JUMPGTS @UNKNOWN18
	LDA $14
	CLC
	SBC #$0004
	JUMPGTS @UNKNOWN18
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + .SIZEOF(battler)
	STA $18
	JMP @UNKNOWN18
@UNKNOWN8:
	LDA #$0008
	STA $02
	STA $14
	JMP @UNKNOWN17
@UNKNOWN9:
	LDA $02
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	STX $12
	TXA
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)
	TAY
	STY $10
	CPY .LOWORD(CURRENT_TARGET)
	BEQL @UNKNOWN16
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,X
	AND #$00FF
	CMP #$0001
	BNEL @UNKNOWN16
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(BATTLERS_TABLE) + battler::row,X
	LDX .LOWORD(CURRENT_TARGET)
	CMP a:battler::row,X
	BNEL @UNKNOWN16
	LDX $12
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,X
	STA $01
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::sprite_x,X
	STA $00
	LDA $01
	CMP $00
	BCS @UNKNOWN14
	LDX .LOWORD(CURRENT_TARGET)
	REP #PROC_FLAGS::ACCUM8
	LDA a:battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $0E
	LDX $12
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	CLC
	ADC $0E
	ASL
	ASL
	CLC
	ADC #$0008
	STA $02
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	SEC
	SBC $01
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN13
	BCS @UNKNOWN16
@UNKNOWN13:
	LDY $10
	STY $04
	BRA @UNKNOWN16
@UNKNOWN14:
	LDX .LOWORD(CURRENT_TARGET)
	REP #PROC_FLAGS::ACCUM8
	LDA a:battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $0E
	LDX $12
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	CLC
	ADC $0E
	ASL
	ASL
	CLC
	ADC #$0008
	STA $02
	SEP #PROC_FLAGS::ACCUM8
	LDA $01
	SEC
	SBC $00
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP $02
	BEQ @UNKNOWN15
	BCS @UNKNOWN16
@UNKNOWN15:
	LDY $10
	STY $18
@UNKNOWN16:
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	STA $02
	INC $02
	LDA $02
	STA $14
@UNKNOWN17:
	LDA $02
	CMP #$0020
	BCCL @UNKNOWN9
@UNKNOWN18:
	LDY .LOWORD(CURRENT_TARGET)
	STY $14
	LDA $04
	BEQ @UNKNOWN19
	LDA $04
	STA .LOWORD(CURRENT_TARGET)
	JSL FIX_TARGET_NAME
	LDA $1A
	LSR
	JSR a:.LOWORD(FIFTY_PERCENT_VARIANCE)
	LDX #$00FF
	JSR a:.LOWORD(CALC_RESIST_DAMAGE)
@UNKNOWN19:
	LDA $18
	BEQ @UNKNOWN20
	LDA $18
	STA .LOWORD(CURRENT_TARGET)
	JSL FIX_TARGET_NAME
	LDA $1A
	LSR
	JSR a:.LOWORD(FIFTY_PERCENT_VARIANCE)
	LDX #$00FF
	JSR a:.LOWORD(CALC_RESIST_DAMAGE)
@UNKNOWN20:
	LDY $14
	STY .LOWORD(CURRENT_TARGET)
	JSL FIX_TARGET_NAME
	PLD
	RTS
