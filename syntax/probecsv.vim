" Vim syntax file
" Language:      LOG files
" Maintainer:    Paul Tiernan - Broadcom Corp
" Date Created:  24th April 2006
"
" Highlights Errors and Warnings in LOG files

"Ignore case of searches
syn case ignore

"Comments
syn match   logTBInfo     "%.*$"

"Include case of searches
syn case match


"Match Args
syn match   logAssert   "\${[A-Z0-9_]\+}"
syn match   logAssert   "^[A-Z0-9_]\+:"

"SCMP args
syn match   logWarning  "SCMP_ARGS.*$"


"Probe names
syn match   logInfo     "^[a-z0-9A-Z_-]\+,"



"Set highlight colours
:hi link logError    Error
:hi link logWarning  Statement
:hi link logInfo     Special
:hi link logAssert   Type
:hi link logTBInfo   PreProc

let b:current_syntax = "logfile"
