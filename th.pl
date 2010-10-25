#!/usr/bin/perl
use strict;

open (INFILE, "vars");
open (OUTFILE, ">varAcc");

while (<INFILE>)
{
    chomp (my $line = $_);
    
      $line =~ s/^ +t.+ :(.+)/:$1, /;
      print OUTFILE "$line";
}

close INFILE;
close OUTFILE;
