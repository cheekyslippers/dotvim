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



def files_line(line):
   lm  = re.search(r'^(\/\/.*)(MAIN|DEV|REL)(\/\w+)(.*)(#\d+) - (.*)( change \d+|default change)( \(.*\))',line)
   rest  = re.search(r'^\/\/.*(MAIN|DEV|REL)\/\w+.*#\d+ - .* (change \d+|default change) \(.*\)( .*$)',line)
   if (lm):
      depotbase = lm.group(1)
      depottype = lm.group(2)
      depot     = lm.group(3)
      path      = lm.group(4)
      revid     = lm.group(5)
      status    = lm.group(6)
      changelst = lm.group(7)
      ftype     = lm.group(8)
      chline    = WHITE+depotbase+depottype+RESET
      chline    += RED+depot+RESET
      chline    += WHITE+path+RESET
      chline    += CYAN+revid+RESET
      chline    += " - "+BOLD+MAGENTA+status+RESET
      if (re.search(r'default',changelst)):
         chline    += BOLD+RED+BLINK+changelst+RESET
      else:
         chline    += CYAN+changelst+RESET
      chline    += ORANGE+ftype+RESET
      if (rest): chline    += rest.group(3)
      return chline
   else:
      return line



for line in sys.stdin:
   newline = line.rstrip()
   p = re.search(r'^\/\/', newline)
   if (p):
      prline = files_line(newline)
      print prline
   else:
      print newline
