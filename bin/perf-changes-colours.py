#!/usr/bin/python

# Practice in Python - conversion from my existing PERL script

import sys
import re

#Give colours useful names
RESET = "\033[0m";
BOLD = "\033[1m";
BLINK = "\033[5m";
## Foreground colors
BLACK = "\033[30m";
RED = "\033[31m";
GREEN = "\033[32m";
BROWN = "\033[33m";
BLUE = "\033[34m";
MAGENTA = "\033[35m";
CYAN = "\033[36m";
WHITE = "\033[37m";
ORANGE = "\033[38;5;208m";


for line in sys.stdin:
   newline = line.rstrip()
   m = re.search(r'^Change', newline)
   if (m):
      lm = re.search(r'Change (\d+) on (\d+\/\d+\/\d+ \d+:\d+:\d+) by (.*)@([\w\.\-]+)',newline);
      lms = re.search(r'Change .* by .*@[\w\.\-]+ (\*\w+\*)',newline)
      lmc = re.search(r'Change .*(\'.*\'$)',newline)
      if (lm):
         changeid = lm.group(1)
         changedate = lm.group(2)
         author = lm.group(3)
         workspace = lm.group(4)
         newline = "Change "+BLUE+changeid+RESET
         newline += " on "+MAGENTA+changedate+RESET
         newline += " by "+BOLD+RED+author+RESET
         newline += "@"+WHITE+workspace+RESET
         if (lms): newline += BOLD+MAGENTA+" "+lms.group(1)+" "+RESET
         if (lmc): newline += ORANGE+lmc.group(1)+RESET
      print newline
   else:
      print ORANGE + newline + RESET
