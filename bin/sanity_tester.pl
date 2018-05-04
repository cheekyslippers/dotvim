#!/usr/bin/perl

use strict;
use threads;
use threads::shared;
use lib "$ENV{ROGUEROOT}/rogue/regression";
use runregression_config;



our $simtool = "ies";    #Cadence by default = can also be vcs
our $verbose = 1;
my @sanity_cmds = ();
my @spawned_threads = ();
our %compile_results : shared = ();
my @sanity_modules;

# Eval Subroutine
# =======================
sub exec_sanity_thrd {
   my @evalcmd = @_;
   eval "@_"; warn $@ if $@;
}

########################
# MAIN PROGRAM
########################

# Require all known packages
# ==========================
while (<@runregression_config::sanity_pkgs>) {
   my $module_pkg = $_;
   eval "require $module_pkg";
   (my $module = $module_pkg) =~ s/sanity_//;
   print "MODULE = $module\n";
   push @sanity_modules, $module;
   my $cmd = "&${module_pkg}::sanity_sim()";
   push @sanity_cmds, $cmd;
   $compile_results{$module} = 0;
}

# Spawn sim threads and join up
# =======================
print "\nSANITY : calling sanity sim...\n-----\n";
foreach my $scmd (@sanity_cmds) {
   push @spawned_threads, threads->create('exec_sanity_thrd',$scmd);
}
foreach my $thrd (@spawned_threads) {
   $thrd->join();
}


print "STATUS:   BLOCK :    PASS :   COMPILE :   ELAB :   FAIL STR\n";
foreach my $module (@sanity_modules) {
   print "          $sanity_bz128::module :       $sanity_bz128::sanity_pass :         $compile_results{$module} :      $sanity_bz128::elab_pass :   $sanity_bz128::fail_str\n";
}
foreach my $key (sort keys %compile_results) {
   print "KEY : $key : RESULT $compile_results{$key}\n";
}
