
UNKNOWN_C45C90: ;$C45C90
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STA $04
	MOVE_INT $24, $0A
@UNKNOWN0:
	LDA DMA_TRANSFER_FLAG
	BNE @UNKNOWN0
	LDY #$0008
	LDA UNKNOWN_7E9E23
	JSL MODULUS16
	STA $02
	LDA UNKNOWN_7E9E25
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7E9D23)
	STA $14
	MOVE_INT $0A, $06
	LDY #$0000
	STY $12
	BRA @UNKNOWN2
@UNKNOWN1:
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	EOR #$00FF
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $02
	SEP #PROC_FLAGS::ACCUM8
	STA $01
	SEP #PROC_FLAGS::INDEX8
	LDY $01
	LDA $00
	JSL ASR8_UNKNOWN1
	EOR #$00FF
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	PHA
	REP #PROC_FLAGS::INDEX8
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	AND $00
	PLX
	STA __BSS_START__,X
	LDY #$0100
	LDA [$06],Y
	EOR #$00FF
	STA $00
	SEP #PROC_FLAGS::INDEX8
	LDY $01
	LDA $00
	JSL ASR8_UNKNOWN1
	EOR #$00FF
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $14
	CLC
	ADC #$0010
	REP #PROC_FLAGS::INDEX8
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	AND $00
	STA __BSS_START__,X
	LDY $12
	INY
	STY $12
	REP #PROC_FLAGS::ACCUM8
	INC $06
	LDA $14
	INC
	STA $14
@UNKNOWN2:
	CPY #$0010
	BCC @UNKNOWN1
	LDA $04
	CLC
	ADC UNKNOWN_7E9E23
	STA UNKNOWN_7E9E23
	CMP #$0040
	BCC @UNKNOWN3
	SEC
	SBC #$0040
	STA UNKNOWN_7E9E23
@UNKNOWN3:
	LDA UNKNOWN_7E9E23
	LSR
	LSR
	LSR
	STA $10
	CMP UNKNOWN_7E9E25
	BEQ @UNKNOWN6
	STA UNKNOWN_7E9E25
	LDA #$0008
	SEC
	SBC $02
	TAY
	STY $12
	LDA $10
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7E9D23)
	TAX
	STX $14
	MOVE_INT $0A, $06
	LDA #$0000
	STA $0E
	BRA @UNKNOWN5
@UNKNOWN4:
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	EOR #$00FF
	STA $00
	LDY $12
	SEP #PROC_FLAGS::INDEX8
	STY $01
	LDA $00
	JSL ASL16_ENTRY2
	EOR #$00FF
	STA $00
	REP #PROC_FLAGS::INDEX8
	LDX $14
	STA __BSS_START__,X
	LDY #$0100
	LDA [$06],Y
	EOR #$00FF
	STA $00
	SEP #PROC_FLAGS::INDEX8
	LDY $01
	LDA $00
	JSL ASL16_ENTRY2
	EOR #$00FF
	STA $00
	REP #PROC_FLAGS::INDEX8
	LDX $14
	STA __BSS_START__+16,X
	REP #PROC_FLAGS::ACCUM8
	LDA $0E
	INC
	STA $0E
	INC $06
	INX
	STX $14
@UNKNOWN5:
	CMP #$0010
	BCC @UNKNOWN4
@UNKNOWN6:
	PLD
	RTL
