#!/usr/bin/perl

use strict;
use warnings;

my $char;
my %chars=();

print "Enter a line: ";

while( $char = getc() ) {
  last if( $char =~ /\n/ );
  $chars{ $char }++;
}

my @keys = sort keys( %chars );
foreach my $key (@keys) {
  print "$key = $chars{ $key }\n";
}