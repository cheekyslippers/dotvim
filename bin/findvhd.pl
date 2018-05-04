#!/usr/bin/env perl

use strict;
use Getopt::Long;
use File::Find;

my @filelist;

my $dir = "/user/plt/projects/series8/main/design/common";

sub wanted {
   my $file = $_;
   return if ($file !~ /.*\.vhd$/);
   push @filelist, $file;
   print "File found is $_\n";
}

find({wanted => \&wanted, no_chdir => 1},$dir);


