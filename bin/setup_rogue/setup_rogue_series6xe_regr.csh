set variant=`echo $1 | tr "[a-z]" "[A-Z"]`
set config=$2
set branch=FLINT
set cmodel=sim
if ($variant == KELLY) then
  set cmodel=sim_kelly
  set branch=KELLY
endif
if ($#argv > 2) then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
endif

setenv ROGUEROOT /user/plt.tmp/regressions/series6xe/$branch
setenv SIMROOT /user/plt.tmp/regressions/series6xe/$cmodel
setenv DCONFIG ${variant}_CONFIG${config}
setenv ROGUEASM /user/plt.tmp/regressions/series6xe/ROGUEASM/tools/intern
setenv DOCSROOT /user/plt.tmp/regressions/series6xe/DOCS

cd ${ROGUEROOT}/rogue/regression

