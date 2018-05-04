#!/usr/bin/env perl


if ($ENV{SIMROOT} ne "MAIN" && $ENV{SIMROOT} ne "REL/HEAD") {
   my $p4where = `p4 -d $ENV{SIMROOT} where`;
   my @p4where2 = split /\s+/, $p4where;

   if ( ( $p4where2[0] !~ /.*\/MAIN\/\.\.\.$/ && $p4where2[0] !~ /^.*\/REL\/HEAD\/\.\.\.$/ ) ) {
      printf( "WARN: \$SIMROOT is not on MAIN or REL/HEAD, so cannot publish the results:\n      %s\n",$p4where);
   }
}
