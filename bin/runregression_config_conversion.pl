#!/usr/bin/env perl


use strict;
use lib "$ENV{ROGUEROOT}/rogue/regression";
use runregression_config;

sub get_spaces($$) {
   my ($line, $spaces) = @_;
   while (length($line) < $spaces) {
      $line .= " ";
   }
   return $line;
}


sub write_new_file {
   open(NEWF, ">$ENV{ROGUEROOT}/rogue/regression/runregression_config_NEW.pm") or die "ERROR: Couldn't open file for write: $ENV{ROGUEROOT}/rogue/regression/runregression_config_NEW.pm\n";

   #Write HEADER
   print NEWF "package runregression_config;\n\n";
   print NEWF "use strict;\n";
   print NEWF "use Exporter;\n";
   print NEWF "use vars qw(\$VERSION \@ISA \@EXPORT \@EXPORT_OK \%EXPORT_TAGS);\n\n";
   print NEWF "\$VERSION     = 1.00;\n";
   print NEWF "\@ISA         = qw(Exporter);\n";
   print NEWF "\@EXPORT      = qw(\%all_module_list \%def_mapping);\n";
   print NEWF "\@EXPORT_OK   = qw();\n";
   print NEWF "\%EXPORT_TAGS = ();\n\n";
   print NEWF "# ----------------------------------------------------------------------------------------\n";
   print NEWF "# List of all modules\n";
   print NEWF "# ----------------------------------------------------------------------------------------\n\n";

   #Write MODULE hash array
   print NEWF "our \%all_module_list = (\n";
   foreach my $module (sort @runregression_config::all_module_list) {
      print NEWF "   '$module' => {\n";
      $runregression_config::top_modules{$module} or $runregression_config::top_modules{$module} = "n/a" and warn "WARNING: No top_module specified for ${module}\n";
      $runregression_config::top_modules{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::top_modules{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'top_module'            => \"$runregression_config::top_modules{$module}\",\n";
      $runregression_config::script_run{$module} or $runregression_config::script_run{$module} = "n/a" and warn "WARNING: No script_run specified for ${module}\n";
      $runregression_config::script_run{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::script_run{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'script_run'            => \"$runregression_config::script_run{$module}\",\n";
      $runregression_config::script_pass{$module} or $runregression_config::script_pass{$module} = "n/a" and warn "WARNING: No script_pass specified for ${module}\n";
      $runregression_config::script_pass{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::script_pass{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'script_pass'           => \"$runregression_config::script_pass{$module}\",\n";
      $runregression_config::script_coverage{$module} or $runregression_config::script_coverage{$module} = "n/a" and warn "WARNING: No script_coverage specified for ${module}\n";
      $runregression_config::script_coverage{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::script_coverage{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'script_coverage'       => \"$runregression_config::script_coverage{$module}\",\n";
      $runregression_config::coverage_db{$module} or $runregression_config::coverage_db{$module} = "n/a" and warn "WARNING: No coverage_db specified for ${module}\n";
      $runregression_config::coverage_db{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::coverage_db{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'coverage_db'           => \"$runregression_config::coverage_db{$module}\",\n";
      $runregression_config::xml_mod_reports{$module} or $runregression_config::xml_mod_reports{$module} = "n/a" and warn "WARNING: No xml_mod_reports specified for ${module}\n";
      $runregression_config::xml_mod_reports{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::xml_mod_reports{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'xml_mod_report'        => \"$runregression_config::xml_mod_reports{$module}\",\n";
      $runregression_config::use_work_uvm{$module} or $runregression_config::use_work_uvm{$module} = 0;
      print NEWF "                 'use_work_uvm'          => \"$runregression_config::use_work_uvm{$module}\",\n";
      $runregression_config::script_run_args{$module} or $runregression_config::script_run_args{$module} = "";
      $runregression_config::script_run_args{$module} =~ s/\$ROGUEROOT/\$ENV{ROGUEROOT}/g;
      $runregression_config::script_run_args{$module} =~ s/\$DCONFIG/\$ENV{DCONFIG}/g;
      print NEWF "                 'script_run_args'       => \"$runregression_config::script_run_args{$module}\",\n";
      $runregression_config::script_duplicate_tree{$module} or $runregression_config::script_duplicate_tree{$module} = 0;
      print NEWF "                 'script_duplicate_tree' => \"$runregression_config::script_duplicate_tree{$module}\",\n";
      $runregression_config::vmem_request{$module} or $runregression_config::vmem_request{$module} = "";
      print NEWF "                 'vmem_request'          => \"$runregression_config::vmem_request{$module}\",\n";
      $runregression_config::use_grid{$module} or $runregression_config::use_grid{$module} = 0;
      print NEWF "                 'use_grid'              => \"$runregression_config::use_grid{$module}\",\n";
      print NEWF "                },\n";
   }
   print NEWF ");\n\n";


   #Write FOOTER
   print NEWF "# ----------------------------------------------------------------------------------------\n";
   print NEWF "# Def file mapping\n";
   print NEWF "# ----------------------------------------------------------------------------------------\n\n";
   print NEWF "our \%def_Pmapping = (\n";
   foreach my $deffile (sort keys %runregression_config::def_mapping) {
      printf NEWF "   %s => \"$runregression_config::def_mapping{$deffile}\",\n", get_spaces("'$deffile'", 30);
   }
   print NEWF ");\n\n";

   print NEWF "# ----------------------------------------------------------------------------------------\n";
   print NEWF "# Run Args for ALL modules\n";
   print NEWF "# ----------------------------------------------------------------------------------------\n\n";
   if ($runregression_config::script_run_args_all) {
      print NEWF "our \$script_run_args_all = \"$runregression_config::script_run_args_all\";\n\n";
   } else {
      print NEWF "our \$script_run_args_all = \"\";\n\n";
   }

   print NEWF "# ----------------------------------------------------------------------------------------\n";
   print NEWF "# Run Args for ALL modules\n";
   print NEWF "# ----------------------------------------------------------------------------------------\n\n";
   if ($runregression_config::xml_publish_path) {
      print NEWF "our \$xml_publish_path = \"$runregression_config::xml_publish_path\";\n\n";
   } else {
      print NEWF "our \$xml_publish_path = \"\";\n\n";
   }

   print NEWF "# ----------------------------------------------------------------------------------------\n";
   print NEWF "# Default VMEM request for ALL modules\n";
   print NEWF "# ----------------------------------------------------------------------------------------\n\n";
   if ($runregression_config::vmem_default) {
      print NEWF "our \$vmem_default = \"$runregression_config::vmem_default\";\n\n";
   } else {
      print NEWF "our \$vmem_default = \"\";\n\n";
   }


   print NEWF "\n1;\n";
   close(NEWF);

}





#### MAIN ######
write_new_file();


print "\n\nNEW ROGUE CONFIG PACKAGE WRITTEN TO runregression_config_NEW.pm\n";
print "Replace original with new in Perforce at your convenience - in line with updated runregression.pl script\n";

