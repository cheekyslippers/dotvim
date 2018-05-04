#!/usr/bin/perl

use strict;
use FindBin;
use lib "$FindBin::Bin/perlpkgs";

use testpkg;


our $m_text = "Main Hello World\n";

print $m_text;
print $testpkg::p_text;

&testpkg::print_txt();
&testpkg::print_main_txt();

