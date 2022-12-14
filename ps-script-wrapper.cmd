@echo off

:: Execute the PS1 file with the same name as this batch file.
set filename=%1

if exist "%filename%" (
  PowerShell.exe -NoProfile -NonInteractive -File "%filename%" "%2"
	
  :: Collect the exit code from the PowerShell script.
  set err=%errorlevel%
) else (
  echo File not found.
  echo %filename%
 
  :: Set our exit code.
  set err=1
)

:: Pause if we need to.
if [%1] neq [/nopause] pause

:: Exit and pass along our exit code.
exit /B %err%