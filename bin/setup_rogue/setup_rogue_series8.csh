set variant=`echo $1 | tr "[a-z]" "[A-Z"]`
set config=$2
set branch=MAIN
if ($#argv > 2) then
  set block=`echo ${3} | tr "[a-z]" "[A-Z]"`
  set branch="${block}"
endif

setenv DESIGNROOT ~/projects/series8/$branch/design
setenv SIMROOT MAIN
setenv DCONFIG ${variant}_CONFIG${config}
setenv TOOL VCS
setenv COVERAGE no

cd ${DESIGNROOT}
source ${DESIGNROOT}/setup.csh
cd ${VERIFROOT}/common/sim

