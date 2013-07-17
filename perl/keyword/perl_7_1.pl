#!/usr/bin/perl perl
# perl_7_1.pl


print "\n..............\$x\n" ;
while($x++<3){
print "\$x=".$x."\n";
}

print "\n..............\$y \n" ;
print "\$y=".$y."\n" while ($y++<3);


print "\n..............\$z \n" ;
do{
print "\$z=".$z."\n";
} while ($z++ <3);


print "\n..............until \$a++>3 \n" ;
until ($a++ > 3) {
	print "\$a=".$a."\n";

}

print "\$b=".$b."\n" until $b++ >3;


print "\n..............until \$c++>3 \n" ;
do{
	print "\$c=".$c."\n";
}until ($c++ > 3) ;



@xArray = ( 1, 4, 23 ,9 ,5) ;
for $xx (@xArray) { print $xx."\n" ;}


for (@xArray) {
print $_;
}

