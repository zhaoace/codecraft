REM _get_pending_changlist.bat

FOR /F "tokens=2" %%A IN ('p4 changes -m 1 -u %p4user% -c %p4client%') DO ECHO %%A > output\PENDING_CHANGELIST.txt
