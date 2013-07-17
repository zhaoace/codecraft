#read_write_demo.pl
use 5.010;

$fileIn = 'e:\andy.zhao\knowledge\codes\perl\read_and_write\input.txt';
$fileOut = 'e:\andy.zhao\knowledge\codes\perl\read_and_write\output.txt';


#read at one time
open FI,"<$fileIn";
@mytext=<FI>;
$|= 1;
foreach $myline (@mytext){
	print "\n \$myline=".$myline ;
	
	@folder = (split  /\\/, $myline);
	print "folder ";
	for $myfolder (@folder) {		
		print "$myfolder"."+";
	}	
}
close FI;

#read only a line at one time.
open FI,"<$fileIn";
print "\n"."\$fileIn  \n";
for $myline(<FI>) {
	print $myline;
}
close FI;

#write to file.
open FO,">$fileOut";
print FO "just a test;
just another test.";
close FO;


