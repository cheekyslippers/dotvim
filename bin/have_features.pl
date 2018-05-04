#!/usr/bin/perl

use strict;

my %covmeta;


my $features = "TPU_PARALLEL_INSTANCES==4 && PAUL==1 && TREFOR";


# DEFINE FEATURES
$covmeta{CONFIG}{DEFINE}{PAUL}=1;
$covmeta{CONFIG}{DEFINE}{TREFOR}=1;
$covmeta{CONFIG}{DEFINE}{TPU_PARALLEL_INSTANCES}=8;

sub have_feature($) {

   my $features = shift;
   my $match = 1;
   my $invert = 0;
   my $present = 0;

   $features =~ s/,/ /g;

   # Retain features for printing
   my $eqn = $features;

   # Find feature definitions (ignoring logical operators)
   (my $fnames_str = $features) =~ s/[^\w+\.]+/ /g;
   my @fnames = split(/\s+/, $fnames_str);

   for my $fname (@fnames) {
      # Ignore numerical entries, no defines should consist of digits alone
      if ($fname =~ /^[\d\.]+$/) {
         next;
      }

      # If feature is defined then replace it in the equation with the defined value
      # or ND if it isn't defined (so the eqn can be calculated later
      if (defined($covmeta{CONFIG}{DEFINE}{$fname})) {
         $eqn =~ s/$fname/$covmeta{CONFIG}{DEFINE}{$fname}/g;
      } else {
         $eqn =~ s/$fname/ND/g;
      }
   }

   # set all undefined comparisons to result in 0
   # careful to avoid an incorrect TRUE where (ND=0) < 8 for example
   $eqn =~ s/ND\*[<>=]+\s*[\d\.]+/0/g;

   # replace remaining ND's with 0
   $eqn =~ s/ND/0/g;


   $match = eval $eqn; warn $@ if $@;
   if ($@ or !defined($match)) {
      die "ERROR: feature equation cannot be parsed in PERL: $features\n$@";
   }

   # Catch where eqn returns no value (ie no match)
   # (for when wquation doesn't specifically return 0)
   if (defined($match) && ($match eq "")) {
      $match = 0;
   }

   return $match;

}


&have_feature($features);
1;
