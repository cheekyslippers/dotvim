#!/usr/bin/python
import sys
import os
import shutil
import string
import random
import datetime
import glob
import tarfile 
import getopt
import stat
import math
import re
import logging
import subprocess



def main():


   try:
      ifp = open("/user/plt.tmp/flint_regression/regression_BIF-128/rogue/regression/bif128/irun.log", 'r')
   except:
      print "Failed to open logfile for checking"
      return

   print "FILE OPENED FOR READ..."
   status = ""
   msg = ""
   fatals = "0"
   errors = "0"
   warnings = "0"
   tbType = "UVM"

   if tbType == "UVM":
   
      check_string = "\*\* Report counts by severity"
      fatal_string = "UVM_FATAL"
      error_string = "UVM_ERROR"
      warning_string = "UVM_WARNING"
   
   elif tbType == "OVM":
   
      check_string = "\*\* Report counts by severity"
      fatal_string = "OVM_FATAL"
      error_string = "OVM_ERROR"
      warning_string = "OVM_WARNING"
   
   elif tbType == "E":
   
      check_string = "Checking is complete -"
      error_string = "DUT errors"
      warning_string = "DUT warnings"
   
   else:
   
      fatal("Unknown Tb Type " + tbType,1)
      
   while True:  
      line = ifp.readline();
      
      if line == "":
      
         #
         # reached end of log file
         
         status = "Fatal"
         msg = "Test did not complete cleanly"
         return status, msg      
            
      if re.search(check_string, line):
      
         found = 1;
         
         if tbType == "UVM" or tbType == "OVM":
         
            ifp.readline()
            
            line= ifp.readline() 
            
            search_string = "(" + warning_string + ")([ ]*:[ ]*)([0-9]+)([ ]*)"
            m = re.compile(search_string).search(line) 
            
            if m:
            
               warnings = m.group(3)
                          
            else:
             
               status = "Fatal"
               msg = "re search of warnings line failed" 
               return status, msg

            line= ifp.readline()
            
            search_string = "(" + error_string + ")([ ]*:[ ]*)([0-9]+)([ ]*)"
            m = re.compile(search_string).search(line) 
            
            if m:
            
               errors = m.group(3)
                                      
            else:
             
               status = "Fatal"
               msg = "re search of errors line failed" 
               return status, msg

            line= ifp.readline()
            
            search_string = "(" + fatal_string + ")([ ]*:[ ]*)([0-9]+)([ ]*)"
            m = re.compile(search_string).search(line) 
            
            if m:
            
               fatals = m.group(3)
            
            else:
             
               status = "Fatal"
               msg = "re search of fatals line failed" 
               return status, msg
          
         elif tbType == "E":
         
            search_string = "(.*)([0-9]+)(.*)(" + error_string + ")(.*)([0-9]+)(.*)(" + warning_string + ")(.*)"
            
            m = re.compile(search_string).search(line)
            
            if m:
            
               errors = m.group(2)
               warnings = m.group(6)
               
               break
               
            else:
             
               status = "Fatal"
               msg = "re search of finished line failed" 
               return status, msg
            
         else:
         
            fatal("Unknown Tb Type " + tbType,1)
            
         break

   print "FINISHED WHILE TRUE LOOP"
   ifp.close()
      




if __name__ == "__main__":
   main()




