#!/usr/bin/perl

package testpkg;

$testpkg::p_text = "Package Hello World\n";

sub print_txt () {
   print "PKG_FUNCT1: ",$p_text;
}

sub print_main_txt () {
   print "PKG_FUNCT2: ", $::m_text;
}

1;

