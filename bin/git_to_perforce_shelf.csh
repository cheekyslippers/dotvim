#!/bin/csh -f

# Rebase p4-integ branch on top of the latest Perforce changes
git checkout p4-integ
git p4 rebase

# Now checkout master and merge the development branch to it
# to get all the latest changes from GIT ready for committing to Perforce
git checkout master
git merge develop

# Fetch the latest tags to the local git checkout
git fetch --tags


# Use a temporary branch in case any of the commits are already in Perforce
# and will result in conflicts/issues. Default accepts the Perforce change
git checkout -b cleanup
git rebase --onto tag/last-p4-git-push cleanup

# To do this interfacetively and decide what to do with the conflicts
# git rebase -i tag/last-p4-git-push

# Cherry-pick the changes that are left back to p4-integ because it isn't an ancestor of master or develop
git checkout p4-integ
git cherry-pick tag/last-p4-git-push..cleanup   # NEEDS WORK

# Submit to a PERFORCE SHELF which will have to be manually submitted by the user
# (note this reverts local file changes)
git p4 submit --shelve

# Re-sync the GIT branches and force HEAD to the latest commit
git p4 sync --branch=refs/remotes/p4/master
git reset --hard refs/remotes/p4/master

# Delete the temporary branch (tidy up)
git branch -D cleanup

# Remove the pointer to the last integration point (tag) locally and on the remote:
git tag -d tag/last-p4-git-push
git push origin :refs/tags/tag/last-p4-git-push

# Create a new tag (pointer) to the current integ point
git checkout develop
git tag -a tag/last-p4-git-push -m "tag pointer to last develop commit pushed to P4"

# Push all state to the git repo
git push origin master
git push origin tag/last-p4-git-push
git push origin p4-integ


