use strict;
use warnings;

my $fileIn ='input.txt';
my $fileOut ='input.txt';
my $input ='aaa';
my $output ='xxx';

my $myline;



open FI,"<$fileIn";
my @mytext=<FI>;
$|= 1;
foreach $myline (@mytext){
	#print "\n \$myline=".$myline ;		
	$myline=~s/aaa/xxx/;	
}
close FI;


#write to file.
open FO,">$fileOut";
#print @mytext;
print FO @mytext;
close FO;