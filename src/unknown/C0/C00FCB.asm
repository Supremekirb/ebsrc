
UNKNOWN_C00FCB: ;$C00FCB
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 34
	TXY
	STY $20
	STA $04
	LDA DEBUG
	BEQ @UNKNOWN0
	TYX
	LDA $04
	JSL UNKNOWN_EFE07C
@UNKNOWN0:
	LDA #$0080
	JSL SBRK
	STA $1E
	CLC
	ADC #$0040
	STA $1C
	LDY $20
	TYA
	DEC
	STA $20
	LDA $04
	LSR
	LSR
	AND #$000F
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7EF000)
	STA $1A
	LDA $04
	AND #$0003
	PHA
	LDA $20
	AND #$0003
	ASL
	ASL
	STA $02
	LDA $20
	LSR
	LSR
	AND #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA ($1A),Y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	PLY
	STY $02
	CLC
	ADC $02
	TAY
	STY $18
	LDA $20
	AND #$001F
	TAX
	STX $16
	LDA #$0000
	STA $02
	STA $14
	BRA @UNKNOWN5
@UNKNOWN1:
	LDA $20
	AND #$0003
	BNE @UNKNOWN2
	LDA $04
	AND #$0003
	STA $02
	LDA $20
	LSR
	LSR
	AND #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA ($1A),Y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	TAY
	STY $18
@UNKNOWN2:
	TYA
	ASL
	TAX
	LDA UNKNOWN_7F8000,X
	STA $12
	LDX $16
	TXA
	ASL
	TAY
	LDA $12
	STA ($1E),Y
	LDA $12
	AND #$03FF
	CMP #$0180
	BCS @UNKNOWN3
	LDA $12
	ORA #$2000
	STA $12
	BRA @UNKNOWN4
@UNKNOWN3:
	STZ $12
@UNKNOWN4:
	TXA
	ASL
	TAY
	LDA $12
	STA ($1C),Y
	LDY $18
	INY
	INY
	INY
	INY
	STY $18
	INX
	TXA
	AND #$001F
	TAX
	STX $16
	LDA $20
	INC
	STA $20
	LDA $14
	STA $02
	INC $02
	LDA $02
	STA $14
@UNKNOWN5:
	LDA $02
	CMP #MAP_RESOLUTION_HEIGHT
	BCCL @UNKNOWN1
	LDA $04
	AND #$003F
	STA $02
	CMP #$001F
	BGT @UNKNOWN8
	LDA $1E
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	COPY_TO_VRAM1OFFSET $06, $02, $40, $3800, $1B
	.A16
	LDA $1C
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	COPY_TO_VRAM1OFFSET $06, $02, $40, $5800, $1B
	.A16
	BRA @UNKNOWN9
@UNKNOWN8:
	LDA $02
	AND #$001F
	STA $02
	LDA $1E
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	COPY_TO_VRAM1OFFSET $06, $02, $40, $3C00, $1B
	.A16
	LDA $1C
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	COPY_TO_VRAM1OFFSET $06, $02, $40, $5C00, $1B
	.A16
@UNKNOWN9:
	PLD
	RTS
