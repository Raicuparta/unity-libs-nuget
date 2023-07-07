@echo off 

@REM Add all the assemblies you want to publicize in this list
set toPublicize=Assembly-CSharp.dll Assembly-CSharp-firstpass.dll

@REM Add all the assemblies you want to copy as-is to the package in this list
set dontTouch=

set exePath=%1
echo exePath: %exePath% 

@REM Remove quotes
set exePath=%exePath:"=%

set managedPath=%exePath:.exe=_Data\Managed%
echo managedPath: %managedPath%

set outPath=%~dp0\package\lib

@REM Strip all assembiles, but keep them private.
%~dp0\tools\NStrip.exe "%managedPath%" -o %outPath%

@REM Strip and publicize assemblies from toPublicize.
(for %%a in (%toPublicize%) do (
  echo a: %%a

  %~dp0\tools\NStrip.exe "%managedPath%\%%a" -o "%outPath%\%%a" -cg -p --cg-exclude-events
))

@REM Copy over original assemblies for ones we don't want to touch.
(for %%a in (%dontTouch%) do (
  echo a: %%a

  xcopy "%managedPath%\%%a" "%outPath%\%%a" /y /v
))

pause
