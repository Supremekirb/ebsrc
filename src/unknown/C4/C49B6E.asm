
UNKNOWN_C49B6E: ;$C49B6E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	JSR a:.LOWORD(UNKNOWN_C4984B)
	LDY #$01A0
	LDA .LOWORD(UNKNOWN_7E9F2D)
	JSL MULT16
	STA $14
	CLC
	ADC #$04E0
	CMP #$3400
	BEQ @UNKNOWN0
	BCS @UNKNOWN1
@UNKNOWN0:
	JMP @UNKNOWN3
@UNKNOWN1:
	LDA $14
	STA $02
	LDA #$3400
	SEC
	SBC $02
	STA $12
	BEQ @UNKNOWN2
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA .LOWORD(UNKNOWN_7E9F2D)
	LDY #$00D0
	JSL MULT168
	CLC
	ADC #$6150
	TAY
	LDA $12
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
@UNKNOWN2:
	LDY #$01A0
	LDA .LOWORD(UNKNOWN_7E9F2D)
	JSL MULT16
	.A16
	STA $14
	CLC
	ADC #$04E0
	SEC
	SBC #$3400
	TAX
	BEQ @UNKNOWN4
	LDA $14
	STA $02
	LDA #$6892
	SEC
	SBC $02
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDY #$6150
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	BRA @UNKNOWN4
@UNKNOWN3:
	.A16
	LDA #.LOWORD(UNKNOWN_7E3492)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA .LOWORD(UNKNOWN_7E9F2D)
	LDY #$00D0
	JSL MULT168
	CLC
	ADC #$6150
	TAY
	LDX #$04E0
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
@UNKNOWN4:
	.A16
	LDA #$FFFF
	STA .LOWORD(UNKNOWN_7E3C1E)
	STZ .LOWORD(UNKNOWN_7E3C20)
	JSL WAIT_UNTIL_NEXT_FRAME
	PLD
	RTL
