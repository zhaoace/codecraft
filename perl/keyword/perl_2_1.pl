$str="String here.";

print "\n$str\n";
print '\n$str\n';

#+-*/%


open(FH,'<C:\Users\C5157466\EverBox\work@SAP\CI\doing\sca_diff\template_sca_diff_flex.xsl');
@fileContext = <FH>;
print "\@fileContext = @fileContext";
foreach $line (@fileContext){
	print $line;
	print $line;
}
close FH;


