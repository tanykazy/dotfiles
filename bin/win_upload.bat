@echo off
setlocal

set REPOSITORY=origin
set REFSPEC=main

set "SCRIPT_DIR=%~dp0"
set "DOTFILESPATH=%SCRIPT_DIR%.."

set "OPERATINGSYSTEM=%OS%"
set "MACHINE=%PROCESSOR_ARCHITECTURE%"
set "MESSAGE=Update from %MACHINE% %OPERATINGSYSTEM% at %DATE% %TIME%"

git add -v "%DOTFILESPATH%"
git commit -v -m "%MESSAGE%"
git push -v %REPOSITORY% %REFSPEC%:%MACHINE%/%OPERATINGSYSTEM%

endlocal
