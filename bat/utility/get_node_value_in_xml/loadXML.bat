echo off
set NODE=version
set XML=pom.xml

for /f "tokens=2 delims=>" %%i in ('findstr "<%NODE%>" %XML%') do (
    for /f "delims=<" %%i in ("%%i")do (
        echo GAV_version=%%i
        echo on
        goto :eof
    )
)
