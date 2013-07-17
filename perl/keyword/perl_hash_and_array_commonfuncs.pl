#perl_hash_and_array_commonfuncs.pl
use strict;
use warnings;

my %hash =(
	'hello'=> 1,
	'world'=> 2,
);
my @arr = ('hellow,world', 1,2,3);


print %hash; 
print "\n";
print @arr;  
print "\n";

delete $hash{"hello"};
delete $arr[1];

print %hash; 
print "\n";
#print @arr; #error for null of arr[1]
print "\n";


%hash =(
	'hello'=> 1,
	'world'=> 2,
	'me'=> 3,
);
@arr = ('hellow,world', 1,2,3);

#can't use?
#foreach $key (keys %hash){
#	delete %hash{$key};
#};

delete @hash{keys %hash};
delete @arr[0..$#arr];

%hash=();
@arr = ();
print "#empty hash and arr \n";




#±éÀúhash
%hash = (
	'do' => 'µ¹',
	're' => 'Èí',
	'mi' => 'Ã×' ,
	'fa' => '·¨' 
);
@arr = (
	'b','e','a','d','c',
);
print %hash;
print "\n";

while((my $key ,my $value)=each %hash){
	print "$key => $value \n";
}

while ((my $index,my $element)=each @arr){
	print "$index=>$element \n";
};

#each values keys sort
for my $value (values %hash){
print $value;
}
print "\n";

for my $key (keys %hash){
print $key;
}
print "\n";

print @arr;
print "\n";
@arr =  sort @arr;
print @arr;
print "\n";

#push pop shift unshift
print "before push:";
print @arr;
print "\n";
#print "pushing:"
#print push @arr,("x","y","z");
push @arr,("x","y","z");
print "after push xyz:";
print @arr;
print "\n";
print "poping :";
print pop @arr;
print "\nafter pop:";
print @arr;

pop @arr;
pop @arr;
print "\n";
print @arr;
print "\n";

print "unshifting:";
print unshift @arr,('1','2',3);
print "\nAfter unshift: ";
print @arr;
print "\n";



print "\nShift:";
print shift @arr;
print "\nAfter shift:";
print @arr,"\n";




