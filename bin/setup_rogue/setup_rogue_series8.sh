variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch=MAIN
if [ $# -gt 2 ]; then
  block=`echo $3 | tr "[a-z]" "[A-Z]"`
  branch="${block}"
fi

export DESIGNROOT="${HOME}/projects/series8/${branch}/design"
#export SIMROOT="${HOME}/projects/series8/sim"
export SIMROOT="MAIN"
export DCONFIG="${variant}_CONFIG${config}"
export COVERAGE=OFF

cd ${DESIGNROOT}
. ${DESIGNROOT}/setup.sh
cd ${VERIFROOT}/common/sim
