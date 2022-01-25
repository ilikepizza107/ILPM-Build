::d2x-beta.bat should be saved here in order for ModMii v4.6.0+ to use it: modules\More-cIOSs\{ANY FOLDER NAME}\d2x-beta.bat

::--------update what comes after "d2x-beta-rev=" and "ciosversion=" below----------

set ciosversion=21007
::must be <=65535

set d2x-beta-rev=7-final
::This info is used to sign *00.app file for cIOS detection, everything after "=" but before the first "-" is considered the version # and it must be a number! Good examples are "5-beta1-test1" or "5" or "999". Bad examples are "5beta1" or "five-beta1" or "-5-beta1"
::everything after the first "-" is considered the version string (limited by 16 chars) and it only recognizes letters, numbers and + - _ ( ) [ ]

set cIOSFamilyName=d2x
::Only change this if building a cIOS that isn't a "d2x" branded cIOS. This string is limited by 16 chars and it only recognizes letters, numbers and + - _ ( ) [ ]


if "%wadname%"=="" goto:endofd2xbat

::------------------------Section to update (below)--------------------
::here you should enter the new beta cIOS hashes (under the OLD non-beta "wadname")
if /i "%wadname:~0,17%" EQU "cIOS249[37]-d2x-v" set md5=b0a4f22cb94c782ee0bcc57ba85169c5
if /i "%wadname:~0,17%" EQU "cIOS250[37]-d2x-v" set md5=9fc6c027f8d9e7ed46ac37e62ada8846
if /i "%wadname:~0,17%" EQU "cIOS249[38]-d2x-v" set md5=9caeafc3b0d157cfcd7e42f2069abcb7
if /i "%wadname:~0,17%" EQU "cIOS250[38]-d2x-v" set md5=80d3b1aed13f8f7addc9fb3aface9dfe
if /i "%wadname:~0,17%" EQU "cIOS249[53]-d2x-v" set md5=369160fcee28a40cef1511b0817ce81d
if /i "%wadname:~0,17%" EQU "cIOS250[53]-d2x-v" set md5=3461aaaefea9a93c0cf16787828dde01
if /i "%wadname:~0,17%" EQU "cIOS249[55]-d2x-v" set md5=f4eeeb5c64fa598a63363db8fdc5dbe7
if /i "%wadname:~0,17%" EQU "cIOS250[55]-d2x-v" set md5=3976a3a457f5095cd055a99ab5a6684d
if /i "%wadname:~0,17%" EQU "cIOS249[56]-d2x-v" set md5=8c22bc33af8c7cefd513e7136d79148f
if /i "%wadname:~0,17%" EQU "cIOS250[56]-d2x-v" set md5=c670c3288a3240d76bd2de3bddb57bc0
if /i "%wadname:~0,17%" EQU "cIOS249[57]-d2x-v" set md5=53075c217dd9cc6d4a3ab10b7745cf76
if /i "%wadname:~0,17%" EQU "cIOS250[57]-d2x-v" set md5=0eaa45eb9b2f3379e39a9bae106e73c0
if /i "%wadname:~0,17%" EQU "cIOS249[58]-d2x-v" set md5=9dacbe4e7756f297b80f368394335729
if /i "%wadname:~0,17%" EQU "cIOS250[58]-d2x-v" set md5=d80c531e1f6537d9ad4381a87a94e3d4
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

