#!/bin/csh
set variant=`echo $1 | tr "[a-z]" "[A-Z"]`
set config=$2
set branch=FLINT_7XE
if ($#argv > 2) then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
endif

setenv ROGUEROOT ~/projects/series7xe/$branch
setenv SIMROOT ~/projects/series7xe/sim
setenv DCONFIG ${variant}_CONFIG${config}
setenv ROGUEASM ~/projects/series7xe/ROGUEASM/tools/intern
setenv DOCSROOT ~/projects/series7xe/DOCS

cd ${ROGUEROOT}/rogue/regression
