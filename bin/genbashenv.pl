#!/usr/bin/env perl

use strict;

my $bashenvfile = "/user/plt/.bashrc_env";

open(BASHENV, ">", $bashenvfile) or die "ERROR: couldn't open $bashenvfile for write\n";



for my $key (sort keys %ENV) {
   next if ($key =~ /SHELL/);
   print BASHENV "export $key=\"$ENV{$key}\"\n";
}

close(BASHENV);
