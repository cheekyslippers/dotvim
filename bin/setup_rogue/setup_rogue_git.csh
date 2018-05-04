set variant=`echo $1 | tr "[a-z]" "[A-Z"]`
set config=$2
set branch=volcanic-MAIN
if ($#argv > 2) then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
endif

setenv DESIGNROOT /user/plt.tmp/git-projects/$branch/design
setenv SIMROOT /user/plt.tmp/git-projects/volcanic-SIM
setenv DCONFIG ${variant}_CONFIG${config}
setenv TOOL NCSIM
setenv COVERAGE no

cd ${DESIGNROOT}
source ${DESIGNROOT}/setup.csh
cd ${VERIFROOT}/common/sim

