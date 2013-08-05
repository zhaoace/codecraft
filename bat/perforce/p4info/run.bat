REM echo "========= set env ================="
REM set path=C:\Program Files\Perforce;%path%
REM 
REM set P4Port=
REM set p4user=
REM set p4passwd=
REM set p4client=
REM
REM echo "========= login p4 ================="
REM echo %p4passwd%|p4 login



call saponly_env.bat


IF EXIST bin RD /s/q bin
MD bin 
CD bin

echo "sdk2013july"       > sdk2013july.txt
echo "chart2013july"     > chart2013july.txt
echo "geo2013july"       > geo2013july.txt
echo "container2013july" > container2013july.txt



p4 changes -s submitted //components/sap.viz.sdk/trunk/dev/...@2013/07/01,@2013/07/30       >> sdk2013july.txt
p4 changes -s submitted //components/sap.viz.api/trunk/dev/...@2013/07/01,@2013/07/30       >> sdk2013july.txt

p4 changes -s submitted //components/sap.viz/trunk/dev/...@2013/07/01,@2013/07/30           >> chart2013july.txt

p4 changes -s submitted //components/sap.viz.geo/trunk/dev/...@2013/07/01,@2013/07/30       >> geo2013july.txt

p4 changes -s submitted //components/sap.viz.container/trunk/dev/...@2013/07/01,@2013/07/30 >> container2013july.txt
p4 changes -s submitted //components/sap.viz.controls/trunk/dev/...@2013/07/01,@2013/07/30  >> container2013july.txt




cd ..

