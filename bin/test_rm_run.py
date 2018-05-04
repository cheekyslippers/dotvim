from stat import S_ISREG, ST_CTIME, ST_MODE

import os, sys, time, glob,shutil

search_dir = "/user/plt/bin"
dirs = filter(os.path.isdir, glob.glob(search_dir + "/" + "run_*"))
for dir in dirs:
   print "DIRS = " + dir
dirs_by_date_t = []
for d in dirs:
   date = os.path.getmtime(d)
   dirdate_tuple = (d, date)
   dirs_by_date_t.append(dirdate_tuple)

dirs_by_date_t.sort(key=lambda d: d[1])

max_range = len(dirs_by_date_t) - 3
print "MAX_RANGE = " + str(max_range)
for it in range(max_range):
   print "DIR : " + dirs_by_date_t[it][0]
   try:
      os.chmod(dirs_by_date_t[it][0], 0777)
      shutil.rmtree(dirs_by_date_t[it][0])
   except OSError, e:
      print e


