#!/usr/bin/env perl


use strict;


sub get_bits($) {
   my $word = shift;
   my @bits = ();
   my $binword = sprintf("%032b",int($word));
   foreach my $bit (split(/(\d)/,$binword)) {
      push @bits, $bit;
   }
   return @bits;
}

sub conv_engnumber($) {
   my $strnum = shift;
   my $mantissa;
   print "STRNUM = $strnum\n";
   if ($strnum =~ /(\d+)?.?(\d+)(M|G|T|K|k)/) {
      print "1 : $1 : 2 $2 : 3 : $3\n";
      $mantissa = "$2";
      $mantissa = "$1.$2" if ($1);
      print "MANTISSA = $mantissa\n";
      $mantissa *= (2**10) if ($3 =~ /K|k/);
      $mantissa *= (2**20) if ($3 eq "M");
      $mantissa *= (2**30) if ($3 eq "G");
      $mantissa *= (2**40) if ($3 eq "T");
   }
   return ($mantissa);
}


my @list_of_bit;

push @list_of_bit, &get_bits(4294967294);

print "BITS: ";
foreach my $bit (@list_of_bit) {
   print "$bit ";
}
print "\n";

my $n = "1M";
printf "CONV_NUMBER: %s : %0d\n",$n,&conv_engnumber($n);

