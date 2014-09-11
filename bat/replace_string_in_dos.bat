
echo off

set BASE_STR=c:\anywhere\yes\or\no
set TAKEN=o
set VALUE=bbbb
Setlocal Enabledelayedexpansion
for /f "delims=*" %%a in ("%BASE_STR%") do (
set a=%%a
set a=!a:%TAKEN%=%VALUE%!
set x=!a!
)
echo !a!


REM echo "DEMO for replace \ with / "
set TAKEN=\
set VALUE=/
Setlocal Enabledelayedexpansion
for /f "delims=*" %%a in ("%BASE_STR%") do (
set a=%%a
set a=!a:%TAKEN%=%VALUE%!
set x=!a!
)
echo %x%


echo on