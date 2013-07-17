#perl_hash_and_array.pl
use strict;
use warnings;

my %hash1 = (
	'key1' => [1 ,2 ,3 ,4],
	'key2' => ['a1','n2','v3'],
);

print "\$hash1{'key2'}->[2]=".$hash1{'key2'}->[2]."\n";


#
my @myarray = (
	{'hash1'=>1,'hash2'=>2,'hash3'=>3},
	{'hash1'=>'a1','hash2'=>'b2','hash3'=>'c3'},
);

print "\$myarray[1]{'hash1'} = ".$myarray[1]{'hash3'}."\n";


#
my @innerArray1 = (1..10);
my @innerArray2 = ('a'..'z');
my @outArray = (\@innerArray1,\@innerArray2);

print "\$outArray[1][1] = ".$outArray[1][1]."\n";


