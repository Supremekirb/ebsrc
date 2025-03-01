.SEGMENT "SRAM"
.INCLUDE "config.asm"
.INCLUDE "enums.asm"
.INCLUDE "structs.asm"
.INCLUDE "symbols/sram.inc.asm"

SRAM: ;For pointers.

.ORG $306000
SAVE_BASE: ;$306000

.ORG $316000
UNKNOWN_316000: ;$316000

.ORG $3161D9
UNKNOWN_3161D9: ;$3161D9

.ORG $316413
UNKNOWN_316413: ;$316413

.ORG $316493
UNKNOWN_316493: ;$316493

.ORG $307FF0
SRAM_SIZE_1_SCRATCH: ;$307FF0
ANTIPIRACY_SCRATCH_SPACE: ;$307FF0

.ORG $317FF0
SRAM_SIZE_2_SCRATCH: ;$317FF0
ANTIPIRACY_MIRROR_TEST: ;$317FF0

.ORG $327FF0
SRAM_SIZE_3_SCRATCH: ;$327FF0

.ORG $326000
UNKNOWN_326000: ;$326000
