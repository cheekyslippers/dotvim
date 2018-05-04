#!/bin/csh -f

# Switch to P4_INTEG branch
git checkout p4-integ

# Synchronize with the Perforce Depot
git p4 sync

# Create a new artificial remote refs to point to the last commit on p4-integ
git update-ref refs/remotes/p4/master remotes/origin/p4-integ
git symbolic-ref refs/remotes/p4/HEAD refs/remotes/p4/master

# Final sync from master refs (NOTE: needs to explicitly set the branch)
git p4 sync --branch=refs/remotes/p4/master

