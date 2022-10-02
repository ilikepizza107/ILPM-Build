#.include source/Extras/CostumeAddition.asm # If trying to add more than 15 costumes, use this code to load all costumes from the result portraits, instead of the CSS file.
											# Note that in its current state, this code lags on console when multiple people try to scroll through the CSS at the same time.
											# Troubleshooting for this code will not be supported until it is further updated in the future!
#.include source/Extras/AI/AiDebug.asm 		# Displays AI debug for CPU in P1 slot. Incompatible with CodeMenu.asm (In RSBE01.txt). One or the other must be ignored with # in front of .include

#.include source/Extras/USBGecko.asm 		# Adds support for Gecko codes passed in by a USB Gecko

############################################################################
Set random stagelist based on Code Menu Stagelist setting (ILPM) [Bird]
############################################################################
* 20523400 00000000 # If Code Menu stagelist is set to 0
* 20523310 00000000 # If 80523320 is 00000000
* 04523310 DEADBEEF # Set it to DEADBEEF
* 04523320 00000000 # Set all other values to 00000000
* 04523330 00000000
* 04523340 00000000
* 42000000 90000000 #Set base address to 90000000
* 0417BE74 34001111 # Brawl stages
* 0417BE70 00021000 # Melee stages
* E0000000 80008000

############################################################################
Set random stagelist based on Code Menu Stagelist setting (Middle 3) [Bird]
############################################################################
* 20523400 00000001 # If Code Menu stagelist is set to 1
* 20523330 00000000 # If 80523320 is 00000000
* 04523330 DEADBEEF # Set it to DEADBEEF
* 04523310 00000000 # Set all other values to 00000000
* 04523320 00000000
* 04523340 00000000
* 42000000 90000000 #Set base address to 90000000
* 0417BE74 04000001 # Brawl stages
* 0417BE70 00020000 # Melee stages
* E0000000 80008000

############################################################################
Set random stagelist based on Code Menu Stagelist setting (Theatre) [Bird]
############################################################################
* 20523400 00000002 # If Code Menu stagelist is set to 2
* 20523340 00000000 # If 80523320 is 00000000
* 04523340 DEADBEEF # Set it to DEADBEEF
* 04523310 00000000 # Set all other values to 00000000
* 04523320 00000000
* 04523330 00000000
* 42000000 90000000 #Set base address to 90000000
* 0417BE74 15200017 # Brawl stages
* 0417BE70 00021000 # Melee stages
* E0000000 80008000 