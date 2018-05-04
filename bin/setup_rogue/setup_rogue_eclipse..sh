variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch=MAIN
if [ $# -gt 2 ]; then
  block=`echo $3 | tr "[a-z]" "[A-Z]"`
  branch="DEV/${block}"
fi

export DESIGNROOT=~/projects/sbl/$branch/design
export SIMROOT=~/projects/sbl/sim_main
export DCONFIG=${variant}_CONFIG${config}
export TOOL=NCSIM
export COVERAGE=OFF

cd ${DESIGNROOT}
. ${DESIGNROOT}/setup.sh
cd ${VERIFROOT}/common/sim

