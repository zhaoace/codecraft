#perl_4_1.pl

sub add {
	my($x,$y,$z) =@_;
	$x+$y;
	$x+$y+$z;
}

print &add(4,5,6);



print "\n\n";
print 4.7*0.7 + 4.8* 0.25 +  4.3*0.05 ;