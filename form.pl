#!/usr/bin/perl
use strict;

open (INFILE, "vars");
open (OUTFILE, ">varF");

while (<INFILE>)
{
    chomp (my $line = $_);
    
      $line =~ s/^ +t.+ :(.+)/<%= f.label :$1 %><br \/>\n<%= f.text_field :$1 %><br \/>\n/;
      print OUTFILE "$line\n";
}

close INFILE;
close OUTFILE;
