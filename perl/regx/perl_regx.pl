#perl_regx.pl
use strict;
use warnings;


my $name;
my $regx;
my $regx2;
$name='zhaoli zhaograce zhaowudi zhaoace';
$regx='zh.*?e';
if( $name=~m/\s($regx)/){
	print "\$1 = $1 \n";
}



$name = 'aBbcc';
$regx = 'b';
if( $name=~m/$regx/){
	print "$regx is match in $name" ,"\n";
}else {
	print "$regx is not match in $name";
}

my $regxResult =  $name=~m/$regx/;
print "\$regxResult = $regxResult\n";

# replacement
$name='zhaoli zhaojiang zhaograce zhaoace';
$regx='\w';
$name=~s/$regx/xxxx/;
print "\$name=$name\n";

$name=~s/$regx/xxxx/g;
print "\$name=$name\n\n";


# 正则转换 
$name='zhaoli zhaojiang zhaograce zhaoace';
$regx='[a-z]';
$regx2='[A-Z]';
#$name!~tr/$regx/$regx2/; 这是没有用的
#print "\$name=$name\n";
$name!~tr/[abcde]/[12345]/ if print "\$name=$name\n";
$name!~tr/[a-z]/[A-Z]/  if  print "\$name=$name\n";

 
 
# 捕捉正则匹配的内容。
$name='zhaoli zhaowudi zhaograce zhaoace';
$regx='zh.*?e';
if( $name=~m/($regx)/){
	print "$name is match $regx\n";
	print "$1\n";
}


$name='zhaoli zhaograce zhaowudi zhaoace';
$regx='zh.*?e';
if( $name=~m/(?<pname1>\w+)(?:\s)($regx)/){
	print "xxxxxxxxx\n";
	print "$+{pname1} ==> $2 \n";
}



my $names='hello! deep and future';
if($names=~m/!\s(\w+)/){
	print "\$1=$1 \n";
	print $` ,"\n";
	print $& ,"\n";
	print $' ,"\n";
}



# 反引用
my $txt = 'xyabz123abc123'; 
if( $txt =~m/(.+)(.+)(\1)/){
	print "\$1=$1 \n";
	print "\$` =",$` ,"\n";
	print "\$& =",$& ,"\n";
	print "\$' =",$' ,"\n";	
}

#test找到重复的内容
$name='zhaoli zhaowudi zhaograce zhaoace';
$regx='';
if( $name=~m/$regx/){
	print "\n$name is match $regx\n";
	print "$1\n";
	print "\$` =",$` ,"\n";
	print "\$& =",$& ,"\n";
	print "\$' =",$' ,"\n";	
}





