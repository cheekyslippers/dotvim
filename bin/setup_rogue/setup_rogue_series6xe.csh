set variant=`echo $1 | tr "[a-z]" "[A-Z"]`
set config=$2
set branch=FLINT
set cmodel=sim
if ($variant == KELLY) then
  set branch=KELLY
  set cmodel=sim_kelly
endif
if ($#argv > 2) then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
endif

setenv ROGUEROOT ~/projects/series6xe/$branch
setenv SIMROOT ~/projects/series6xe/$cmodel
setenv DCONFIG ${variant}_CONFIG${config}
setenv ROGUEASM ~/projects/series6xe/ROGUEASM/tools/intern
setenv DOCSROOT ~/projects/series6xe/DOCS

cd ${ROGUEROOT}/rogue/regression

