variant=`echo $1 | tr "[a-z]" "[A-Z"]`
config=$2
branch="SWANN"
if [ $# -gt 2 ]; then
  set twig=$3
  set branch=`echo ${branch}_${twig} | tr "[a-z]" "[A-Z]"`
fi

export ROGUEROOT="${HOME}/projects/series7/${branch}"
export SIMROOT="${HOME}/projects/series7/sim"
export DCONFIG="${variant}_CONFIG${config}"
export ROGUEASM="${HOME}/projects/series7/ROGUEASM/tools/intern"
export DOCSROOT="${HOME}/projects/series7/DOCS"

cd ${ROGUEROOT}/rogue/regression
