@echo off 
set exePath=%1
echo exePath: %exePath% 

@REM Remove quotes
set exePath=%exePath:"=%

set managedPath=%exePath:OuterWilds.exe=OuterWilds_Data\Managed%
echo managedPath: %managedPath%

set outPath=%~dp0\package\lib\net46
set publicizedStripParams=-cg -p --cg-exclude-events

@REM Strip all assembiles, but keep them private.
%~dp0\tools\NStrip.exe "%managedPath%" -o %outPath%


echo %~dp0\tools\NStrip.exe "%managedPath%\Assembly-CSharp.dll" -o "%outPath%" %publicizedStripParams%

@REM Strip and publicize Assembly-CSharp.
%~dp0\tools\NStrip.exe "%managedPath%\Assembly-CSharp.dll" -o "%outPath%\Assembly-CSharp.dll" %publicizedStripParams%
%~dp0\tools\NStrip.exe "%managedPath%\Assembly-CSharp-firstpass.dll" -o "%outPath%\Assembly-CSharp-firstpass.dll" %publicizedStripParams%

pause
