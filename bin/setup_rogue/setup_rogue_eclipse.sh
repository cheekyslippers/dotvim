variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch=MAIN
if [ $# -gt 2 ]; then
  block=`echo $3 | tr "[a-z]" "[A-Z]"`
  branch="DEV/${block}"
fi

export DESIGNROOT=~/projects/ecl/$branch/design
export SIMROOT=MAIN
export DCONFIG=${variant}_CONFIG${config}
export COVERAGE=OFF

cd ${DESIGNROOT}
. ${DESIGNROOT}/setup.sh
cd ${VERIFROOT}/common/sim

