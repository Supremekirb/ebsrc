
UNKNOWN_C4A7B0: ;$C4A7B0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 23
	LDA .LOWORD(UNKNOWN_7EAEC2)
	AND #$00FF
	BNE @UNKNOWN0
	JMP a:.LOWORD(@UNKNOWN34)
@UNKNOWN0:
	LDY #.LOWORD(UNKNOWN_7EAECC)
	MOVE_INT_CONSTANT NULL, $06
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $0A
	CMP $08
	BNE @UNKNOWN1
	LDA $0A
	CMP $06
@UNKNOWN1:
	BNE @UNKNOWN2
	JMP a:.LOWORD(@UNKNOWN19)
@UNKNOWN2:
	LDX #.LOWORD(UNKNOWN_7EAEC2)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	DEC
	STA .LOWORD(UNKNOWN_7EAEC2)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN3
	JMP a:.LOWORD(@UNKNOWN9)
@UNKNOWN3:
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $0A
	SEP #PROC_FLAGS::ACCUM8
	LDA [$0A]
	STA .LOWORD(UNKNOWN_7EAEC2)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BNE @UNKNOWN4
	MOVE_INT_YPTRDEST $06, a:.LOWORD(RAM)
	JMP a:.LOWORD(@UNKNOWN34)
@UNKNOWN4:
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$0002
	LDA [$06],Y
	CMP #$8000
	BEQ @UNKNOWN5
	STA .LOWORD(UNKNOWN_7EAED0)
@UNKNOWN5:
	MOVE_INT .LOWORD(UNKNOWN_7EAECC), $06
	LDY #$0004
	LDA [$06],Y
	CMP #$8000
	BEQ @UNKNOWN6
	STA .LOWORD(UNKNOWN_7EAED2)
@UNKNOWN6:
	MOVE_INT .LOWORD(UNKNOWN_7EAECC), $06
	LDY #$0006
	LDA [$06],Y
	CMP #$8000
	BEQ @UNKNOWN7
	STA .LOWORD(UNKNOWN_7EAED4)
@UNKNOWN7:
	MOVE_INT .LOWORD(UNKNOWN_7EAECC), $06
	LDY #$0008
	LDA [$06],Y
	CMP #$8000
	BEQ @UNKNOWN8
	STA .LOWORD(UNKNOWN_7EAED6)
@UNKNOWN8:
	LDY #.LOWORD(UNKNOWN_7EAECC)
	STY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$000A
	LDA [$06],Y
	STA .LOWORD(UNKNOWN_7EAED8)
	LDY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$000C
	LDA [$06],Y
	STA .LOWORD(UNKNOWN_7EAEDA)
	LDY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$000E
	LDA [$06],Y
	STA .LOWORD(UNKNOWN_7EAEDC)
	LDY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$0010
	LDA [$06],Y
	STA .LOWORD(UNKNOWN_7EAEDE)
	LDY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$0012
	LDA [$06],Y
	STA .LOWORD(UNKNOWN_7EAEE0)
	LDY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDY #$0014
	LDA [$06],Y
	STA .LOWORD(UNKNOWN_7EAEE2)
	LDY $15
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $06
	LDA #$0016
	CLC
	ADC $06
	STA $06
	STA a:.LOWORD(RAM),Y
	LDA $08
	STA a:.LOWORD(RAM)+2,Y
@UNKNOWN9:
	LDX #.LOWORD(UNKNOWN_7EAED0)
	LDA a:.LOWORD(RAM),X
	CLC
	ADC .LOWORD(UNKNOWN_7EAED8)
	STA a:.LOWORD(RAM),X
	LDX #.LOWORD(UNKNOWN_7EAED2)
	LDA a:.LOWORD(RAM),X
	CLC
	ADC .LOWORD(UNKNOWN_7EAEDA)
	STA a:.LOWORD(RAM),X
	LDX #.LOWORD(UNKNOWN_7EAEDC)
	LDA a:.LOWORD(RAM),X
	CLC
	ADC .LOWORD(UNKNOWN_7EAEE0)
	STA a:.LOWORD(RAM),X
	LDY #.LOWORD(UNKNOWN_7EAEDE)
	LDA a:.LOWORD(RAM),Y
	CLC
	ADC .LOWORD(UNKNOWN_7EAEE2)
	STA a:.LOWORD(RAM),Y
	LDA a:.LOWORD(RAM),X
	STA $15
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BVC @UNKNOWN10
	BPL @UNKNOWN12
	BRA @UNKNOWN11
@UNKNOWN10:
	BMI @UNKNOWN12
@UNKNOWN11:
	LDX #.LOWORD(UNKNOWN_7EAED4)
	LDA $15
	EOR #$FFFF
	INC
	STA $02
	LDA a:.LOWORD(RAM),X
	CMP $02
	BCS @UNKNOWN12
	LDA #$0000
	STA a:.LOWORD(RAM),X
	BRA @UNKNOWN13
@UNKNOWN12:
	LDX #.LOWORD(UNKNOWN_7EAED4)
	LDA a:.LOWORD(RAM),X
	CLC
	ADC .LOWORD(UNKNOWN_7EAEDC)
	STA a:.LOWORD(RAM),X
@UNKNOWN13:
	LDA .LOWORD(UNKNOWN_7EAEDE)
	STA $15
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BVC @UNKNOWN14
	BPL @UNKNOWN16
	BRA @UNKNOWN15
@UNKNOWN14:
	BMI @UNKNOWN16
@UNKNOWN15:
	LDX #.LOWORD(UNKNOWN_7EAED6)
	LDA $15
	EOR #$FFFF
	INC
	STA $02
	LDA a:.LOWORD(RAM),X
	CMP $02
	BCS @UNKNOWN16
	LDA #$0000
	STA a:.LOWORD(RAM),X
	BRA @UNKNOWN17
@UNKNOWN16:
	LDX #.LOWORD(UNKNOWN_7EAED6)
	LDA a:.LOWORD(RAM),X
	CLC
	ADC .LOWORD(UNKNOWN_7EAEDE)
	STA a:.LOWORD(RAM),X
@UNKNOWN17:
	LDA .LOWORD(UNKNOWN_7EAED4)
	BNE @UNKNOWN18
	LDA .LOWORD(UNKNOWN_7EAED6)
	BNE @UNKNOWN18
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7EAEC2)
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT_CONSTANT NULL, .LOWORD(UNKNOWN_7EAECC)
	JMP a:.LOWORD(@UNKNOWN34)
@UNKNOWN18:
	LDA .LOWORD(UNKNOWN_7EAED6)
	XBA
	AND #$00FF
	STA $0E
	LDA .LOWORD(UNKNOWN_7EAED4)
	XBA
	AND #$00FF
	TAY
	LDX .LOWORD(UNKNOWN_7EAED2)
	LDA .LOWORD(UNKNOWN_7EAED0)
	JSL UNKNOWN_C0B149
	LDX #$0041
	LDA #$0003
	JSL UNKNOWN_C0B0EF
	LDA .LOWORD(UNKNOWN_7EAEC6)
	AND #$00FF
	TAX
	LDA .LOWORD(UNKNOWN_7EAEC8)
	AND #$00FF
	JSL SET_WINDOW_MASK
	JMP a:.LOWORD(@UNKNOWN34)
@UNKNOWN19:
	LDX #.LOWORD(UNKNOWN_7EAEC2)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	DEC
	STA .LOWORD(UNKNOWN_7EAEC2)
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN20
	JMP a:.LOWORD(@UNKNOWN34)
@UNKNOWN20:
	LDX #.LOWORD(UNKNOWN_7EAEC4)
	STX $15
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BNE @UNKNOWN21
	JMP a:.LOWORD(@UNKNOWN24)
@UNKNOWN21:
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EAEC3)
	STA .LOWORD(UNKNOWN_7EAEC2)
	LDY #.LOWORD(UNKNOWN_7EAEC9)
	STY $13
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	INC
	INC
	INC
	JSL UNKNOWN_C0AE34
	LDY $13
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	INC
	STA a:.LOWORD(RAM),Y
	AND #$0001
	STA a:.LOWORD(RAM),Y
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EAEC7)
	AND #$00FF
	BNE @UNKNOWN22
	LDX #.LOWORD(UNKNOWN_7EAEC5)
	STX $15
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA $12
	REP #PROC_FLAGS::ACCUM8
	LOADPTR SWIRL_DATA&$FF0000, $06
	LDA $12
	AND #$00FF
	ASL
	TAX
	LDA f:SWIRL_POINTER_TABLE,X
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA $12
	INC
	LDX $15
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	INC
	INC
	INC
	JSL UNKNOWN_C0B0B8
	BRA @UNKNOWN23
@UNKNOWN22:
	LDX #.LOWORD(UNKNOWN_7EAEC5)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	DEC
	STA $12
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	LOADPTR SWIRL_DATA&$FF0000, $06
	LDA $12
	AND #$00FF
	ASL
	TAX
	LDA f:SWIRL_POINTER_TABLE,X
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDA a:.LOWORD(RAM),Y
	AND #$00FF
	INC
	INC
	INC
	JSL UNKNOWN_C0B0B8
@UNKNOWN23:
	LDA .LOWORD(UNKNOWN_7EAEC6)
	AND #$00FF
	TAX
	LDA .LOWORD(UNKNOWN_7EAEC8)
	AND #$00FF
	JSL SET_WINDOW_MASK
	LDX #.LOWORD(UNKNOWN_7EAEC4)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	DEC
	STA a:.LOWORD(RAM),X
	JMP a:.LOWORD(@UNKNOWN34)
@UNKNOWN24:
	.A16
	LDA #.LOWORD(UNKNOWN_7EAEE4)
	STA $02
	LDX $02
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BNE @UNKNOWN25
	JMP a:.LOWORD(@UNKNOWN32)
@UNKNOWN25:
	LDY #.LOWORD(UNKNOWN_7EAEE6)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),Y
	DEC
	STA a:.LOWORD(RAM),Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BEQ @UNKNOWN27
	LOADPTR SWIRL_PRIMARY_TABLE, $06
	LDX $02
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	ASL
	ASL
	INC
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	SEP #PROC_FLAGS::ACCUM8
	LDA [$0A]
	LDX $15
	STA a:.LOWORD(RAM),X
	LDY #.LOWORD(UNKNOWN_7EAEC5)
	LDX $02
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	ASL
	ASL
	INC
	CLC
	ADC $06
	STA $06
	SEP #PROC_FLAGS::ACCUM8
	LDA [$06]
	STA $12
	STA a:.LOWORD(RAM),Y
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EAEC7)
	AND #$00FF
	BNE @UNKNOWN26
	JMP a:.LOWORD(@UNKNOWN20)
@UNKNOWN26:
	LDX $15
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	STA $00
	LDA $12
	CLC
	ADC $00
	STA a:.LOWORD(RAM),Y
	JMP a:.LOWORD(@UNKNOWN20)
@UNKNOWN27:
	LDX #.LOWORD(UNKNOWN_7EAEE5)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	INC
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN28
	CMP #$0002
	BEQ @UNKNOWN29
	CMP #$0003
	BEQ @UNKNOWN30
	BRA @UNKNOWN31
@UNKNOWN28:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0004
	STA a:.LOWORD(RAM),Y
	LDA #$0003
	STA .LOWORD(UNKNOWN_7EAEC3)
	BRA @UNKNOWN31
@UNKNOWN29:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0006
	STA a:.LOWORD(RAM),Y
	LDA #$0002
	STA .LOWORD(UNKNOWN_7EAEC3)
	BRA @UNKNOWN31
@UNKNOWN30:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$000C
	STA a:.LOWORD(RAM),Y
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EAEC3)
@UNKNOWN31:
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7EAEE6)
	AND #$00FF
	BEQ @UNKNOWN32
	JMP a:.LOWORD(@UNKNOWN20)
@UNKNOWN32:
	LDX #.LOWORD(UNKNOWN_7EAECA)
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	BEQ @UNKNOWN33
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EAEC2)
	LDA a:.LOWORD(RAM),X
	DEC
	STA a:.LOWORD(RAM),X
	BRA @UNKNOWN34
@UNKNOWN33:
	.A16
	LDA .LOWORD(UNKNOWN_7EAECB)
	AND #$00FF
	BEQ @UNKNOWN34
	LDA .LOWORD(UNKNOWN_7EAEC9)
	AND #$00FF
	INC
	INC
	INC
	JSL UNKNOWN_C0AE34
	LDX #$0000
	TXA
	JSL SET_WINDOW_MASK
	JSL UNKNOWN_C2DE96
	LDY #$0000
	TYX
	TYA
	JSL SET_BATTLE_SWIRL_COLOUR
	LDA .LOWORD(UNKNOWN_7EAD8A)
	JSL UNKNOWN_C0AFCD
@UNKNOWN34:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
