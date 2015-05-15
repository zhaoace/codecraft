@echo off

call:setMavenOPTS

call:verifyMavenOPTS

call:cleanMaven

call:fortifyTranslate

call:fortifyScan

call:fortifyResultFPRtoPDF

call:fortifyUploadResulToF360

call:collectLogs

echo. &pause &goto:eof




::--------------------------------------------------------
::-- Function section starts below here
::--------------------------------------------------------
:setMavenOPTS
	REM echo "setMavenOPTS"
	set MAVEN_OPTS=-Xms2048m -Xmx4096m -XX:MaxPermSize=1024M
	goto:eof

:verifyMavenOPTS
	REM echo "verifyMavenOPTS"
	echo MAVEN_OPTS=%MAVEN_OPTS%
	goto:eof

:cleanMaven
	REM echo "cleanMaven"
	mvn clean | tee mvn_clean.log
	goto:eof

:fortifyTranslate
	REM echo "fortifyTranslate"
	mvn fortify:translate  | tee mvn_fortify_translate.log
	goto:eof

:fortifyScan
	REM echo "fortifyScan"
	mvn fortify:scan | tee mvn_fortify_scan.log
	goto:eof

:fortifyResultFPRtoPDF
	REM echo "verifyMavenOPTS"
	call pdfResult.bat
	goto:eof

:fortifyUploadResulToF360
	REM echo "verifyMavenOPTS"
	mvn fortify:upload -Dldi.fortify.f360.projectVersion=5.16.0-SNAPSHOT -Dldi.fortify.f360.authToken=b1ee416a-353c-4e94-b40e-f9d59c2c7ce5 -Dldi.fortify.f360.url=https://fortify1.wdf.sap.corp/ssc  | tee mvn_fortify_upload.log
	goto:eof


:collectLogs
	REM echo "collectLogs"
	type mvn_clean.log   > mvn_all.log
	type mvn_fortify_translate.log   >> mvn_all.log
	type mvn_fortify_scan.log   >> mvn_all.log
	type mvn_fortify_upload.log   >> mvn_all.log
	goto:eof






