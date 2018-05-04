#!/usr/bin/env perl


use strict;


my $txt = "This is [a square bracket]\n";
print $txt;
$txt =~ s/\[/&#91;/g;
$txt =~ s/\]/&#93;/g;
print "CONVERTED : $txt\n";

