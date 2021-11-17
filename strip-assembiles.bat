@echo off 
set exePath=%1
echo exePath: %exePath% 

set managedPath=%exePath:OuterWilds.exe=OuterWilds_Data\Managed% 
echo managedPath: %managedPath%

%~dp0\tools\NStrip.exe %managedPath% -o "%~dp0\package\lib\net46"

pause
