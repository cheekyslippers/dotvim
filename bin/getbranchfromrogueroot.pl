#/usr/bin/env perl

use strict;


my $rr = `p4 dirs $ENV{ROGUEROOT}`;
chomp($rr);
$rr or die "ERROR: $ENV{ROGUEROOT} not recognised by Perforce Client in this tree\n";
$rr =~ s/(.*)\/$/\1/;
$rr =~ s/.*\/([a-zA-Z0-9\.\-_]*)$/\1/;

printf "ROGUEROOT = %s\n", `p4 dirs $ENV{ROGUEROOT}`;
print "RR        = $rr\n";
