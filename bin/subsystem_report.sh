#!/bin/bash -f



# SUB SYSTEM TEST LIST
SS_TB_LIST="\
rgx_cdm_full_tb,\
rgx_cdm_pipe_tb,\
rgx_cdm_wrap_tb,\
rgx_fbcdc_fbhc_uvm_tb,\
rgx_fbcdc_fbsc_uvm_tb,\
rgx_fbcdc_fbm_uvm_tb,\
rgx_pbe3_tb,\
rgx_tf_tb,\
rgx_madd_tb,\
rgx_tag_tb,\
rgx_madd_astc_col_interp_formal,\
rgx_madd_astc_ind_interp_formal,\
rgx_madd_astc_pp_formal,\
rgx_madd_astc_ref_model_tb,\
rgx_madd_astc_top_formal,\
rgx_madd_pvrtc_formal,\
rgx_madd_pvrtc_ubil_5_3_formal,\
rgx_tag_arb,\
rgx_tf_cmp_per_pix"



# Do this in P4 EWA login area
. $SETUP_ROGUE_SCRIPTS/setup_rogue_eclipse.sh dutton 01
cd regression




# Report REGRESSION results
HTMLF='-html subsystem_regression_report.html'
PUBLISH_TYPE='-pubtype module_regression'
FILELINK='-filelink http://hhjenkins.hh.imgtec.org:8079'
TOOL='VCS'



# Get the report
echo ""
echo "Generating the TPU/CDM/FBCDC/PBE3 subsystem regression report..."
cmd="make report TB=$SS_TB_LIST CONFIG=DUTTON_CONFIG01 RWEB="" TOOL=$TOOL BARGS='$HTMLF $PUBLISH_TYPE $FILELINK'"
echo $cmd
echo ""
jsub --cmd $cmd



# Report SANITY VCS results
HTMLF='-html subsystem_sanity_report.html'
PUBLISH_TYPE='-pubtype sanity'



# Get the report
echo ""
echo "Generating the TPU/CDM/FBCDC/PBE3 subsystem sanity report..."
cmd="make report TB=$SS_TB_LIST CONFIG=DUTTON_CONFIG01 RWEB="" TOOL=$TOOL BARGS='$HTMLF $PUBLISH_TYPE $FILELINK'"
echo $cmd
echo ""
jsub --cmd $cmd



# Report SANITY IEV results
HTMLF='-html subsystem_sanity_iev_report.html'
PUBLISH_TYPE='-pubtype sanity'
TOOL='IEV'



# Get the report
echo ""
echo "Generating the TPU/CDM/FBCDC/PBE3 subsystem IEV sanity report..."
cmd="make report TB=$SS_TB_LIST CONFIG=DUTTON_CONFIG01 RWEB="" TOOL=$TOOL BARGS='$HTMLF $PUBLISH_TYPE $FILELINK'"
echo $cmd
echo ""
jsub --cmd $cmd
