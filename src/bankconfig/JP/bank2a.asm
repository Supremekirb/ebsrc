.SEGMENT "BANK2A"
.INCLUDE "common.asm"

AUDIO_PACK_54: ;$EA0000
        AUDIOPACKBIN $18, $6C68, "audiopacks/54-1.bin"
        AUDIOPACKBIN $3330, $95B0, "audiopacks/54-2.bin"
        AUDIOPACKBIN $24, $6E9C, "audiopacks/54-3.bin"
        AUDIOPACKTERMINATOR

AUDIO_PACK_52: ;$EA337A
        AUDIOPACKBIN $18, $6C68, "audiopacks/52-1.bin"
        AUDIOPACKBIN $31D0, $95B0, "audiopacks/52-2.bin"
        AUDIOPACKBIN $24, $6E9C, "audiopacks/52-3.bin"
        AUDIOPACKTERMINATOR

AUDIO_PACK_72: ;$EA6594
        AUDIOPACKBIN $8, $6C68, "audiopacks/72-1.bin"
        AUDIOPACKBIN $3140, $95B0, "audiopacks/72-2.bin"
        AUDIOPACKBIN $C, $6E9C, "audiopacks/72-3.bin"
        AUDIOPACKTERMINATOR

AUDIO_PACK_89: ;$EA96F6
        AUDIOPACKBIN $18, $6C68, "audiopacks/89-1.bin"
        AUDIOPACKBIN $2E50, $95B0, "audiopacks/89-2.bin"
        AUDIOPACKBIN $24, $6E9C, "audiopacks/89-3.bin"
        AUDIOPACKTERMINATOR

AUDIO_PACK_35: ;$EAC590
        AUDIOPACKBIN $18, $6C68, "audiopacks/35-1.bin"
        AUDIOPACKBIN $2B50, $95B0, "audiopacks/35-2.bin"
        AUDIOPACKBIN $1E, $6E9C, "audiopacks/35-3.bin"
        AUDIOPACKTERMINATOR

AUDIO_PACK_125: ;$EAF124
        AUDIOPACKBIN $EBC, $4800, "audiopacks/125.bin"
        AUDIOPACKTERMINATOR
