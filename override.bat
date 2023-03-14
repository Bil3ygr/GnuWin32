@echo off
setlocal ENABLEEXTENSIONS DISABLEDELAYEDEXPANSION

if not defined GETGNUWIN32_ID (
	echo = 
	echo = You cannot run override.bat directly. Run download.bat instead.
	echo = 
	echo = If you are in fact running download.bat an internal error has occurred.
	echo = In that case please contact the authors:
	echo = http://sourceforge.net/projects/getgnuwin32/support
	echo = Click the 'bugs' link and file a bug report. Thanks
	echo = 
	goto bye
)

echo.
echo Now checking to ensure all updated files are valid and fixing any that are not.
echo (For example any 'Permission denied' files during the update will be retried.^)
echo.
echo WARNING: GnuWin32 has not been updated in several years. I have left this
echo script and our GetGnuWin32 downloader functional for legacy purposes. If you
echo need the latest packages consider using MSYS2 MINGW or Cygwin instead.
echo.
pause

set UPDATE_NAME=update%GETGNUWIN32_ID%
set UPDATE_TRIALS=

:tryunzip
set /a UPDATE_TRIALS="UPDATE_TRIALS + 1"
bin\unzip -o -q %UPDATE_NAME%.zip

if errorlevel 0 if not errorlevel 1 (
	echo All updated files are now valid. Verification successful.
	goto finished
)

echo = 
echo = unzip of %UPDATE_NAME%.zip failed (try %UPDATE_TRIALS% of 6)
echo = 

if /i %UPDATE_TRIALS% EQU 6 (
	echo = GetGnuWin32 cannot continue without its core files.
	echo = Make sure you have enough disk space and there is no anti-virus conflict.
	echo = Try running download.bat again. If that fails reinstall GetGnuWin32.
	echo = 
	echo = If GetGnuWin32 still won't function, contact the authors.
	echo = http://sourceforge.net/projects/getgnuwin32/support
	echo = Click the 'bugs' link and file a bug report. Thanks
	echo = 
	echo = Quitting.
	goto bye
)

if /i %UPDATE_TRIALS% EQU 1 (
	echo = If unzipping an update appears to have been successful but actually was not 
	echo = -- as is the case here -- an anti-virus client could be the cause.
	echo = 
	echo = Currently the only known anti-virus conflict is Microsoft's Windows Defender.
	echo = 
	echo = Windows Defender will occasionally hold open a handle for a program 
	echo = after it has already finished executing. 
	echo = After a moment Windows Defender will release the handle.
	echo = However in that time the unzip can fail as it cannot overwrite in-use files.
	echo = 
	echo = Please wait a moment and then press a key to try the update again.
	echo = 
)
pause
echo.
goto tryunzip

:finished
REM Patch download.bat
REM
REM We're doing this in-place edit rather than a full replacement of the file
REM and the size of text we're replacing is the exact same so the command
REM parser which has already loaded download bat positions doesn't cough.
REM
REM Add DISABLEDELAYEDEXPANSION to fix #35:
REM 'Update fails if delayed expansion is enabled.'
bin\sed -e "1h;2,$H;$!d;g" -e "s/setlocal ENABLEEXTENSIONS\nset LC_ALL=C\n\nset SORTPROG=sort-7\.6\n\nREM GETGNUWIN32_ID is unique to this revision of download\.bat/setlocal ENABLEEXTENSIONS DISABLEDELAYEDEXPANSION\nset LC_ALL=C\n\nset SORTPROG=sort-7\.6\n\nREM GETGNUWIN32_ID is unique revision/" -i download.bat
if %ERRORLEVEL% NEQ 0 (
	echo = 
	echo = GetGnuWin32 cannot continue without its core files.
  echo = Download.bat could not be updated.
	echo = Quitting.
	goto bye
)
REM Fix switching to download.bat's directory
bin\sed -e "1h;2,$H;$!d;g" -e "s/REM switch to this file's directory\ncd \/d \"%%0\\\.\.\"/REM switch to this file's directory\ncd \/d \"%%~dp0\"/" -i download.bat
if %ERRORLEVEL% NEQ 0 (
	echo = 
	echo = GetGnuWin32 cannot continue without its core files.
  echo = Download.bat could not be updated.
	echo = Quitting.
	goto bye
)
REM Fix download.bat mirrors 2016-08-06
REM Replace iweb voxel with master netcologne heanet
REM
REM Separate mirrors for GNUWIN32_MIRROR by space.
REM At least two mirrors are needed for CTRL+C to work.
bin\sed -e "1h;2,$H;$!d;g" -e "s/\nif \.%%GNUWIN32_MIRROR%%==\. set GNUWIN32_MIRROR=iweb voxel\n\n::\n:: Process command line options.\n::\n/\nif \.%%GNUWIN32_MIRROR%%==\. set GNUWIN32_MIRROR=master netcologne heanet\n\n::\n:: Process options\n::\n/" -i download.bat
if %ERRORLEVEL% NEQ 0 (
	echo = 
	echo = GetGnuWin32 cannot continue without its core files.
  echo = Download.bat could not be updated.
	echo = Quitting.
	goto bye
)
REM GnuWin32 sed -i has a bug where it does not delete tmp sedXXXXXX files
del sed?????? 1>NUL 2>&1

REM Disable the unused info.exe to fix #34:
REM 'info.exe is a self spawning process on windows'
rmdir /s /q cygwin_addons 1>NUL 2>&1

if defined GNUWIN32_UPDATE_ONLY (
	echo = 
	echo = Command line option -u specified and the update check has finished.
	echo = Quitting.
	goto bye
)

if defined GNUWIN32_VERBOSE (
	echo = 
	echo = override.bat has finished verifying and updating core files.
	echo = Now restarting download.bat and skipping the update check.
	echo = 
)

endlocal

REM reset to workaround buggy GNUWIN32_MIRROR comparison in download.bat (158):
set GNUWIN32_MIRROR=
REM reset to workaround buggy GNUWIN32_LOAD comparison in download.bat (288):
set GNUWIN32_LOAD=

download.bat -d %GETGNUWIN32_ARGV%

:bye
endlocal
