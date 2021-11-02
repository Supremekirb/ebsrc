
UNKNOWN_C2F121: ;$C2F121
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 37
	STZ .LOWORD(UNKNOWN_7EAEF2)
	STZ .LOWORD(UNKNOWN_7EAEF0)
	LDX #$0008
	STX $23
	JMP @UNKNOWN10
@UNKNOWN0:
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAY
	STY $21
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,Y
	AND #$00FF
	BEQL @UNKNOWN9
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,Y
	AND #$00FF
	CMP #$0001
	BNEL @UNKNOWN9
	LDA .LOWORD(BATTLERS_TABLE),Y
	JSR a:.LOWORD(UNKNOWN_C2F09F)
	SEP #PROC_FLAGS::ACCUM8
	LDY $21
	STA .LOWORD(BATTLERS_TABLE)+battler::vram_sprite_index,Y
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(BATTLERS_TABLE)+battler::row,Y
	AND #$00FF
	STA $1F
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite,Y
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $02
	LDA $1F
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7EAEF0),X
	BEQ @UNKNOWN3
	INC $02
@UNKNOWN3:
	LDA $1F
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7EAEF0)
	TAY
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC $02
	CMP #$001E
	BEQ @UNKNOWN4
	BCS @UNKNOWN5
@UNKNOWN4:
	STA a:.LOWORD(RAM),Y
	BRA @UNKNOWN9
@UNKNOWN5:
	LDA #$0001
	SEC
	SBC $1F
	STA $21
	LDX $23
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	STA $02
	LDA $21
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7EAEF0),X
	BEQ @UNKNOWN6
	INC $02
@UNKNOWN6:
	LDA $21
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7EAEF0)
	TAY
	STY $1D
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC $02
	CMP #$001E
	BEQ @UNKNOWN7
	BCS @UNKNOWN8
@UNKNOWN7:
	LDX $23
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	LDA $21
	SEP #PROC_FLAGS::ACCUM8
	STA .LOWORD(BATTLERS_TABLE)+battler::row,X
	LDY $1D
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC $02
	STA a:.LOWORD(RAM),Y
	BRA @UNKNOWN9
@UNKNOWN8:
	LDA #$0000
	JMP @UNKNOWN60
@UNKNOWN9:
	LDX $23
	INX
	STX $23
@UNKNOWN10:
	CPX #$0020
	BCCL @UNKNOWN0
	;TODO: why 8?
	LDA .LOWORD(BATTLERS_TABLE)+8*.SIZEOF(battler)+16
	AND #$00FF
	STA $21
	LDA #$0020
	STA $1B
	STA $19
	LDX #$0008
	STX $1D
	JMP @UNKNOWN21
@UNKNOWN12:
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAY
	STY $1F
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,Y
	AND #$00FF
	BEQL @UNKNOWN20
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,Y
	AND #$00FF
	CMP #$0001
	BNEL @UNKNOWN20
	LDA .LOWORD(BATTLERS_TABLE)+16,Y
	AND #$00FF
	CMP $21
	BNEL @UNKNOWN20
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite,Y
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	LSR
	STA $17
	LDA $19
	CMP $1B
	BNE @UNKNOWN17
	LDA $19
	SEP #PROC_FLAGS::ACCUM8
	LDY $1F
	STA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,Y
	REP #PROC_FLAGS::ACCUM8
	LDA $19
	SEC
	SBC $17
	STA $19
	LDA $1B
	CLC
	ADC $17
	STA $1B
	JSR a:.LOWORD(RAND_LONG)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	AND #$0001
	BEQ @UNKNOWN16
	LDA $19
	STA $04
	STA $15
	JMP @UNKNOWN20
@UNKNOWN16:
	LDA $1B
	STA $04
	STA $15
	JMP @UNKNOWN20
@UNKNOWN17:
	LDA #$0020
	SEC
	SBC $19
	STA $1F
	LDA $1B
	SEC
	SBC #$0020
	STA $02
	LDA $1F
	CMP $02
	BCC @UNKNOWN18
	CMP $02
	BNE @UNKNOWN19
	JSR a:.LOWORD(RAND_LONG)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	AND #$0001
	BEQ @UNKNOWN19
@UNKNOWN18:
	LDA $17
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $19
	SEP #PROC_FLAGS::ACCUM8
	SEC
	SBC $00
	DEC
	STA $14
	LDX $1D
	REP #PROC_FLAGS::ACCUM8
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $14
	STA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	SEC
	SBC $17
	STA $19
	BRA @UNKNOWN20
@UNKNOWN19:
	LDA $17
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $1B
	SEP #PROC_FLAGS::ACCUM8
	CLC
	ADC $00
	INC
	STA $14
	LDX $1D
	REP #PROC_FLAGS::ACCUM8
	TXA
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $14
	STA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CLC
	ADC $17
	STA $1B
@UNKNOWN20:
	LDX $1D
	INX
	STX $1D
@UNKNOWN21:
	CPX #$0020
	BCCL @UNKNOWN12
	LDA $15
	STA $04
	LDY $04
	STY $23
	TYX
	STX $15
	LDA #$0008
	STA $02
	STA $1D
	JMP @UNKNOWN32
@UNKNOWN23:
	LDA $02
	LDY #.SIZEOF(battler)
	JSL MULT168
	STA $04
	LDX $04
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQL @UNKNOWN31
	LDX $04
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,X
	AND #$00FF
	CMP #$0001
	BNEL @UNKNOWN31
	LDX $04
	LDA .LOWORD(BATTLERS_TABLE)+16,X
	AND #$00FF
	CMP $21
	BEQL @UNKNOWN31
	LDX $04
	LDA .LOWORD(BATTLERS_TABLE)+battler::sprite,X
	JSR a:.LOWORD(GET_BATTLE_SPRITE_WIDTH)
	LSR
	STA $12
	LDY $23
	STY $02
	LDX $15
	TXA
	CMP $02
	BNE @UNKNOWN27
	TXA
	SEP #PROC_FLAGS::ACCUM8
	LDX $04
	STA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,X
	LDX $15
	REP #PROC_FLAGS::ACCUM8
	TXA
	SEC
	SBC $12
	TAX
	STX $15
	TYA
	CLC
	ADC $12
	TAY
	STY $23
	JMP @UNKNOWN31
@UNKNOWN27:
	CPY #$0020
	BCC @UNKNOWN30
	BEQ @UNKNOWN30
	CPX #$0020
	BEQ @UNKNOWN28
	BCS @UNKNOWN29
@UNKNOWN28:
	STX $04
	LDA #$0020
	SEC
	SBC $04
	STA $1F
	TYA
	SEC
	SBC #$0020
	STA $04
	LDA $1F
	CMP $04
	BCC @UNKNOWN29
	CMP $04
	BNE @UNKNOWN30
	JSR a:.LOWORD(RAND_LONG)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	AND #$0001
	BEQ @UNKNOWN30
@UNKNOWN29:
	LDA $12
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	LDX $15
	REP #PROC_FLAGS::ACCUM8
	TXA
	SEP #PROC_FLAGS::ACCUM8
	SEC
	SBC $00
	DEC
	STA $14
	REP #PROC_FLAGS::ACCUM8
	LDA $1D
	STA $02
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $14
	STA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	SEC
	SBC $12
	TAX
	STX $15
	BRA @UNKNOWN31
@UNKNOWN30:
	LDA $12
	SEP #PROC_FLAGS::ACCUM8
	STA $00
	LDY $23
	REP #PROC_FLAGS::ACCUM8
	TYA
	SEP #PROC_FLAGS::ACCUM8
	CLC
	ADC $00
	INC
	STA $14
	REP #PROC_FLAGS::ACCUM8
	LDA $1D
	STA $02
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA $14
	STA .LOWORD(BATTLERS_TABLE)+battler::sprite_x,X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CLC
	ADC $12
	TAY
	STY $23
@UNKNOWN31:
	LDA $1D
	STA $02
	INC $02
	LDA $02
	STA $1D
@UNKNOWN32:
	LDA $02
	CMP #$0020
	BCCL @UNKNOWN23
	LDA $21
	CMP #$0001
	BNE @UNKNOWN37
	LDY $23
	STY $02
	LDX $15
	TXA
	CMP $02
	BNE @UNKNOWN37
	LDA #$0008
	STA $02
	BRA @UNKNOWN36
@UNKNOWN34:
	LDA $02
	LDY #.SIZEOF(battler)
	JSL MULT168
	STA $21
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN35
	LDA $21
	TAX
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,X
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN35
	LDA $21
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(BATTLERS_TABLE)+battler::row,X
@UNKNOWN35:
	REP #PROC_FLAGS::ACCUM8
	INC $02
@UNKNOWN36:
	LDA $02
	CMP #$0020
	BCC @UNKNOWN34
@UNKNOWN37:
	LDX $15
	CPX $19
	BCS @UNKNOWN38
	STX $19
@UNKNOWN38:
	LDY $23
	CPY $1B
	BCC @UNKNOWN39
	BEQ @UNKNOWN39
	STY $1B
@UNKNOWN39:
	LDA $19
	CLC
	ADC $1B
	LSR
	STA $02
	LDA #$0020
	SEC
	SBC $02
	SEC
	SBC #$0010
	TAY
	STY $19
	LDA #$0008
	STA $17
	BRA @UNKNOWN43
@UNKNOWN40:
	LDY #.SIZEOF(battler)
	JSL MULT168
	TAX
	STX $12
	LDA .LOWORD(BATTLERS_TABLE)+battler::consciousness,X
	AND #$00FF
	BEQ @UNKNOWN42
	LDA .LOWORD(BATTLERS_TABLE)+battler::ally_or_enemy,X
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN42
	TXA
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + battler::sprite_x
	STA $02
	LDY $19
	SEP #PROC_FLAGS::INDEX8
	STY $00
	REP #PROC_FLAGS::INDEX8
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	CLC
	ADC $00
	ASL
	ASL
	ASL
	LDX $02
	STA a:.LOWORD(RAM),X
	LDX $12
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(BATTLERS_TABLE)+battler::row,X
	AND #$00FF
	BEQ @UNKNOWN41
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0080
	STA .LOWORD(BATTLERS_TABLE)+69,X
	BRA @UNKNOWN42
@UNKNOWN41:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0090
	STA .LOWORD(BATTLERS_TABLE)+69,X
@UNKNOWN42:
	REP #PROC_FLAGS::ACCUM8
	LDA $17
	INC
	STA $17
@UNKNOWN43:
	CMP #$0020
	BCC @UNKNOWN40
	LDA .LOWORD(CURRENT_BATTLE_GROUP)
	CMP #$01DB
	BNE @UNKNOWN44
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0080
	STA .LOWORD(BATTLERS_TABLE)+8*.SIZEOF(battler)+battler::sprite_x
	STA .LOWORD(BATTLERS_TABLE)+8*.SIZEOF(battler)+69
	LDA #$00C8
	STA .LOWORD(BATTLERS_TABLE)+9*.SIZEOF(battler)+battler::sprite_x
	LDA #$0090
	STA .LOWORD(BATTLERS_TABLE)+9*.SIZEOF(battler)+69
@UNKNOWN44:
	REP #PROC_FLAGS::ACCUM8
	STZ $1F
	LDA #$0000
	STA $04
	JMP @UNKNOWN57
@UNKNOWN45:
	.I16
	LDA $04
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 8)
	TAY
	STY $15
	LDA $04
	INC
	STA $19
	JMP @UNKNOWN55
@UNKNOWN46:
	.I16
	LDA $19
	LDY #.SIZEOF(battler)
	JSL MULT168
	CLC
	ADC #.LOWORD(BATTLERS_TABLE)+8*.SIZEOF(battler)
	STA $1B
	LDY $15
	LDA a:.LOWORD(RAM),Y
	CMP ($1B)
	BNEL @UNKNOWN54
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM)+11,Y
	LDY #$000B
	CMP ($1B),Y
	BCS @UNKNOWN48
	LDY $15
	LDA a:.LOWORD(RAM)+69,Y
	STA $00
	LDY #$0045
	LDA ($1B),Y
	STA $14
	STA $01
	LDA $00
	CMP $01
	BCC @UNKNOWN53
	LDA $14
	PHA
	LDA $00
	SEP #PROC_FLAGS::INDEX8
	PLX
	STX $00
	CMP $00
	BNE @UNKNOWN48
	REP #PROC_FLAGS::INDEX8
	LDY $15
	LDA a:.LOWORD(RAM)+68,Y
	LDY #$0044
	CMP ($1B),Y
	BEQ @UNKNOWN48
	BCS @UNKNOWN53
@UNKNOWN48:
	REP #PROC_FLAGS::INDEX8
	LDY $15
	LDA a:.LOWORD(RAM)+11,Y
	LDY #$000B
	CMP ($1B),Y
	BCS @UNKNOWN50
	JMP @UNKNOWN54
@UNKNOWN50:
	LDY $15
	LDA a:.LOWORD(RAM)+69,Y
	STA $00
	LDY #$0045
	LDA ($1B),Y
	STA $14
	STA $01
	LDA $00
	CMP $01
	BEQ @UNKNOWN51
	BCS @UNKNOWN53
@UNKNOWN51:
	LDA $14
	PHA
	LDA $00
	SEP #PROC_FLAGS::INDEX8
	PLX
	STX $00
	CMP $00
	BNEL @UNKNOWN54
	REP #PROC_FLAGS::INDEX8
	LDY $15
	LDA a:battler::sprite_x,Y
	LDY #$0044
	CMP ($1B),Y
	BCC @UNKNOWN53
	JMP @UNKNOWN54
@UNKNOWN53:
	REP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA $1F
	LDY $15
	TYA
	CLC
	ADC #$000B
	TAX
	STX $17
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	STA $12
	LDA $1B
	CLC
	ADC #$000B
	STA $02
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	LDX $17
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	LDA $12
	SEP #PROC_FLAGS::ACCUM8
	LDX $02
	STA a:.LOWORD(RAM),X
	STA $00
	LDX $17
	LDA a:.LOWORD(RAM),X
	CMP $00
	BCC @UNKNOWN54
	BEQ @UNKNOWN54
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(BATTLERS_TABLE) + ((BATTLER_COUNT - 1) * .SIZEOF(battler))
	STA $02
	TYA
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(battler)
	LDA $02
	JSL MEMCPY16
	LDA $1B
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(battler)
	LDY $15
	TYA
	JSL MEMCPY16
	LDA $02
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(battler)
	LDA $1B
	JSL MEMCPY16
@UNKNOWN54:
	REP #PROC_FLAGS::ACCUM8
	INC $19
@UNKNOWN55:
	LDA .LOWORD(ENEMIES_IN_BATTLE)
	CMP $19
	BCSL @UNKNOWN46
	INC $04
@UNKNOWN57:
	LDA .LOWORD(ENEMIES_IN_BATTLE)
	DEC
	STA $02
	LDA $04
	CMP $02
	BCCL @UNKNOWN45
	LDA $1F
	BNEL @UNKNOWN44
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00
	STA $0E
	REP #PROC_FLAGS::INDEX8
	LDX #.SIZEOF(battler)
	REP #PROC_FLAGS::ACCUM8
	LDA #.LOWORD(BATTLERS_TABLE) + 31 * .SIZEOF(battler)
	JSL MEMSET16
	LDA #$0000
@UNKNOWN60:
	PLD
	RTL
