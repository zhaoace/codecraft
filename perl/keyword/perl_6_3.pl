#!/usr/bin/perl perl
# perl_6_3.pl



print "\n";
$x=0;
$x==0 ? print "x=0" : print "x!=0";

print "\n";
$x=1;
$x==0 ? print "x=0" : print "x!=0";
print "\n";




$x=-1;

print "\n \$x=-1";
print "\nif -1>0" if $x>0;
print "\n&& -1>0" && $x>0;
print "\nunless -1>0" unless $x>0;
print "\n|| -1>0" || $x>0;

$x=1;
print "\n \$x =1";
print "\nif 1>0" if $x>0;
print "\n&& 1>0" && $x>0;
print "\nunless 1>0" unless $x>0;
print "\n|| 1>0" || $x>0;