#perl_5_3.pl
if( 3<5 ){ 	print "\n 3<5 \n " ; }
if( 6>5 ){ 	print "\n 6>5 \n " ; }
if( 6>=5 ){ 	print "\n 6>=5 \n " ; }
if( 6!=5 ){ 	print "\n 6!=5 \n " ; }
#if( 6 =6 ){ 	print "\n 6 =6 \n " ; }
if( 6 ==6 ){ 	print "\n 6==6 \n " ; }
if( 6 <=> 6){ 	print "\n 6<=>6 \n " ; }

print "\n  5<=>6 = ";
print 5<=>6;
print "\n  6<=>6 = ";
print 6<=>6;
print "\n  6<=>5 = ";
print 6<=>5;
#print "\n  5 = 5 = ";
#print 5 = 5;
#print "\n  6 = 5 = ";
#print 6 = 5;
print "\n";

if ( 'aaa' lt 'bbb' ) { print "\n aaa lt bbb \n";}
if ( 'aaa' le 'bbb' ) { print "\naaa le bbb\n";}
if ( 'aaa' le 'aaa' ) { print "\n aaa le aaa\n";}
if ( 'aaa' eq 'aaa' ) { print "\n aaa eq aaa\n";}
if ( 'ccc' gt 'bbb' ) { print "\nccc gt bbb \n";}
if ( 'ccc' ge 'bbb' ) { print "\nccc ge bbb \n";}
#if ( 'ccc' ne 'ccc' ) { print "\nccc ne ccc \n";}
if ( 'ddd' ne 'ccc' ) { print "\n ddd ne ccc \n";}

print "\n aaa cmp bbb = ";
print ('aaa'cmp'bbb') ;
print "\n bbb cmp bbb = ";
print ('bbb'cmp'bbb') ;
print "\n ccc cmp bbb = ";
print ('ccc'cmp'bbb') ;
print "\n";











