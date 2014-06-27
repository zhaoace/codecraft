

REM echo "========= set env ================="
set path=C:\Program Files\Perforce;%path%

set P4Port=perforceserver1.pgdev.sap.corp:1971
set p4user=i015571
set p4passwd=Jonex@42
set p4client=autopush_i015571_PVGD50798664A


REM echo "========= login p4 ================="
echo %p4passwd%|p4 login

