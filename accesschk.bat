:: --------------------------------------------------------------------------------
:: Author: SmartCon GmbH, Ákos Bakos
:: Date: 11.04.2023
:: Purpose: check folder permissions for AppLocker
:: Template: 2.0
:: Revisions: 20xx-xx-xx <WHO> - <WHAT>
:: --------------------------------------------------------------------------------
SET _HH=%TIME: =0%
SET _TIME=%_HH:~0,2%%time:~3,2%%time:~6,2%
SET _DATE=%date:~-4%%date:~-7,2%%date:~-10,2%

SET LOGDIR=%SYSTEMDRIVE%\Logs
SET PACKAGENAME=AccessChk_1.0
SET LOGFILE=%LOGDIR%\%_DATE%-%_TIME%-%PACKAGENAME%_I.log

IF NOT EXIST %LOGDIR% MKDIR %LOGDIR%

ECHO %DATE% - %TIME% Date and time is: %DATE% - %TIME% >> "%LOGFILE%"
ECHO %DATE% - %TIME% Current directory is: %~dp0 >> "%LOGFILE%"
ECHO %DATE% - %TIME% This bat file is: %~dpnx0 >> "%LOGFILE%"

:: Bitness Check
ECHO %DATE% - %TIME% Dump some vars (bitness check) >> "%LOGFILE%"
ECHO %DATE% - %TIME% Variable ProgramFiles resolution: %ProgramFiles% >> "%LOGFILE%"
ECHO %DATE% - %TIME% Variable ProgramFiles(x86) resolution: %ProgramFiles(x86)%  >> "%LOGFILE%"

:: --------------------------------------------------------------------------------
:: Package sections starts here
:: --------------------------------------------------------------------------------

SET accesschk=%~dp0accesschk.exe

ECHO %DATE% - %TIME% - Will try to accept EULA for %accesschk% >> %LOGFILE%
"%accesschk%" -accepteula

ECHO ###################### Permissions for %username% in "C:\Program Files" ###################### >> %LOGFILE%
ECHO ###################### Execute "%accesschk%" -w -s -q -u %username% "C:\Program Files" >> %LOGFILE%
"%accesschk%" -w -s -q -u %username% "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for Users in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Users "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for Everyone in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Everyone "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for Authenticated Users in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Authenticated Users" "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for Interactive in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Interactive "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for This Organization in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "This Organization" "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for Authentication authority asserted identity in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Authentication authority asserted identity" "C:\Program Files" >> %LOGFILE%

ECHO ###################### Permissions for Mandatory Label\Medium Mandatory Level in "C:\Program Files" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Mandatory Label\Medium Mandatory Level" "C:\Program Files" >> %LOGFILE%

ECHO ###################################################
ECHO ###################################################

ECHO ###################### Permissions for %username% in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u %username% "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for Users in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Users "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for Everyone in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Everyone "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for Authenticated Users in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Authenticated Users" "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for Interactive in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Interactive "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for This Organization in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "This Organization" "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for Authentication authority asserted identity in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Authentication authority asserted identity" "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################### Permissions for Mandatory Label\Medium Mandatory Level in "C:\Program Files (x86)" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Mandatory Label\Medium Mandatory Level" "C:\Program Files (x86)" >> %LOGFILE%

ECHO ###################################################
ECHO ###################################################

ECHO ###################### Permissions for %username% in "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u %username% "C:\Windows" >> %LOGFILE% 

ECHO ###################### Permissions for Users in "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Users "C:\Windows" >> %LOGFILE%

ECHO ###################### Permissions for Everyone "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Everyone "C:\Windows" >> %LOGFILE%

ECHO ###################### Permissions for Authenticated Users in "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Authenticated Users" "C:\Windows" >> %LOGFILE%

ECHO ###################### Permissions for Interactive in "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u Interactive "C:\Windows" >> %LOGFILE%

ECHO ###################### Permissions for This Organization in "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "This Organization" "C:\Windows" >> %LOGFILE%

ECHO ###################### Permissions for Authentication authority asserted identity in "C:\Windows"  ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Authentication authority asserted identity" "C:\Windows" >> %LOGFILE%

ECHO ###################### Permissions for Mandatory Label\Medium Mandatory Level in "C:\Windows" ###################### >> %LOGFILE%
"%accesschk%" -w -s -q -u "Mandatory Label\Medium Mandatory Level" "C:\Windows" >> %LOGFILE%