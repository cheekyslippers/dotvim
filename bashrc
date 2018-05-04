##############################
# SITE bashrc FILE
##############################
#if [ -f /etc/bashrc ]; then
#  . /etc/bashrc
#fi

##############################
#i ENV SETUP
##############################
if [ ! $SITE_LOADED_ME ]; then                                               # Only load this script once
   source ${HOME}/.bashrc_env                                                # Set all ENV variables from original CSH script (for site setup)
   export SITE_LOADED_ME=""                                                  # Ensure only loaded once
fi

# Cadence
if [ -n $INCISIV_VERSION ]; then
   export INCISIV_VERSION=16.06
   export INCISIV_PATCH=005
fi

if [ -n $CDS_INST_DIR ]; then
   export CDS_INST_DIR=/vl/edatools/extern/tools/Cadence/INCISIV/${INCISV_VERSION}/${INCISIV_PATCH}
fi

# Mentor
if [ -n $QUESTA_VERSION ]; then
   export QUESTA_VERSION=10.4e_beta
fi

# Synopsys
if [ -n $SCIROCCO_VERSION ]; then
   export SCIROCCO_VERSION=2016.06-SP1-T0906
   export VCS_ARCH_OVERRIDE=linux
   export VCS_HOME="/vl/edatools/extern/Synopsys/VCS/$SCIROCCO_VERSION"

   # verdi
   export NOVAS_VERSION=2016.06-SP1-T0906
   export NOVAS_HOME="/vl/edatools/extern/Novas/verdi/${NOVAS_VERSION}"
   export VERDI_VERSION=${NOVAS_VERSION}
   export VERDI_HOME="/vl/edatools/extern/Novas/verdi/${VERDI_VERSION}"
   export VERDI_NCSIM_LIB64_PATH="${NOVAS_HOME}/share/PLI/IUS/LINUX64"
   export VERDI_VCS_LIB64_PATH="${NOVAS_HOME}/share/PLI/VCS/LINUX64"
   export VERDI_NCSIM_LIB32_PATH="${NOVAS_HOME}/share/PLI/IUS/LINUX"
   export VERDI_VCS_LIB32_PATH="${NOVAS_HOME}/share/PLI/VCS/LINUX"
   export FSDB_IUS_NO_BUS_SPLIT=1 ## found this on cadence support site; Solution ID:	11797850
fi

# Parse GIT Branch for prompt
parse_git_branch() {                                                         # Function to determine GIT branch for use in command prompt
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#Generic ENV variables
export PS1="\h:\[\e[0;32m\]\w\[\e[0;33m\]\$(parse_git_branch)>\[\e[0m\] "
export SHELL=/bin/bash                                                       # Specific SHELL variable for BASH (override from CSH)
export EDITOR=vim                                                            # Default editor
export VISUAL=gvim                                                           # Default VISUAL editor
export CVSEDITOR=vim                                                         # Editor for CVS
export HISTFILESIZE=3000                                                     # Size of command line history log
export HISTCONTROL=ignoredups                                                # Ignore duplicates in the history log
export PYTHONPATH=~/python                                                   # Python script path
export LPDEST=lp                                                             # ENV var for printing
export PERLDB_OPTS='NonStop=1 frame=0'                                       # Perl override args for better debug
export TZ=/usr/share/zoneinfo/Europe/London                                  # Override Shell Timezone to geographical choice
export HOST=`uname -n`                                                       # Set $HOST in addition to $HOSTNAME, used by some scripts
export MATLABVER=7.9.0                                                       # Matlab Version
export GITVER=1.7.6                                                          # GIT version
export OSREL=`uname -r`                                                      # Release Number of Operating System
export OSNAME=`uname -s`                                                     # Name of Operating System
export PATH=/user/plt/bin:$PATH                                              # Add local bin to PATH
export PATH=/user/plt/tools/git_tool/bin:$PATH                               # Add GIT tools to PATH



#Display setting for PuTTY with GoGlobal
#if [ $HOST == hhgw20 ] || [ $HOST == hhgw11 ] || [ $HOST == hhgw03 ]; then                                                 # Automatically set DISPLAY to existing GoGlobal assignment
#   displaynum=`ps -aef | grep "$USER.*xinit.*gowm" | grep -v grep | sed "s/.*\(:[0-9]*\).*/\1/"`
#   export DISPLAY="${HOST}${displaynum}";                                    # Need a way to ignore this if using VNC or a tool other than GoGlobal/PuTTY
#fi


#Display setting for VNC with BASH
export PID=`pgrep -n -u $USER gnome-session`
if [ "${PID}x" = "x" ]; then
   export PID=`pgrep -n -u $USER xinit`
fi
if [ $HOST == hhgw20 ] || [ $HOST == hhgw11 ] || [ $HOST == hhgw03 ]; then                                                 # Automatically set DISPLAY to last started gnome-session (which would have spawned the VNC server)
   if [ "${PID}x" != "x" ]; then
      export DISPLAY=`grep -z ^DISPLAY= /proc/$PID/environ | sed 's/DISPLAY=//g'`
      echo "DISPLAY set to $DISPLAY"
   else
      echo "Could not set DISPLAY - currently set to $DISPLAY"
   fi
fi
xhost + >/dev/null                                                           # Must be set AFTER display/host setup above. Allow other machines (eg GRID) to display on this terminal eg GUI



# LS colours
export CLICOLOR=true                                                         # Enable command colour output in terminal
# Order: dir - symlink - socket - pipe - exec - block special - char special - exec setuid - exec setgid - public dir sticky bit - public dir no sticky bit
export LS_COLORS='no=00:fi=00:di=01;90:ln=01;33:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;33;41:ex=01;37:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;93:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;93:*.Z=01;93:*.gz=01;93:*.bz2=01;31:*.bz=01;31:*.tz=01;93:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:*.txt=90:*.v=35:*.sv=35:*.c=94:*.h=94:*.cc=94:*.cpp=94:*.log=33:*.pm=32'      # Manually override default LS colours (suitable for black bg and white fg)



# Perforce ENV Vars
export IMGUSER=plt                                       # Imagination Unix User Acct
export REALUSER=plt                                      # Requested by IMG eda team
export P4PORT=p4master.hh.imgtec.org:1666                # Perforce Server
export P4USER=paul.tiernan                               # Windows/P4 user id
export P4CONFIG=.p4rc                                    # Local config file in workspace top -NOTE $P4CLIENT set in this file
export P4MERGE=/vl/edatools/tools/wrappers/p4merge       # Use Perforce merge tool as it handles 3way merge better than VIM
export QT_GRAPHICSSYSTEM=native                          # Use OpenGL renderer for p4v instead of native X11 renderer, which shoiuld speed up the gui
export SETUP_ROGUE_SCRIPTS=/user/plt/bin/setup_rogue     # Setup Scripts for ROGUE ENV variables


# Disable annoying system bell in prompt window only
case $TERM in
  *term | rxvt)
    if [ "$TERM" == "xterm" ] || [ "$TERM" == "xterm-color" ] || [ "$TERM" == "xterm-256color" ]; then
      /usr/bin/xset -b
      /usr/bin/xset b 0 0 0
    fi ;;
  *)
  ;;
esac



##############################
# ALIASES
##############################
# LS aliassing
if [ "$OSNAME" == "Linux" ]; then
  alias egrep="egrep --color=auto"                                       # Get colours in egrep output
  alias fgrep="fgrep --color=auto"                                       # Get colours in fgrep output
  alias grep="grep --color=auto"                                         # Get colours in grep output
  alias ltr="ls -lhtrL --color=tty"                                      # Reverse time full listing + colours + human readable size
  alias ltra="ls -lhtraL --color=tty"                                    # Reverse time full listing + hidden files + colours + human readable size
  alias ll="ls -lh --color=tty"                                          # Full listing + colours + human readable size
  alias la="ls -lahL --color=tty"                                        # Full listing + hidden files + colours + human readable size
  alias ld="ls -ltrhL --color=tty | grep ^d"                             # Reverse time directory list only (full) + colours + human readable size
  alias lda="ls -ltrahL --color=tty | grep ^d"                           # Reverse time directory list only + hidden dirs + colours + human readable size
  alias ls="ls --color=tty"                                              # Add colours to nomal ls command
  lm() { ls -laL $@ --color=tty | more; }                                # Full listing + hidden files + colours + piped through more
else
  alias ltr="ls -ltrh"                                                   # See above for Linux equivalent expectation
  alias ltra="ls -ltrah"
  alias ll="ls -lh"
  alias la="ls -lahL"
  alias ld="ls -ltrhL | grep ^d"
  alias lda="ls -ltrahL | grep ^d"
  lm() { ls -lahL $@ | more; }
fi

# Generic Aliases
alias h="history"                                                        # Shortcut for regularly used history command
alias p="enscript"                                                       # Shortcut to printing command
alias m="more"                                                           # Shortcut to regularly used more command, useful for grep piping
alias top="top -b -n 1 | grep ${USER}"                                   # Re-direct TOP for me only, single frame capture in batch mode
alias tmux="tmux -u -2"                                                  # ensure UTF-8 encoding works for tmux, and ensure 256-color terminals are understood

# editor
alias v="/usr/bin/vim"                                                   # Location of system VIM tool (avoid EDA wrappers)
alias g="/usr/bin/gvim -fg white -bg black"                              # Force colours for gvim
alias gvim="/usr/bin/gvim -fg white -bg black"                           # Force colours for gvim
alias vim="/usr/bin/vim"                                                 # Location of system VIM tool (avoid EDA wrappers)
alias gvimdiff="/usr/bin/gvimdiff -fg white -bg black"                   # Force colours for gvimdiff
alias s="/user/plt/sublime_text_3/sublime_text"                          # Sublime Text



# XVNC SERVER
alias vncserver="vncserver -alwaysshared -geometry 3800x1160 -depth 24"  # Ensure suitable args for a new VNC session
alias vncserv_laptop="vncserver -alwaysshared -geometry 1900x1040 -depth 24"  # Ensure suitable args for a new VNC session

# Python
alias python='/vl/edatools/bin/python2.7'

#Cadence
alias nchelp='eval `ncroot`/tools/bin/nchelp'
alias cdnshelp='eval `ncroot`/tools/bin/cdnshelp'

#Eclipse
alias ecl='. ~/bin/eclsetup_bash && eclipse &'

# Perforce
# (Note use of functions to allow remaining args ($@) to be used mid-cmd, alias would not allow this)
p4op() { p4 opened $@ | /user/plt/bin/perf-opened-colours.py; }            # Use local colours script for p4 opened
p4chs() { p4 changes -t -m 50 $@ | ~/bin/perf-changes-colours.py; }        # Use local colours script for p4 changes and limit to 50 records
p4diff() { p4 diff $@ | ~/bin/perf-diff-colours; }                         # Use local colours script for p4 diff
p4diff2() { p4 diff2 $@ | ~/bin/perf-diff-colours; }                       # Use local colours script for p4 diff
p4sync() { p4 sync $@ | ~/bin/perf-sync-colours; }                         # Use local colours script for p4 sync
p4chs-mypend() { p4 changes -t -m50 -s pending -u paul.tiernan $@ | ~/bin/perf-changes-colours.py; } # Use local colours script for p4 changes - my pending only (50 max)
p4chs-mysubmit() { p4 changes -t -m50 -s submitted -u paul.tiernan $@ | ~/bin/perf-changes-colours.py; } # Use local colours script for p4 changes - my submitted only (50 max)
p4desc() { p4 describe -s $@ | ~/bin/perf-describe-colours.py; }           # Use local colours script for p4 describe
p4desc-diff() { p4 describe $@ | ~/bin/perf-describe-colours.py; }         # Use local colours script for p4 describe
p4desc-shlv() { p4 describe -S -s $@ | ~/bin/perf-describe-colours.py; }   # Use local colours script for p4 describe shelved files
p4desc-shlv-diff() { p4 describe -S $@ | ~/bin/perf-describe-colours.py; } # Use local colours script for p4 describe shelved files plus differences
alias p4login='p4 login -a'                                                # Login on ALL hosts to avoid annoying request from GRID machine when running build

#Kew (using LSF commands)
alias bjobs="sgeqstat -u $USER"                                            # bjobs conversion from qstat
alias bkill="sgeqdel"                                                      # bkill conversion from qstat
alias bstat="sgeqhost"                                                     # qhost lists available farm hosts
alias bsub="do.grid"                                                       # submit a farm job
alias xlsbatch="sgeacctgui"                                                # farm status gui - (hard to use and slow)
alias dog="do.grid -vmem 6000 -mem 1000 -kew BETA -do"                     # farm default invocation command for non-text jobs
alias doggy="do.grid -vmem 6000 -kew GAMMA -do"                            # farm invocation command for non-text jobs on a heftier queue



#Setup Scripts
alias swann='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_series7.sh swann'
alias dutton='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_series8.sh dutton 02'
alias buckle='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_series8.sh buckle 01'
alias fuji='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_series8.sh fuji 01'
alias ewa='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_eclipse.sh buckle 01'
alias soak='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_soak.sh buckle 01'
alias sbl='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_sublime.sh buckle 01'
alias gwa='. ~/.bashrc; . $SETUP_ROGUE_SCRIPTS/setup_rogue_git.csh marlowe4 22'

#Some project env vars that might be useful in copy etc
export CO_FLINT="/user/plt/projects/series6xe/FLINT"
export CO_KELLY="/user/plt/projects/series6xe/KELLY"
export CO_FLINT_7XE="/user/plt/projects/series7xe/FLINT_7XE"
export CO_SERIES6XE="/user/plt/projects/series6xe"
export CO_SERIES7XE="/user/plt/projects/series7xe"
export CO_SERIES7="/user/plt/projects/series7"
export CO_SERIES8="/user/plt/projects/series8"
export CO_FLINTREGR="/user/plt.tmp/regressions/series6xe/FLINT"
export CO_KELLYREGR="/user/plt.tmp/regressions/series6xe/KELLY"
export CO_7XEREGR="/user/plt.tmp/regressions/series7xe/FLINT_7XE"

export CO_EWA="/user/plt/projects/ecl/MAIN"
export CO_GIT="/user/plt.tmp/git-projects/volcanic-MAIN"

# Enable CSIM logging
export UVMC_LOGGING_MODE='RECORD'
export RGX_UVM_LOG=1

# SUBSYSTEM TB LIST
export SS_TB_LIST='rgx_cdm_full_tb,rgx_cdm_pipe_tb,rgx_cdm_wrap_tb,rgx_fbcdc_fbhc_uvm_tb,rgx_fbcdc_fbsc_uvm_tb,rgx_fbcdc_fbm_uvm_tb,rgx_pbe3_tb,rgx_tf_tb,rgx_madd_tb,rgx_tag_tb,rgx_madd_astc_col_interp_formal,rgx_madd_astc_ind_interp_formal,rgx_madd_astc_pp_formal,rgx_madd_astc_ref_model_tb,rgx_madd_astc_top_formal,rgx_madd_pvrtc_formal,rgx_madd_pvrtc_ubil_5_3_formal,rgx_tag_arb,rgx_tf_comp'

# Needed to force PS1 to work straight after bash included
cd .
