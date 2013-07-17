#perl_array_list.pl
use strict;
use warnings;

#('asdf','123','ssss');
#qw (123 222 333);
#qw  /123 33 222/;
#qw !asd abc ss!;
my @books = ('xxx','yyy','zzz');

#@books = qw ! '111' '222' '333'!;
@books = qw('111' '222' '333');


my @coordinate;
@coordinate = (
[1,2],
[3,4],
[3,1]
);


my @mynum = (0..10);
my @myalpha = ('a'..'z');
@myalpha = ('A'..'Z');

print $mynum[3]."\n" ;
$mynum[3] = 1909;
print $mynum[3]."\n" ;

print "scalar(\@myalpha) =scalar(@myalpha) = ".scalar(@myalpha)."\n";

my $cs;
for $cs (0..scalar(@ARGV)-1){
	print $ARGV[$cs]."\n";
}
