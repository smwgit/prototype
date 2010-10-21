#!/usr/bin/perl
use strict;

open (INFILE, "vars");
open (OUTFILE, ">varTH");

while (<INFILE>)
{
    chomp (my $line = $_);
    
      $line =~ s/^ +t.+ :(.+)/<th>$1 <\/th>/;
      print OUTFILE "$line\n";
}

close INFILE;
close OUTFILE;
