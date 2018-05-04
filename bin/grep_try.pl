#!/vl/edatools/intern/perl/5.8.8/bin/perl


my @mixed_values = (1, 0, 0);

my $mixed_count = scalar(grep {$_ > 0} @mixed_values);

print "MIXED COUNT = $mixed_count\n";

