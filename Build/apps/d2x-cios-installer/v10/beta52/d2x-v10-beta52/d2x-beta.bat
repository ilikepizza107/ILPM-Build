::d2x-beta.bat should be saved here in order for ModMii v4.6.0+ to use it: modules\More-cIOSs\{ANY FOLDER NAME}\d2x-beta.bat

::--------update what comes after "d2x-beta-rev=" and "ciosversion=" below----------

set ciosversion=21010
::must be <=65535

set d2x-beta-rev=10-beta52
::This info is used to sign *00.app file for cIOS detection, everything after "=" but before the first "-" is considered the version # and it must be a number! Good examples are "5-beta1-test1" or "5" or "999". Bad examples are "5beta1" or "five-beta1" or "-5-beta1"
::everything after the first "-" is considered the version string (limited by 16 chars) and it only recognizes letters, numbers and + - _ ( ) [ ]

set cIOSFamilyName=d2x
::Only change this if building a cIOS that isn't a "d2x" branded cIOS. This string is limited by 16 chars and it only recognizes letters, numbers and + - _ ( ) [ ]


if "%wadname%"=="" goto:endofd2xbat

::------------------------Section to update (below)--------------------
::here you should enter the new beta cIOS hashes (under the OLD non-beta "wadname")
if /i "%wadname:~0,17%" EQU "cIOS249[37]-d2x-v" set md5=f6dd0b41e9db8cc64d1c33914f36a061
if /i "%wadname:~0,17%" EQU "cIOS250[37]-d2x-v" set md5=f3bf22429498367468044f4564b0aa58
if /i "%wadname:~0,17%" EQU "cIOS249[38]-d2x-v" set md5=9ed4f3c925905dbd59532b1749d3cc7e
if /i "%wadname:~0,17%" EQU "cIOS250[38]-d2x-v" set md5=77bd93b55e3879b2abdaa595b5b62b9b
if /i "%wadname:~0,17%" EQU "cIOS249[53]-d2x-v" set md5=30f45a55568b45a2f3b33de092e2710a
if /i "%wadname:~0,17%" EQU "cIOS250[53]-d2x-v" set md5=7e0e32520b3382b6bff4c2728ff3d9f8
if /i "%wadname:~0,17%" EQU "cIOS249[55]-d2x-v" set md5=4dc112d7c15b0568acf4c7c7f6cca606
if /i "%wadname:~0,17%" EQU "cIOS250[55]-d2x-v" set md5=d0b451637d9c83534327a9e63380b3dc
if /i "%wadname:~0,17%" EQU "cIOS249[56]-d2x-v" set md5=456c2d9c152a9695763400beb8a8ae05
if /i "%wadname:~0,17%" EQU "cIOS250[56]-d2x-v" set md5=b6956acd3fd622d4ec91ed0b7993af9c
if /i "%wadname:~0,17%" EQU "cIOS249[57]-d2x-v" set md5=edc5205a8338469fad4c8f6148784edc
if /i "%wadname:~0,17%" EQU "cIOS250[57]-d2x-v" set md5=da3f51e01f511d6c8e7006b8cc294620
if /i "%wadname:~0,17%" EQU "cIOS249[58]-d2x-v" set md5=759bbab4d555eaf74ca8565511f6b40c
if /i "%wadname:~0,17%" EQU "cIOS250[58]-d2x-v" set md5=a7a86e5489d440ff549d985dd6daa0af
if /i "%wadname:~0,17%" EQU "cIOS249[60]-d2x-v" set md5=47b1d38f680103b4c6ae96b9f82ed43b
if /i "%wadname:~0,17%" EQU "cIOS250[60]-d2x-v" set md5=3e921481d993aaf75b4b393ba0707c55
if /i "%wadname:~0,17%" EQU "cIOS249[70]-d2x-v" set md5=fc3c589a7cf0acdff352a023eeef6ca6
if /i "%wadname:~0,17%" EQU "cIOS250[70]-d2x-v" set md5=3595b86f94624eeea8dfe6ecf9fc0215
if /i "%wadname:~0,17%" EQU "cIOS249[80]-d2x-v" set md5=82e2629cd072b364637aa7e6ba092756
if /i "%wadname:~0,17%" EQU "cIOS250[80]-d2x-v" set md5=5531f7585ef0002d01dbfff42e2f709a
::------------------------Section to update (above)--------------------

::----------Additional Instructions---------------
::save any of the following beta files to the following directory
::if any of the following is not found, the standard d2x module used in the previous ModMii release will continue to be used
::modules\More-cIOSs\{ANY FOLDER NAME}\mload.app
::modules\More-cIOSs\{ANY FOLDER NAME}\FAT.app
::modules\More-cIOSs\{ANY FOLDER NAME}\SDHC.app
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

