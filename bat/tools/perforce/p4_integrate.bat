REM echo "========= set env ================="
set path=C:\Program Files\Perforce;%path%

set P4Port=perforceserver1.pgdev.sap.corp:1971
set p4user=
set p4passwd=
set p4client=
set TARGETCHANGELIST=


REM echo "========= login p4 ================="
echo %p4passwd%|p4 login

REM echo "==========  perpare for  changelist ================="
echo "Change: new" >> %tempChangeFile%
echo "Client: %p4client%" >> %tempChangeFile%
echo "User: %p4user%" >> %tempChangeFile%
echo "Status: new" >> %tempChangeFile%
echo "Description:" >> %tempChangeFile%
echo "==Summary*: Force integrate with REL by script. " >> %tempChangeFile%
echo "==Reviewed by*: Han,Chengkai  " >> %tempChangeFile%



REM echo "========= create changelist  ================="
p4 change -i < %tempChangeFile%
FOR /F "tokens=2" %%A IN ('p4 changes -m 1 -u %p4user% -c %p4client%') DO SET LASTCHANGELIST=%%A 
SET CHANGELIST=%LASTCHANGELIST%


REM echo "========= set branch  ================="
SET FROMBRANCH=//components/sap.viz/4.0/REL/Test/functional/testing/data/output/cvom.charts.html5viz/standard/...
SET TARGETBRANCH=//components/sap.viz/trunk/dev/Test/functional/testing/data/output/cvom.charts.html5viz/standard/...
p4 sync %TARGETBRANCH%
p4 integrate -o  -c %CHANGELIST%  %FROMBRANCH%@%TARGETCHANGELIST%  %TARGETBRANCH%
p4 resolve -at -dl %TARGETBRANCH%


REM if exist %tempChangeFile% del %tempChangeFile%
REM p4 submit -c %CHANGELIST%
REM p4 change -d %CHANGELIST%