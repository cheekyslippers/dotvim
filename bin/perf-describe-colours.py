#!/usr/bin/python


# Practice in Python - conversion from my existing PERL script

import sys
import re

#Give colours useful names
RESET = "\033[0m";
BOLD = "\033[1m";
BLINK = "\033[5m";
## Foreground colors
BLACk = "\033[30m";
RED = "\033[31m";
GREEN = "\033[32m";
BROWN = "\033[33m";
BLUE = "\033[34m";
MAGENTA = "\033[35m";
CYAN = "\033[36m";
WHITE = "\033[37m";
ORANGE = "\033[38;5;208m";



def changes_line(line):
   lm = re.search(r'Change (\d+) by (.*)@([\w\.\-]+) on (\d+\/\d+\/\d+ \d+:\d+:\d+).*',line)
   lms = re.search(r'Change .* by .*@[\w\.\-]+ on .* (\*\w+\*)',line)
   if (lm):
      changeid = lm.group(1)
      changedate = lm.group(4)
      author = lm.group(2)
      workspace = lm.group(3)
      chline = "Change "+CYAN+changeid+RESET
      chline += " on "+MAGENTA+changedate+RESET
      chline += " by "+BOLD+RED+author+RESET
      chline += "@"+WHITE+workspace+RESET
      if (lms): chline += BOLD+MAGENTA+" "+lms.group(1)+" "+RESET
      return chline
   else:
      return line

def files_line(line):
   lmm  = re.search(r'^\.\.\. (\/\/.*)(MAIN|DEV|REL)(\/\w+)(.*)(#\d+) moved from (\/\/.*)(MAIN|DEV|REL)(\/\w+)(.*)(#\d+)(.*$)',line)
   lm  = re.search(r'^\.\.\. (\/\/.*)(MAIN|DEV|REL)(\/\w+)(.*)(#\d+)(.*$)',line)
   if (lmm):
      depotbase_old = lmm.group(1)
      depottype_old = lmm.group(2)
      depot_old     = lmm.group(3)
      path_old      = lmm.group(4)
      revid_old     = lmm.group(5)
      depotbase_new = lmm.group(6)
      depottype_new = lmm.group(7)
      depot_new     = lmm.group(8)
      path_new      = lmm.group(9)
      revid_new     = lmm.group(10)
      chline    = RED+"... "+RESET
      chline    += WHITE+depotbase_old+depottype_old+RESET
      chline    += RED+depot_old+RESET
      chline    += WHITE+path_old+RESET
      chline    += CYAN+revid_old+RESET
      chline    += BOLD+ORANGE+" MOVED TO "+RESET
      chline    += WHITE+depotbase_new+depottype_new+RESET
      chline    += RED+depot_new+RESET
      chline    += WHITE+path_new+RESET
      chline    += CYAN+revid_new+RESET
      return chline

   elif (lm):
      depotbase = lm.group(1)
      depottype = lm.group(2)
      depot     = lm.group(3)
      path      = lm.group(4)
      revid     = lm.group(5)
      status    = lm.group(6)
      chline    = RED+"... "+RESET
      chline    += WHITE+depotbase+depottype+RESET
      chline    += RED+depot+RESET
      chline    += WHITE+path+RESET
      chline    += CYAN+revid+RESET
      chline    += " "+BOLD+MAGENTA+status+RESET
      return chline
   else:
      return line



for line in sys.stdin:
   newline = line.rstrip()
   m = re.search(r'^Change', newline)
   p = re.search(r'^\.\.\.', newline)
   f = re.search(r'^====\s+.*#\d+.*\s+====$',newline)
   c = re.search(r'^\d+[,0-9a-z]+\d+.*',newline)
   o = re.search(r'^< ',newline)
   i = re.search(r'^> ',newline)
   if (m):
      prline = changes_line(newline)
      print prline
   elif (p):
      prline = files_line(newline)
      print prline
   elif (f):
      print MAGENTA+newline+RESET
   elif (c):
      print CYAN+newline+RESET
   elif (o):
      print RED+newline+RESET
   elif (i):
      print WHITE+newline+RESET
   else:
      print newline
