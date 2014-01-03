REM _login_p4.bat


REM echo "========= set env ================="
set path=C:\Program Files\Perforce;%path%

set P4Port=
set p4user=
set p4passwd=
set p4client=


REM echo "========= login p4 ================="
echo %p4passwd%|p4 login

