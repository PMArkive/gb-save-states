; md5 f1dbc21b1b8f8dcbe9a15bc9ef68fb9c

.INCLUDE "includes/init.asm"
.ROMBANKS 8
.BACKGROUND "Daffy Duck - The Marvin Missions (UE) [!].gb"
.INCLUDE "includes/header.asm"


;**********
;* config *
;**********

.DEFINE current_rom_bank $ffa0


;**********
;* vblank *
;**********

.DEFINE vblank_handler $0079
.DEFINE original_vblank_handler $0719
.INCLUDE "includes/vblank_handler.asm"


;*******************
;* save/load state *
;*******************

.BANK $0006 SLOT 1
.ORG $3cc8
.SECTION "save/load state" SIZE $02a0 OVERWRITE
    .DB "--- Save Patch ---"
    .INCLUDE "includes/joypad_read_and_check.asm"
    .INCLUDE "includes/save_state_includes.asm"
.ENDS


; Generated with patch-builder.py
