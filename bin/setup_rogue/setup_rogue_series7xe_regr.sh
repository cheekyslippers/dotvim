variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch="FLINT_7XE"
if [ $# -gt 2 ]; then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
fi

export ROGUEROOT="/user/plt.tmp/regressions/series7xe/${branch}"
export SIMROOT="/user/plt.tmp/regressions/series7xe/sim"
export DCONFIG="${variant}_CONFIG${config}"
export ROGUEASM="/user/plt.tmp/regressions/series7xe/ROGUEASM/tools/intern"
export DOCSROOT="/user/plt.tmp/regressions/series7xe/DOCS"

cd ${ROGUEROOT}/rogue/regression
