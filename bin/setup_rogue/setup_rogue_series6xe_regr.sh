variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch="FLINT"
cmodel=sim
if [ $variant == KELLY ]; then
   branch="KELLY"
   cmodel="sim_kelly"
fi
if [ $# -gt 2 ]; then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
fi

export ROGUEROOT="/user/plt.tmp/regressions/series6xe/${branch}"
export SIMROOT="/user/plt.tmp/regressions/series6xe/sim"
export DCONFIG="${variant}_CONFIG${config}"
export ROGUEASM="/user/plt.tmp/regressions/series6xe/ROGUEASM/tools/intern"
export DOCSROOT="/user/plt.tmp/regressions/series6xe/DOCS"

cd ${ROGUEROOT}/rogue/regression
