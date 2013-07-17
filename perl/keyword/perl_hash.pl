#perl_hash.pl
use strict;
use warnings;

my %alphabet = ('a'=> 'apple','b'=>'ball','c'=>'cat');
print $alphabet{'a'}."\n";

my %oldhash = (  'key1'=>'value1','key2'=>'value2','key3'=>'value3');
print "\$oldhash{'key1'} = $oldhash{'key1'} \n";

my %newhash ;
%newhash = reverse %oldhash;
print "\$newhash{'value1'} = $newhash{'value1'} \n";
#print "%newhash\n ";

#mupile hash  : 3 kinds to setup.
#1
my %student ;
%student = (
	'zhaoli'  => { 'english'=>99, 'math'=>88,'codeing'=>77 },
	'jindong' => { 'english'=>22, 'math'=>33,'codeing'=>44 }
);

print "\$student{'zhaoli'}{'math'} = ".$student{'zhaoli'}{'math'}."\n";
print "\$student{'jindong'}{'codeing'} = ".$student{'jindong'}{'codeing'}."\n";

#2
my %books;
$books{"xiaoshuo"} = {1 => 'fanrenxiuxian', 2 => 'woyuditan', 3 => 'jinlingqishichizhongwu', };
$books{"coding"} = { 1 => 'cleancode', 2 => 'hackhehuajia', 3 => 'thinkinginjava', };
$books{"other"} = { 1 => 'fanghzognshu', 2 => 'chedan', 3 => 'nb', };

print "\$books{'coding'}{1} = ".$books{'coding'}{1}."\n";


#3
my %tests ;
my %cj = (1=>'xxx',2=>'yyy',3=>'zzz');
$tests{'chars'} = \%cj;
my %cj = (1=>123,2=>234,3=>345);
$tests{'numbers'} = \%cj;
my %cj = (1=>'love',2=>'hate',3=>'peace');
$tests{'words'} = \%cj;
print "\$tests{'chars'}{3} = ".$tests{'chars'}{2}."\n";
print "\$tests{'numbers'}{1} = ".$tests{'numbers'}{1}."\n";
print "\$tests{'words'}{3} = ".$tests{'words'}{3}."\n";






