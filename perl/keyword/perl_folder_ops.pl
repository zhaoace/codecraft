#!/usr/bin/perl -w
#perl_folder_ops.pl
#opendir
#readdir
#closedir

use strict;
use warnings;

my $somedir="c:/Users/C5157466/EverBox/work\@SAP/CI/doing";
opendir (DH,$somedir) || die "can't opendir $somedir:$!";

foreach my $file (readdir DH){
	if(-d $file){ # -d means the $file is a dir.
		print "\nDir = ",$file;
		
	} else  {
		print "\nFile = ",$file;
	}
	
	if(-d $somedir.'/'.$file){
		print "\nDir = ",$somedir.'/'.$file;
	}
}
closedir DH;

print "\n\n\nxxxxxxxxxxxxxxxxxxxx\n\n";
&showfolders($somedir);




sub showfolders{
	my ($rootFolder  ) = @_;
	print "\nShow = ", $rootFolder;
	opendir (DH,$rootFolder) || die "can't opendir $somedir:$!";
	
	foreach my $file (readdir DH){
		if(-d "$rootFolder\/$file"){ # -d means the $file is a dir.
			unless($file eq '.' || $file eq '..'){
				print "\nDir  = ","$rootFolder\/$file";			
				print "\n\n Come into it! ";
				&showfolders("$rootFolder\/$file");
			} else{
				# print "\n This is system folder","$file\n";
			}
			
			#	&showfolders("$rootFolder\/$file");
			
		} else  {
			print "\nFile = ","$rootFolder\/$file";
		}
	}
}
