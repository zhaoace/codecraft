#!/usr/bin/perl -w
#delete_old_files.pl
#delete the files which older than $deadline YYYYmmDD   in path $rootFolder 
use strict;
use warnings;

our $deadline = 20120102;
my $rootFolder='//shg-s-fs02.pgdev.sap.corp/Share/CI_Report_Logs';

opendir (DIR,"$rootFolder") or die "could not open $rootFolder";

&showfolders($rootFolder);
__import__('shutil').rmtree($rootFolder);
closedir DIR;

sub showfolders{
	my ($rootFolder  ) = @_;
	opendir (DH,$rootFolder) || die "can't opendir $rootFolder:$!";	
	foreach my $file (readdir DH){
		($file eq '.') and next;
		($file eq '..') and next;
		if(-d "$rootFolder\/$file"){ # -d means the $file is a dir.
			&showfolders("$rootFolder\/$file");							
		} else {
			# delete the file is too old.			
			# print "$rootFolder\/$file:",&getFileAtime("$rootFolder\/$file"),"\n";
			&isTooOld("$rootFolder\/$file");
		}
	}
}


sub isTooOld{
  my ( $filename )=@_;
  my $mtime = &getFileAtime($filename );
  
  my ($year,$month,$day) = split ( /-/ ,$mtime) ;
  
  print "\$filename " ,"  $filename  \n" ;
  print "File create name = " ,"  $year,$month,$day \n" ;  
  
  if ($year.$month.$day < $deadline   ){
	unlink $filename;	
    print "\$Delete!!  filename " ,"  $filename  \n\n" ;	
  };
  
  
}

sub getFileAtime{
  my ( $filename )=@_;
  my @array = stat($filename); 
 
  my ($sec,$min,$hour,$mday,$mon,$year) = (localtime($array[9]))[0..5];  
  ($sec,$min,$hour,$mday,$mon,$year) = (
 	   sprintf("%02d", $sec),
 	   sprintf("%02d", $min),
 	   sprintf("%02d", $hour),
  	  sprintf("%02d", $mday),
 	   sprintf("%02d", $mon + 1),
 	   $year + 1900
	);
  
  my $mtime = "$year-$mon-$mday";
  
}



