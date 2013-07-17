
$x = 1;
$y = 2;

print 
" $x + $y" if $x <10 and $y >1  ; 
" $x  $y" if $x <1 and $y >2  ; 


open STUDY1 ,'<C:\Users\C5157466\EverBox\knowledge\codes\perl\study01.pl';
open STUDY2OUT,'>C:\Users\C5157466\EverBox\knowledge\codes\perl\study2_out.txt';

@study1_pl = <STUDY1>;
print STUDY2OUT "@study1_pl";

close STUDY1;
close STUDY2OUT;
