@echo off
setlocal

set REPOSITORY=origin
set REFSPEC=main

set "SCRIPT_DIR=%~dp0"
set "DOTFILESPATH=%SCRIPT_DIR%.."

set "MESSAGE=Update from %COMPUTERNAME% at %DATE% %TIME%"
set "NODENAME=%COMPUTERNAME%"
set "KERNELRELEASE=%OS%"

git fetch -v %REPOSITORY%
git merge -v %REPOSITORY%/%REFSPEC%

endlocal
