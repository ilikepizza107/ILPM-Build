::d2x-beta.bat should be saved here in order for ModMii v4.6.0+ to use it: modules\More-cIOSs\{ANY FOLDER NAME}\d2x-beta.bat

::--------update what comes after "d2x-beta-rev=" and "ciosversion=" below----------

set ciosversion=21010
::must be <=65535

set d2x-beta-rev=10-beta53-alt
::This info is used to sign *00.app file for cIOS detection, everything after "=" but before the first "-" is considered the version # and it must be a number! Good examples are "5-beta1-test1" or "5" or "999". Bad examples are "5beta1" or "five-beta1" or "-5-beta1"
::everything after the first "-" is considered the version string (limited by 16 chars) and it only recognizes letters, numbers and + - _ ( ) [ ]

set cIOSFamilyName=d2x
::Only change this if building a cIOS that isn't a "d2x" branded cIOS. This string is limited by 16 chars and it only recognizes letters, numbers and + - _ ( ) [ ]


if "%wadname%"=="" goto:endofd2xbat

::------------------------Section to update (below)--------------------
::here you should enter the new beta cIOS hashes (under the OLD non-beta "wadname")
if /i "%wadname:~0,17%" EQU "cIOS249[37]-d2x-v" set md5=34d5c592f7b41efedc6f025ced771757
if /i "%wadname:~0,17%" EQU "cIOS250[37]-d2x-v" set md5=f6a271568ba9953b090575b540fcce32
if /i "%wadname:~0,17%" EQU "cIOS249[38]-d2x-v" set md5=6bede6601fdb734cfd2c94097c928faf
if /i "%wadname:~0,17%" EQU "cIOS250[38]-d2x-v" set md5=0cbb667beaed8920397389f773656975
if /i "%wadname:~0,17%" EQU "cIOS249[53]-d2x-v" set md5=caac802f3c1f299679d9fbef2544ffe8
if /i "%wadname:~0,17%" EQU "cIOS250[53]-d2x-v" set md5=0f662c6d46b776bac6761a29174fa212
if /i "%wadname:~0,17%" EQU "cIOS249[55]-d2x-v" set md5=e4d692c3ee1cb89f88e88217aec20204
if /i "%wadname:~0,17%" EQU "cIOS250[55]-d2x-v" set md5=00a8900a5a5ed9d8a51dece778cee09c
if /i "%wadname:~0,17%" EQU "cIOS249[56]-d2x-v" set md5=021871027856fbc085a0dcc604e6bcb3
if /i "%wadname:~0,17%" EQU "cIOS250[56]-d2x-v" set md5=82cea2aaf11835978758d51c5a37b559
if /i "%wadname:~0,17%" EQU "cIOS249[57]-d2x-v" set md5=7a0e0d3d53315ee1e8e8b004a6ace7ff
if /i "%wadname:~0,17%" EQU "cIOS250[57]-d2x-v" set md5=07f297d47b0b0482854dafa66b569436
if /i "%wadname:~0,17%" EQU "cIOS249[58]-d2x-v" set md5=b4257f9fa565b1d332b0bbd35457945f
if /i "%wadname:~0,17%" EQU "cIOS250[58]-d2x-v" set md5=daa42bdda22c4ef1306256102324d99f
if /i "%wadname:~0,17%" EQU "cIOS249[60]-d2x-v" set md5=d76c94ffbf3b0e1f32e6bd14bcf533ab
if /i "%wadname:~0,17%" EQU "cIOS250[60]-d2x-v" set md5=1bb1c38d35cdb2a24178d64a924d91d6
if /i "%wadname:~0,17%" EQU "cIOS249[70]-d2x-v" set md5=4bed67e993430df430d4e8cda78d274c
if /i "%wadname:~0,17%" EQU "cIOS250[70]-d2x-v" set md5=07b41ebf1e904cce8c0e91d80028c8af
if /i "%wadname:~0,17%" EQU "cIOS249[80]-d2x-v" set md5=282c39cb36fd246b2a1f4c9840ec7cd4
if /i "%wadname:~0,17%" EQU "cIOS250[80]-d2x-v" set md5=a874bc3b2e4b5b99bc60d20a949d279c
::------------------------Section to update (above)--------------------

::----------Additional Instructions---------------
::save any of the following beta files to the following directory
::if any of the following is not found, the standard d2x module used in the previous ModMii release will continue to be used
::modules\More-cIOSs\{ANY FOLDER NAME}\mload.app
::modules\More-cIOSs\{ANY FOLDER NAME}\EHCI.app
::modules\More-cIOSs\{ANY FOLDER NAME}\USBS.app
::modules\More-cIOSs\{ANY FOLDER NAME}\DIPP.app
::modules\More-cIOSs\{ANY FOLDER NAME}\ES.app
::modules\More-cIOSs\{ANY FOLDER NAME}\FFSP.app
::------------------------------------------------------

set md5alt=%md5%

::change some variables
set wadname=%wadname:~0,17%%d2x-beta-rev%
if /i "%name:~0,17%" NEQ "Advanced Download" set name=%wadname%

:endofd2xbat 

