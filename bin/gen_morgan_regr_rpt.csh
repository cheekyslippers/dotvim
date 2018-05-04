#!/bin/csh -f

if ($#argv < 1) then
  echo "ERROR: need to specify CONFIG NUMBER to generate report : eg $0 16"
  exit(1)
endif

source ~/setup_scripts/setup_rogue/setup_rogue_morgan_regr.csh $argv[1]
python2.7 ${ROGUEROOT}/rogue/tools/gen_block_verification_page.py -r /user/plt.tmp/Regressions/blocklevel/morgan_block_run_list.txt -d /user/plt.tmp/morgan_regression/DOCS -w
