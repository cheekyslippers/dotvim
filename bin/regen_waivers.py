#! /usr/bin/env python2.7

import argparse
import os
import re
import sys
import ppar

import logger


from gen_utils       import cl_build_config
from gen_unifdef2    import cl_gen_unifdef
from run_unifdefvhdl import cl_run_unifdefvhdl
from gen_waiver      import cl_gen_waiver


class MakeWaives(object):

    def __init__(self, args, config):

        """
        Constructor
        """

        self.args   = args
        self.config = config
        self.log    = config.log


    def run_unifdef_on_waiver_file(self):
        """
        Run waiver file through unifdeffer first
        """
        os.chdir(self.config.verifroot)
        local_filename = os.path.join(self.config.tb_dir, "unidef.waiver.ini")

        # Check a waiver-only ini file has been created
        if not os.path.isfile(local_filename):
            log.error("ERROR: need to create an unidef.waiver.ini file for this TB - can copy from the example UVM testbench sim directory")
            sys.exit(1)


        self.log.info("Creating filelist for unifdeffer...")
        genner = cl_gen_unifdef("genner", local_filename, self.config, False, self.config.gendir_verif, False,  None, self.config.tb_dir,
                                False, "verif")

        self.strip_list = genner.return_files_to_be_stripped()
        self.copy_list  = genner.return_files_to_be_copied()
        self.per_tool   = genner.return_files_per_tool()

        self.log.info("Re-running unifdeffer on waiver files...")
        runner = cl_run_unifdefvhdl("runner", self.strip_list, self.copy_list, self.per_tool, self.config, False, None)
        os.chdir(self.config.tb_dir)




    def generate_waiver(self, waiver_name, filelist_vhdl, filelist_sv, cov_ex):
        """
        Call a class to generate a coverage waiver file
        """

        # Run UNIFDEF on waiver files to ensure any changes are captures
        self.run_unifdef_on_waiver_file()

        genner = cl_gen_waiver("genner", self.config, waiver_name, filelist_vhdl, filelist_sv, cov_ex)
        self.log.info("Re-generating waivers...")
        return_code = genner.run_it()
        if return_code:
            self.log.error("Failed to generage coverage waivers")
            sys.exit(1)




def main():
    LOG_FILENAME = "regen_waiver.log"
    log = logger.Logger("REGEN_WAIVER", LOG_FILENAME, filemode="w")

    parser = argparse.ArgumentParser(description=""" Top level build script """,
                                     parents=[ppar.targets, ppar.make_build, ppar.build_run, ppar.make_build_run])
    parser.add_argument("-tb_top",    dest="tb_top",    default="",  required=True,  help="TB Toplevel  - eg rgx_tf_tb_top - required")
    parser.add_argument("-rtl_top",   dest="rtl_top",   default="",  required=True,  help="RTL Toplevel - eg rgx_tf - required")
    parser.add_argument("-tb_files",  dest="tb_files",  default="",                  help="TB filelist from generated tree")
    parser.add_argument("-dut_files", dest="dut_files", default="",                  help="DUT filelist from generated tree")
    parser.add_argument("-cov_ex",    dest="cov_ex",    default="",                  help="Output coverage.ex filename/path")
    args = parser.parse_args()

    # Ensure dconfig is either set on the command line or use the ENV variable as a backup. Error if not found
    if args.dconfig is not None:
        dconfig = args.dconfig
    elif os.getenv('DCONFIG') is not None:
        dconfig = os.getenv('DCONFIG')
    else:
        log.error("DCONFIG is not set - either with -dconfig arg, or ENV variable")
        sys.exit(1)


    # Set the flow config object up to assist with paths etc
    config = cl_build_config(name="config", rtl_top=args.rtl_top, dconfig=dconfig, log=log, tool=args.target, tb_top=args.tb_top, nop4=True)

    # Set the flow log file up for messages
    log.set_log_path(os.path.join("/user/plt/waivers", '{build_type}_plt_waiver.log'.format(build_type=config.buildtype)))

    # Set tool from supported waiver tools
    tool = "vcs"
    if args.target == 'NCSIM':
        tool = "ncsim"
    if args.target == 'MODELSIM':
        tool = 'modelsim'


    default_sv_filelist   = "{:s}/{:s}_{:s}.sv.f".format(config.build_dir, tool, config.tb_top)
    default_vhdl_filelist = "{:s}/{:s}_{:s}.vhdl.f".format(config.build_dir, tool, config.tb_top)
    default_coverage_ex   = "{:s}/coverage.ex".format(config.build_dir)

    if (args.waiver):
        default_waiver_file = args.waiver[0]
    else:
        log.error("ERROR: this script explicitly requires the -waiver argument - eg -waiver rgx_tf.waiver")
        sys.exit(1)

    if (args.tb_files):
        default_sv_filelist = args.tb_files

    if (args.dut_files):
        default_vhdl_filelist = args.dut_files

    if (args.cov_ex):
        default_coverage_ex = args.cov_ed

    log.debug("DEFAULT SV    :  {:s}".format(default_sv_filelist))
    log.debug("DEFAULT VHDL  :  {:s}".format(default_vhdl_filelist))
    log.debug("DEFAULT WAIV  :  {:s}".format(default_waiver_file))
    log.debug("DEFAULT COVEX :  {:s}".format(default_coverage_ex))

    log.info("Creating waiver generator...")
    maker = MakeWaives(args, config)
    return_code = maker.generate_waiver(default_waiver_file,  default_vhdl_filelist, default_sv_filelist, default_coverage_ex)
    return return_code




if __name__=='__main__':
    sys.exit(main())