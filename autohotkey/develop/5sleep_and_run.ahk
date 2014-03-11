;------------ startup progress after time
second = 1000 
one_minute := 60*second
two_minute := 2*one_minute


Sleep , %two_minute% ; 

Run   , "C:\Program Files\Sublime Text 2\sublime_text.exe"
Run   , "C:\Program Files\totalcmd\TOTALCMD64.EXE"
Run   , OUTLOOK
Run   , Chrome
Run   , "http://shg-cvom-ci.dhcp.pgdev.sap.corp/user/zhaoli/my-views/view/Zhao,Li's view/?"

