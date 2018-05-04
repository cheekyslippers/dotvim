#!/usr/bin/python2.7

import sys
import os
import subprocess
import re


def getP4ChangelistNumber():
   p4changenum = 0
   charg = str(os.environ['ROGUEROOT']) + "/...#have"
   cmd = ["p4","changes","-m1",charg]
   try:
      p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      (p4out,p4err) = p.communicate()
      p.wait()
   except OSError as e:
      print "Couldn't run Perforce command: p4 changes -m1 %s: %s" % (charg, e)
      sys.exit(1)

   if (p.returncode):
      msg = "*********\n"
      msg += "ERROR: Perforce command 'p4 changes -m1 %s' returned an error\n" % charg
      msg += "Error code: %s\n" % p.returncode
      msg += "Check you are logged into Perforce (p4 login) or in a workspace dir\n"
      msg += "Note that symlink to p4 workdir in path may cause an issue\n"
      msg += "*********"
      print "%s" % msg
      sys.exit(1)
   if p4err:
      msg = "Perforce cmd failed:\n%s" % p4err
      sys.exit(1)


   print "P4 OUTPUT= %s" % p4out
   p4changenum = re.sub(r'Change (\d+).*',r'\1',p4out.rstrip())
   print "P4 changelist number: %s" %p4changenum
   return p4changenum




if __name__ == '__main__':
   getP4ChangelistNumber()
