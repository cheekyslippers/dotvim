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

export ROGUEROOT="${HOME}/projects/series6xe/${branch}"
export SIMROOT="${HOME}/projects/series6xe/sim"
export DCONFIG="${variant}_CONFIG${config}"
export ROGUEASM="${HOME}/projects/series6xe/ROGUEASM/tools/intern"
export DOCSROOT="${HOME}/projects/series6xe/DOCS"

cd ${ROGUEROOT}/rogue/regression
