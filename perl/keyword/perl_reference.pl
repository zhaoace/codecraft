#perl_reference.pl

$hello="hello";
$refhello=\$hello; #the location of $hello  


print "\$hello = $hello \n";
print "\$refhello = $refhello \n";
print "\$\$refhello = $$refhello \n";


$$hello = "hello world "; #change $hello by using refrence
print "\$hello = $hello \n";



$var = "name"; 
$$var = "ZhaoLi";

print "$name \n";

#perl_subFunc with reference
$ref = 2;
print " \$ref = $ref \n";
sub add{
	($x, $y , $ref ) =@_;
	$$ref=$x+$y;
}
add(3,4, \$ref);
print " \$ref = 3 + 4 = $ref \n";


