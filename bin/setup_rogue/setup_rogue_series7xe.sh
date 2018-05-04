variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch="FLINT_7XE"
if [ $# -gt 2 ]; then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
fi

export ROGUEROOT="${HOME}/projects/series7xe/${branch}"
export SIMROOT="${HOME}/projects/series7xe/sim"
export DCONFIG="${variant}_CONFIG${config}"
export ROGUEASM="${HOME}/projects/series7xe/ROGUEASM/tools/intern"
export DOCSROOT="${HOME}/projects/series7xe/DOCS"

cd ${ROGUEROOT}/rogue/regression
