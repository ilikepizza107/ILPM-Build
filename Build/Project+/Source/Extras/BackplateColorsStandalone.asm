##############################################################################################
[CM: _BackplateColors] Backplate Color Code (Standalone Ver. 1.0.5) [QuickLava]
#
# This is an adaptation of my Player Slot Color Changer family of codes for external use in
# the code menu to enable easy adoption without needing to terraform your whole repo to adopt
# my infrastructure changes lol.
##############################################################################################
.alias BACKPLATE_COLOR_1_LOC_HI = 0x804E
.alias BACKPLATE_COLOR_1_LOC_LO = 0x02C0
.alias BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI = 0x804E
.alias BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO = 0x02D8
.alias FLOAT_STAGING_LOC_HI = 0x9134
.alias FLOAT_STAGING_LOC_LO = 0xc99c
.RESET								# Ensure BA and PO are properly reset!
#########################################################################################
#[CM: _BackplateColors v2.0.2] Reset Cached SelChar Team Battle Status on Init [QuickLava]
#########################################################################################
HOOK @ $806945E8                # Address = $(ba + 0x006945E8) [in "initDispSelect/[muSelCharPlayerArea]/mu_selchar_player_ar" @ $80694514]
{
	mulli r12, r3, 0x8              # 0x1D830008
	addi r12, r12, 0x8              # 0x398C0008
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	stb r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	mr r5, r3                       # 0x7C651B78
}

##########################################################################
#[CM: _BackplateColors v2.0.2] Cache SelChar Team Battle Status [QuickLava]
##########################################################################
HOOK @ $8068EDA8                # Address = $(ba + 0x0068EDA8) [in "setMeleeKind/[muSelCharTask]/mu_selchar_obj.o" @ $8068ED8C]
{
	mulli r12, r4, 0x8              # 0x1D840008
	addi r12, r12, 0x8              # 0x398C0008
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	stb r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	mr r28, r3                      # 0x7C7C1B78
}

###############################################################################
#[CM: _BackplateColors v2.0.2] Cache In-game Mode Team Battle Status [QuickLava]
###############################################################################
HOOK @ $800E0A44                # Address = $(ba + 0x000E0A44) [in "appear/[IfPlayer]/if_player.o" @ $800E08A0]
{
	mulli r12, r0, 0x8              # 0x1D800008
	addi r12, r12, 0x8              # 0x398C0008
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	stb r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	cmpwi r0, 0x0                   # 0x2C000000
}

##################################################################################################
#[CM: _BackplateColors v2.0.2] Only 2P Stadium Boss Battles Are Considered Team Battles [QuickLava]
##################################################################################################
HOOK @ $806E5F08                # Address = $(ba + 0x006E5F08) [in "setAdventureCondition/[sqSingleBoss]/sq_single_boss.o" @ $806E5998]
{
	stb r23, 0x13(r30)              # 0x9AFE0013
	stb r31, 0x99(r25)              # 0x9BF90099
	nop                             # 0x60000000
}

#######################################################################################
#[CM: _BackplateColors v2.0.2] Shield Color + Death Plume Override [QuickLava]
# Overrides IC-Basic[21029], which is only used by Shield and Death Plume to
# determine their colors (at least as far as I can tell) to instead report the selected
# value in the Code Menu line associated with the color that would've been requested.
#######################################################################################
* C6855A9C 80855AB0             # Create Branch @ $(ba + 0x00855A9C): b 0x80855AB0

HOOK @ $80855AB0                # Address = $(ba + 0x00855AB0) [in "getVariableIntCore/[ftValueAccesser]/ft_value_accesser.o" @ $808552CC]
{
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	lbz r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	rlwimi r11, r3, 2, 16, 29       # (Mask: 0x00003fff)| 0x506B143A
	lwz r11, BACKPLATE_COLOR_1_LOC_LO(r11)
	lwzx r3, r11, r12               # 0x7C6B602E
	lis r11, 0x8085                 # 0x3D608085
	ori r11, r11, 0x5ab8            # 0x616B5AB8
	mtctr r11                       # 0x7D6903A6
	bctr                            # 0x4E800420
}

###############################################################################################################
#[CM: _BackplateColors v2.0.2] Incr and Decr Slot Color with L/R, Reset with Z on Player Kind Button [QuickLava]
###############################################################################################################
HOOK @ $8068B168                # Address = $(ba + 0x0068B168) [in "buttonProcInPlayerArea/[muSelCharTask]/mu_selchar.o" @ $8068B100]
{
	cmpwi r26, 0x1d                 # 0x2C1A001D
	bne loc_0x01D                   # 0x40820070
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	lbz r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	cmpwi r12, 0x10                 # 0x2C0C0010
	beq loc_0x01D                   # 0x41820060
	rlwimi r11, r29, 2, 16, 29      # (Mask: 0x00003fff)| 0x53AB143A
	lwz r11, BACKPLATE_COLOR_1_LOC_LO(r11)
	rlwinm. r12, r0, 28, 31, 31     # (Mask: 0x00000010)| 0x540CE7FF
	lwz r30, 0x10(r11)              # 0x83CB0010
	bne loc_0x017                   # 0x40820034
	rlwinm r12, r0, 27, 31, 31      # (Mask: 0x00000020)| 0x540CDFFE
	rlwinm r30, r0, 26, 31, 31      # (Mask: 0x00000040)| 0x541ED7FE
	subf. r12, r30, r12             # 0x7D9E6051
	beq loc_0x01D                   # 0x4182003C
	lwz r30, 0x8(r11)               # 0x83CB0008
	add r30, r30, r12               # 0x7FDE6214
	cmpwi r30, 0x9                  # 0x2C1E0009
	ble loc_0x014                   # 0x40810008
	li r30, 0x0                     # 0x3BC00000
loc_0x014:
	cmpwi r30, 0x0                  # 0x2C1E0000
	bge loc_0x017                   # 0x40800008
	li r30, 0x9                     # 0x3BC00009
loc_0x017:
	stw r30, 0x8(r11)               # 0x93CB0008
	lwz r11, 0x44(r4)               # 0x81640044
	lwz r12, 0x1b4(r11)             # 0x818B01B4
	subi r12, r12, 0x1              # 0x398CFFFF
	stw r12, 0x1b4(r11)             # 0x918B01B4
	li r0, 0x100                    # 0x38000100
loc_0x01D:
	rlwinm. r0, r0, 0, 23, 23       # (Mask: 0x00000100)| 0x540005EF
	nop                             # 0x60000000
}

###############################################################################
#[CM: _BackplateColors v2.0.2] Hand Color Fix [QuickLava]
# Fixes a conflict with Eon's Roster-Size-Based Hand Resizing code, which could
# in some cases cause CSS hands to wind up the wrong color.
###############################################################################
* 0469CA2C C0031014             # 32-Bit Write @ $(ba + 0x0069CA2C):  0xC0031014
* 0469CAE0 C0031014             # 32-Bit Write @ $(ba + 0x0069CAE0):  0xC0031014

#####################################################################################################
#[CM: _BackplateColors v2.0.2] Updating Player Kind (Player->CPU->None) Updates Hand Color [QuickLava]
#####################################################################################################
HOOK @ $8068B5D4                # Address = $(ba + 0x0068B5D4) [in "buttonProcInPlayerArea/[muSelCharTask]/mu_selchar.o" @ $8068B100]
{
	mr r3, r31                      # 0x7FE3FB78
	lis r12, 0x8069                 # 0x3D808069
	ori r12, r12, 0xc698            # 0x618CC698
	mtctr r12                       # 0x7D8903A6
	bctrl                           # 0x4E800421
	lwz r3, 0x1a8(r30)              # 0x807E01A8
	nop                             # 0x60000000
}

########################################################################################################
#[CM: _BackplateColors v2.0.2] Disable Franchise Icon Color 10-Frame Offset in Results Screen [QuickLava]
########################################################################################################
* C60EBB98 800EBBB8             # Create Branch @ $(ba + 0x000EBB98): b 0x800EBBB8
* C60EBDE4 800EBE00             # Create Branch @ $(ba + 0x000EBDE4): b 0x800EBE00

#############################################################################################
#[CM: _BackplateColors v2.0.2] CSS, In-game, and Results HUD Color Changer [QuickLava]
# 
# Intercepts the setFrameMatCol calls used to color certain Menu elements by player slot, and
# redirects them according to the appropriate Code Menu lines. Intended for use with:
# 	In sc_selcharacter.pac:
# 		- MenSelchrCbase4_TopN__0
# 		- MenSelchrCmark4_TopN__0
# 		- MenSelchrCursorA_TopN__0
# 	In info.pac (and its variants, eg. info_training.pac):
# 		- InfArrow_TopN__0
# 		- InfFace_TopN__0
# 		- InfLoupe0_TopN__0
# 		- InfMark_TopN__0
# 		- InfPlynm_TopN__0
# 	In stgresult.pac:
# 		- InfResultRank#_TopN__0
# 		- InfResultMark##_TopN
# To trigger this code on a given CLR0, set its "OriginalPath" field to "lBC1" in BrawlBox!
#############################################################################################
HOOK @ $80197FAC                # Address = $(ba + 0x00197FAC) [in "SetFrame/[nw4r3g3d15AnmObjMatClrResFf]/g3d_anmclr.o" @ $80197F98]
{
	lwz r11, 0x2c(r3)               # 0x8163002C
	lwz r12, 0x18(r11)              # 0x818B0018
	lwzx r12, r12, r11              # 0x7D8C582E
	lis r11, 0x6c42                 # 0x3D606C42
	ori r11, r11, 0x4331            # 0x616B4331
	cmplw r12, r11                  # 0x7C0C5840
	bne loc_0x01E                   # 0x40820060
	lis r11, FLOAT_STAGING_LOC_HI
	ori r11, r11, FLOAT_STAGING_LOC_LO
	fctiwz f3, f1                   # 0xFC60081E
	stfd f3, 0x0(r11)               # 0xD86B0000
	lwz r0, 0x4(r11)                # 0x800B0004
	cmplwi r0, 0x1                  # 0x28000001
	blt loc_0x01E                   # 0x41800044
	cmplwi r0, 0x5                  # 0x28000005
	bgt loc_0x01E                   # 0x4181003C
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	lbz r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	rlwimi r11, r0, 2, 16, 29       # (Mask: 0x00003fff)| 0x500B143A
	subi r11, r11, 0x4              # 0x396BFFFC
	lwz r11, BACKPLATE_COLOR_1_LOC_LO(r11)
	lwzx r12, r11, r12              # 0x7D8B602E
	lis r11, FLOAT_STAGING_LOC_HI
	ori r11, r11, FLOAT_STAGING_LOC_LO
	stw r12, 0x4(r11)               # 0x918B0004
	lis r12, 0x4330                 # 0x3D804330
	stw r12, 0x0(r11)               # 0x918B0000
	lfd f3, 0x0(r11)                # 0xC86B0000
	lis r12, 0x805a                 # 0x3D80805A
	lfd f1, 0x36e8(r12)             # 0xC82C36E8
	fsub f1, f3, f1                 # 0xFC230828
loc_0x01E:
	fmr f3, f1                      # 0xFC600890
}

###########################################################################################
#[CM: _BackplateColors v2.0.2] MenSelChr Element Override [QuickLava]
# 
# Intercepts calls to certain player-slot-specific Menu CLR0s, and redirects them according
# to the appropriate Code Menu line. Intended for use with:
# 	- MenSelchrCentry4_TopN__#
# 	- MenSelchrChuman4_TopN__#
# 	- MenSelchrCoin_TopN__#
# 	- MenSelchrCursorB_TopN__#
# To trigger this code on a given CLR0, set its "OriginalPath" field to "lBC3" in BrawlBox!
###########################################################################################
HOOK @ $8018DA3C                # Address = $(ba + 0x0018DA3C) [in "GetResAnmClr/[nw4r3g3d7ResFileCFPCc]/g3d_resfile.o" @ $8018D9E4]
{
	cmplwi r3, 0x0                  # 0x28030000
	beq loc_0x021                   # 0x41820080
	lwz r12, 0x18(r3)               # 0x81830018
	lwzx r12, r12, r3               # 0x7D8C182E
	lis r11, 0x6c42                 # 0x3D606C42
	ori r11, r11, 0x4333            # 0x616B4333
	cmplw r12, r11                  # 0x7C0C5840
	bne loc_0x021                   # 0x40820068
	mr r3, r31                      # 0x7FE3FB78
	lis r12, 0x803f                 # 0x3D80803F
	ori r12, r12, 0x640             # 0x618C0640
	mtctr r12                       # 0x7D8903A6
	bctrl                           # 0x4E800421
	subi r3, r3, 0x1                # 0x3863FFFF
	lbzux r4, r3, r31               # 0x7C83F8EE
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	lbz r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	rlwimi r11, r4, 2, 26, 29       # (Mask: 0x0000000f)| 0x508B16BA
	lwz r11, BACKPLATE_COLOR_1_LOC_LO(r11)
	lwzx r5, r11, r12               # 0x7CAB602E
	lis r11, 0x803f                 # 0x3D60803F
	ori r11, r11, 0x89fc            # 0x616B89FC
	mtctr r11                       # 0x7D6903A6
	bl data_0x019                   # 0x48000009
	word 0x25580000                 # %X..      | DATA_EMBED (0x4 bytes)
data_0x019:
	mflr r4                         # 0x7C8802A6
	bctrl                           # 0x4E800421
	addi r3, r1, 0x8                # 0x38610008
	mr r4, r31                      # 0x7FE4FB78
	lis r12, 0x8018                 # 0x3D808018
	ori r12, r12, 0xcf30            # 0x618CCF30
	mtctr r12                       # 0x7D8903A6
	bctrl                           # 0x4E800421
loc_0x021:
	lwz r0, 0x24(r1)                # 0x80010024
	nop                             # 0x60000000
}

#####################################################################################
#[CM: _BackplateColors v2.0.2] Results Screen Player Names are Transparent [QuickLava]
#####################################################################################
HOOK @ $800EA73C                # Address = $(ba + 0x000EA73C) [in "initMdlData/[ifVsResultTask]/if_vsresult.o" @ $800E9878]
{
	li r5, 0xff                     # 0x38A000FF
	li r6, 0xff                     # 0x38C000FF
	li r7, 0xff                     # 0x38E000FF
	li r8, 0xa0                     # 0x390000A0
	lwz r11, 0xc(r3)                # 0x8163000C
	mulli r12, r4, 0x48             # 0x1D840048
	add r11, r11, r12               # 0x7D6B6214
	lbz r12, 0x0(r11)               # 0x898B0000
	andi. r12, r12, 0xfd            # 0x718C00FD
	stb r12, 0x0(r11)               # 0x998B0000
	nop                             # 0x60000000
}

HOOK @ $800EA8C0                # Address = $(ba + 0x000EA8C0) [in "initMdlData/[ifVsResultTask]/if_vsresult.o" @ $800E9878]
{
	li r5, 0xff                     # 0x38A000FF
	li r6, 0xff                     # 0x38C000FF
	li r7, 0xff                     # 0x38E000FF
	li r8, 0xa0                     # 0x390000A0
	lwz r11, 0xc(r3)                # 0x8163000C
	mulli r12, r4, 0x48             # 0x1D840048
	add r11, r11, r12               # 0x7D6B6214
	lbz r12, 0x0(r11)               # 0x898B0000
	andi. r12, r12, 0xfd            # 0x718C00FD
	stb r12, 0x0(r11)               # 0x998B0000
	nop                             # 0x60000000
}

* 040EA724 60000000             # 32-Bit Write @ $(ba + 0x000EA724):  0x60000000

##########################################################################
#[CM: _BackplateColors v2.0.2] CSS Player Names are Transparent [QuickLava]
##########################################################################
HOOK @ $8069B268                # Address = $(ba + 0x0069B268) [in "dispName/[muSelCharPlayerArea]/mu_selchar_player_area_obj" @ $8069B1CC]
{
	li r5, 0xff                     # 0x38A000FF
	li r6, 0xff                     # 0x38C000FF
	li r7, 0xff                     # 0x38E000FF
	li r8, 0xb0                     # 0x390000B0
	nop                             # 0x60000000
}

#########################################################################
#[CM: _BackplateColors v2.0.2] MenSelChr Random Color Override [QuickLava]
#########################################################################
HOOK @ $80697554                # Address = $(ba + 0x00697554) [in "setCharPic/[muSelCharPlayerArea]/mu_selchar_player_area_o" @ $8069742C]
{
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	lbz r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	rlwimi r11, r24, 2, 16, 29      # (Mask: 0x00003fff)| 0x530B143A
	lwz r11, BACKPLATE_COLOR_1_LOC_LO(r11)
	lwzx r24, r11, r12              # 0x7F0B602E
	addi r26, r27, 0x4              # 0x3B5B0004
	nop                             # 0x60000000
}

######################################################################
#CM: _BackplateColors v2.0.2] Stage Select Random Stock Icons Fix [QuickLava]
######################################################################
HOOK @ $806b2fc8
{
	lis r11, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_HI
	lbz r12, BACKPLATE_COLOR_TEAM_BATTLE_STORE_LOC_LO(r11)
	rlwimi r11, r23, 2, 16, 29      # (Mask: 0x00003fff)
	lwz r11, BACKPLATE_COLOR_1_LOC_LO(r11)
	lwzx r23, r11, r12
	xoris r0, r23, 0x8000			# Restore Original Instruction
}
