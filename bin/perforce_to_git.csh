#!/bin/csh -f

# Checkout / sync / rebase the p4-integ branch
git checkout p4-integ
git p4 sync --branch=refs/remotes/p4/master
git p4 rebase


# Squash incoming changes down to a single commit, (no need to maintain ALL perforce commits in GIT)
# and use an "ours" mentality to keep our changes in conflicts
git checkout -b p4mergebranch
git merge -s ours master
git checkout master
git merge p4mergebranch --squash
git commit -m "integrate from Perforce to GIT"


# Delete temporary merge branch
git branch -D p4mergebranch


# Merge the changes to develop for local team to continue
git checkout develop
git merge master


# Ensure last p4 integrate tag is good
git tag -d tag/last-p4-integ
git push origin :refs/tags/tag/last-p4-integ


# Create a new tag at MASTER branch to be sure of the correct SHA1
git checkout master
git tag -a tag/last-p4-integ


# Push all shelves back to origin
git push origin master
git push origin develop
git push origin tag/last-p4-integ


