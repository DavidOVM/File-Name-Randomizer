@ECHO OFF

REM Randomly renames every file in a directory.

SETLOCAL EnableExtensions EnableDelayedExpansion

	REM Rename files
	ECHO You are about to add a random number to the name of every file in the following folder:
	ECHO %~dp0
	ECHO.

	ECHO Type "OK" to continue.
	SET /P Confirm=
	IF /I NOT {!Confirm!}=={OK} (
		ECHO.
		ECHO Aborting.
		GOTO :EOF
	)


	FOR /F "tokens=*" %%A IN ('DIR /A:-D /B') DO (
		IF NOT %%A==%~nx0 (
			
				SET Use=%%~xA
				SET Name=%%~nA
				
				SET NewName=!RANDOM!-!Name!!Use!
				
				RENAME "%%A" "!NewName!"
			
		)
	)


