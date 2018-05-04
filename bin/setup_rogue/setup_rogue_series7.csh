set variant=`echo $1 | tr "[a-z]" "[A-Z"]`
set config=$2
set branch=SWANN
if ($#argv > 2) then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
endif

setenv ROGUEROOT ~/projects/series7/$branch
setenv SIMROOT ~/projects/series7/sim
setenv DCONFIG ${variant}_CONFIG${config}
setenv ROGUEASM ~/projects/series7/ROGUEASM/tools/intern
setenv DOCSROOT ~/projects/series7/DOCS

cd ${ROGUEROOT}/rogue/regression

