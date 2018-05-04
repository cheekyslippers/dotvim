#!/usr/bin/python

#Get Project Name from this scripts path to auto-differentiate results
import os
import sys
import re

project = os.path.dirname(os.path.realpath(__file__))
print "PROJECT 1 : %s" % project


project = re.sub(r'.*\/([A-Z_]+)\/rogue\/tools.*$',r'\1',"/user/plt.tmp/flint_regression/FLINT/rogue/tools")
print "PROJECT 2 : %s" % project
