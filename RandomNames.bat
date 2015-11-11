@ECHO OFF
REM Authord David Ortiz-Vallejuelo
REM Feel free to use this code or to change anything
REM
REM adds a random number to the name of every file in the directory.
SET TranslationFile=__Translation.txt
SETLOCAL EnableExtensions EnableDelayedExpansion

	REM Rename files
	ECHO You are about to add a random number to the name of every file in the following folder:
	ECHO %~dp0
	ECHO.

	ECHO Type "OK" to continue.
	SET /P Confirm=
	IF /I NOT {!Confirm!}=={OK} (
		ECHO.
		ECHO Aborting :( .
		GOTO :EOF
	)
	ECHO Original Name/Random Name > %TranslationFile%
	ECHO ------------------------- >> %TranslationFile%
	FOR /F "tokens=*" %%A IN ('DIR /A:-D /B') DO (
		IF NOT %%A==%~nx0 (
			SET Use=%%~xA
			SET Name=%%~nA
			SET NewName=!RANDOM!-!Name!!Use!
			ECHO %%A/!NewName!>> %TranslationFile%
			RENAME "%%A" "!NewName!"
			
		)
	)


