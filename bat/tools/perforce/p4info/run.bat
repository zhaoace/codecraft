
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



echo "sdk2013Dec"       > sdk2013Dec.txt
echo "chart2013Dec"     > chart2013Dec.txt
echo "geo2013Dec"       > geo2013Dec.txt
echo "container2013Dec" > container2013Dec.txt



p4 changes -s submitted //components/sap.viz.sdk/trunk/dev/...@2013/11/01,@2013/11/30       >> sdk2013Dec.txt
p4 changes -s submitted //components/sap.viz.api/trunk/dev/...@2013/11/01,@2013/11/30       >> sdk2013Dec.txt

p4 changes -s submitted //components/sap.viz/trunk/dev/...@2013/11/01,@2013/11/30           >> chart2013Dec.txt
p4 changes -s submitted //components/sap.viz.chart/trunk/dev/...@2013/11/01,@2013/11/30     >> chart2013Dec.txt

p4 changes -s submitted //components/sap.viz.geo/trunk/dev/...@2013/11/01,@2013/11/30       >> geo2013Dec.txt	

p4 changes -s submitted //components/sap.viz.container/trunk/dev/...@2013/11/01,@2013/11/30 >> container2013Dec.txt
p4 changes -s submitted //components/sap.viz.controls/trunk/dev/...@2013/11/01,@2013/11/30  >> container2013Dec.txt


cd ..
:end  



