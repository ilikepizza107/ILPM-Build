######################################################################################
Middle 3 Stagelist [ilikepizza107]
######################################################################################
* 20523400 00000002 # If 80523400 is equal to 2

.BA<-TABLE_STAGES
.BA->$80495D00
.BA<-TABLE_1
.BA->$80495D04
.BA<-TABLE_2
.BA->$80495D08
.BA<-TABLE_3
.BA->$80495D0C
.BA<-TABLE_4
.BA->$80495D10
.BA<-TABLE_5
.BA->$80495D14
.GOTO->SkipStageTables

TABLE_1:
	byte[10] |
0x15,	| # Wario_Land
0x18,	| # Fountain_of_Dreams
0x01,	| # Final_Destination
0x04,	| # Metal_Cavern
0x23,	| # Dream_Land
0x1C,	| # Green_Hill_Zone
0x1A,	| # Smashville
0x00,	| # Battlefield
0x28,	| # Pokemon_Stadium_2
0x02	| # Delfino_Secret


TABLE_2:
	byte[27] |
0x20,	| # Yoshis_Story
0x05,	| # Bowser_Castle
0x14,	| # Castle_Siege
0x1E,	| # Sky_Sanctuary
0x21,	| # Golden_Temple
0x0A,	| # Ceres_Space_Colony
0x16,	| # Distant_Planet
0x0C,	| # Yoshis_Island
0x0B,	| # Frigate_Husk
0x08,	| # Temple_of_Time
0x03,	| # Luigis_Mansion
0x24,	| # Peach_Castle
0x06,	| # Kongo_Jungle
0x07,	| # Rumble_Falls
0x09,	| # Hyrule_Castle
0x1F,	| # Temple
0x0D,	| # Halberd
0x27,	| # Planet_Zebes
0x0F,	| # Saffron_City
0x10,	| # Spear_Pillar
0x25,	| # Corneria
0x0E,	| # Lylat_Cruise
0x22,	| # Onett
0x19,	| # Fourside
0x12,	| # Infinite_Glacier
0x26,	| # Big_Blue
0x2B	| # Training


TABLE_3:
	byte[23] |
0x11,	| # Port_Town
0x13,	| # Flat_Zone
0x17,	| # Skyworld
0x1B,	| # Shadow_Moses
0x1D,	| # PictoChat
0x31,	| # Dinosaur_Land
0x2D,	| # Mario_Circuit
0x38,	| # Mushroom_Kingdom
0x3B,	| # Rainbow_Cruise
0x32,	| # Minecart_Madness
0x33,	| # Jungle_Japes
0x36,	| # Cookie_Country
0x2E,	| # Clock_Town
0x3D,	| # Pirate_Ship
0x39,	| # WarioWare
0x3C,	| # Poke_Floats
0x34,	| # Bell_Tower
0x35,	| # Norfair
0x2F,	| # Hanenbow
0x37,	| # Venus_Lighthouse
0x2C,	| # Draculas_Castle
0x30,	| # Dead_Line
0x3A	| # Subspace


TABLE_4:


TABLE_5:


TABLE_STAGES:
# Table of icon<->stage slot associations
half[62] |	# Stage Count + 2
| # OLD SLOTS
0x0101, 0x0202, 0x0303, 0x0404, | # Battlefield, Final Destination, Delfino's Secret, Luigi's Mansion
0x0505, 0x0606, 0x0707, 0x0808, | # Metal Cavern, Bowser's Castle, Kongo Jungle, Rumble Falls
0x0909, 0x330A, 0x492C, 0x0C0C, | # Temple of Time, Hyrule Castle, Metroid Lab, Frigate Orpheon
0x0D0D, 0x0E0E, 0x130F, 0x1410, | # Yoshi's Island, Halberd, Lylat Cruise, Saffron City
0x1511, 0x1612, 0x1713, 0x1814, | # Spear Pillar, Port Town Aero Dive, Infinite Glacier, Flat Zone 2
0x1915, 0x1C16, 0x1D17, 0x1E18, | # Castle Siege, Wario Land, Distant Planet, Skyworld
0x1F19, 0x201A, 0x211B, 0x221C, | # Fountain of Dreams, Fourside, Smashville, Shadow Moses Island
0x231D, 0x241E, 0x4326, 0x2932, | # Green Hill Zone, PictoChat, Sky Sanctuary, Temple
0x2A33, 0x472A, 0x2C35, 0x2D36, | # Yoshi's Story, Golden Temple, Onett, Dream Land
0x2F37, 0x3038, 0x3139, 0x323A, | # Rainbow Cruise, Corneria, Big Blue, Planet Zebes
0x2E3B, 0xFF64, 0xFF64, 0x373C, | # Pokemon Stadium 2, NOTHING, NOTHING, Training Room
| # NEW SLOTS
0x4023, 0x4124, 0x4225, 0x251F, | # Dracula's Castle, Mario Circuit, Clock Town, Hanenbow
0x4427, 0x4528, 0x4629, 0x2B34, | # Dead Line, Dinosaur Land, Oil Drum Alley, Jungle Japes
0x482B, 0x0B0B, 0x4A2D, 0x4B2E, | # Bell Tower, Norfair, Cookie Country, Venus Lighthouse
0x4C2F, 0x4D30, 0x4E31, 0x4F3D, | # Mushroom Kingdom, WarioWare, Subspace, Rainbow Cruise
0x503E, 0x513F			  | # Poke Floats, Pirate Ship


SkipStageTables:
.RESET
* 20523400 00000002 # If 80523400 is equal to 2
byte 10 @ $806B929C # Page 1
byte 27 @ $806B92A4 # Page 2
byte 23 @ $80496002 # Page 3
byte 00 @ $80496003 # Page 4 (Unused)
byte 00 @ $80496004 # Page 5 (Unused)
byte 60 @ $800AF673 # Stage Count
* E0000000 80008000
