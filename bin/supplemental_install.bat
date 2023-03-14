@echo off
setlocal ENABLEEXTENSIONS DISABLEDELAYEDEXPANSION

set GETGNUWIN32_ID=94d563d1564001

REM switch to this file's directory
cd /d "%~dp0" 1>NUL 2>&1
if not exist revision_%GETGNUWIN32_ID% (
	echo = 
	echo = Unique ID revision_%GETGNUWIN32_ID% not found. Probable solution:
	echo = Please switch to the getgnuwin32 directory before running this script.
	echo = 
	echo = supplemental_install.bat cannot continue.
	goto bye
)

echo.
echo Author's note (Jay Satiro ^<raysatiro@users.sourceforge.net^>^) :
echo.
echo Last updated December 26, 2017
echo.
echo WARNING: GnuWin32 has not been updated in several years. I have left this
echo script and our GetGnuWin32 downloader functional for legacy purposes. If you
echo need the latest packages consider using MSYS2 MINGW or Cygwin instead.
echo.
echo Some of the packages available with the gnuwin32 project are wildly outdated.
echo I have compiled more recent builds of the following utilities:
echo.
echo UnZip 6.00, OpenSSL 1.0.2n, Wget 1.12.1-dev, Sort 7.6
echo.
set GNUWIN32_RESPONSE=yes
echo Would you like more information? [yes]
REM echo yes
REM echo Hit enter. If you do not type the word yes and instead just hit enter, you will
REM echo not receive more information or an option to install these optional utilities.
set /p GNUWIN32_RESPONSE=
if not "%GNUWIN32_RESPONSE%"=="yes" (
	echo Additional information was not requested.
	goto byewarn
)
echo.
echo UnZip 6.00; unzip.exe (2009-04-20^) (bugfixes, security fixes^)
echo ^^ Suggested replacement for GnuWin32 UnZip 5.51 of May 2004
echo.
echo OpenSSL 1.0.2n; all binary files (2017-12-07^) (bugfixes, security fixes^)
echo ^^ Suggested replacement for GnuWin32 OpenSSL 0.9.8h of May 2008
echo.
echo Wget 1.12.1-dev; wget.exe (2010-06-23^) (bugfixes, security fixes^)
echo ^>^> No international support, and english help text only.
echo ^>^> Built from wget mainline 013c8e2f5997 2010-03-04
echo ^^^^ Suggested replacement for GnuWin32 Wget 1.11.4 of Jun 2008
echo.
echo Bundle of CA Root Certificates; cacert.pem (2017-09-20^)
echo ^>^> Extracted from Mozilla Certificate Authorities list.
echo ^^^^ Suggested replacement for ^<unknown^>
echo.
echo Sort 7.6 testbuild; sort-7.6.exe (2009-09-11^) (bugfixes^)
echo ^>^> Properly supports LC_ALL environment variable. Test build.
echo ^^^^ Suggested supplement to GnuWin32 Sort 5.3.0 of April 2005
echo.
echo.
set GNUWIN32_RESPONSE=yes
echo Would you like to install these utilities? [yes]
REM echo yes
REM echo Hit enter. If you do not type the word yes and instead just hit enter,
REM echo those utilities will not be supplemented/replaced.
set /p GNUWIN32_RESPONSE=
if not "%GNUWIN32_RESPONSE%"=="yes" (
	echo Supplemental installation was not requested.
	goto byewarn
)

echo.
echo Please type the existing directory you want to install to and hit enter.
set GNUWIN32_RESPONSE=%*
if not defined GNUWIN32_RESPONSE goto getdir

set GNUWIN32_RESPONSE=%GNUWIN32_RESPONSE:"=%
echo ["%GNUWIN32_RESPONSE%"]
echo If it is the directory above that's in brackets, you can just hit enter.

:getdir
set GNUWIN32_RESPONSE=placeholder123
set /p GNUWIN32_RESPONSE=
if "%GNUWIN32_RESPONSE%"=="placeholder123" set GNUWIN32_RESPONSE=%*
if not defined GNUWIN32_RESPONSE (
	echo.
	echo Error: You must choose a directory location.
	goto byewarn
)
set GNUWIN32_RESPONSE=%GNUWIN32_RESPONSE:"=%

mkdir "%GNUWIN32_RESPONSE%" >NUL 2>&1

if not exist "%GNUWIN32_RESPONSE%" (
	echo.
	echo Error: Directory does not exist:
	echo "%GNUWIN32_RESPONSE%"
	goto byewarn
)

REM test ability to write to directory
set GNUWIN32_RANDFILE=%GETGNUWIN32_ID%%RANDOM%.tmp
touch "%GNUWIN32_RESPONSE%\%GNUWIN32_RANDFILE%" >NUL 2>&1
if not exist "%GNUWIN32_RESPONSE%\%GNUWIN32_RANDFILE%" (
	echo.
	echo Error: Cannot write to directory:
	echo "%GNUWIN32_RESPONSE%"
	goto byewarn
)
del "%GNUWIN32_RESPONSE%\%GNUWIN32_RANDFILE%" >NUL 2>&1

REM unzip -u -o -q "supplement.zip" -d "%GNUWIN32_RESPONSE%"

FOR /f "tokens=*" %%A IN (supplemental_list.txt) DO (
REM xcopy /D /V /Y "%%A" "%GNUWIN32_RESPONSE%\%%A"
REM in testing xcopy can hang on WrLpcReply...
REM found it, xcopy tries to display similar to below on console but 
REM it appears hidden for whatever reason when run from a batch file:
REM Does C:\whatever\bin\t specify a file name
REM or directory name on the target
REM (F = file, D = directory)?
copy /Y "%%A" "%GNUWIN32_RESPONSE%\%%A" >NUL
	if errorlevel 1 (
		echo Warning: "%%A" could not be copied to "%GNUWIN32_RESPONSE%"
		goto byewarn
	) else (
		echo Copied file "%%A"
	)
)

echo.
echo Done replacing utilities.
echo Done installing supplemental utilities.
echo Invocation examples for supplemental utilities:
echo.
echo sort-7.6 --help
echo.
echo ! Please note that previous versions of this program installed the latest 
echo ! wget as a supplement (wget-1.12.exe^). The latest version of wget now 
echo ! replaces its older version. Invoke it the same as you otherwise would.
echo ! For example:
echo wget --version
goto bye

:byewarn
echo.
echo The supplemental utilities could not be installed.
echo To try later run supplemental_install.bat in GetGnuWin32's bin directory.
echo %CD%
:bye
echo.
echo Ending supplemental install.
pause
endlocal
