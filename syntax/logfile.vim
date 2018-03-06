" Vim syntax file
" Language:      LOG files
" Maintainer:    Paul Tiernan
" Date Created:  24th April 2006
"
" Highlights Errors and Warnings in LOG files

"Ignore case of searches
syn case ignore

"Information Messages
syn match   logInfo     "info.*$"
syn match   logInfo     "report.*$"
syn match   logInfo     "pass.*$"
syn match   logInfo     "passed.*$"
syn match   logInfo     "note.*$"

"Warning Messages
syn match   logWarning  "warning.*$"

"Error Messages
syn match   logError    "error.*$"
syn match   logError    "fail.*$"
syn match   logError    "failed.*$"




"Include case of searches
syn case match

"Keywords
syn keyword logAssert   ASSERT

"Information Messages
syn match   logInfo     "COMPILE_REPORT.*$"
syn match   logInfo     "\*N.*$"
syn match   logTBInfo  "TESTBENCH_REPORT.*$"
syn match   logTBInfo  "DEBUG.*$"
syn match   logInfo    "VERBOSE.*$"
syn match   logInfo    "TRACE.*$"
syn match   logInfo    "UVM_INFO.*$"

"Warning Messages
syn match   logWarning  "\*W.*$"
syn match   logWarning  "REPORT\/WARNING.*$"
syn match   logWarning  "TESTBENCH_WARNING.*$"
syn match   logWarning  "UVM_WARNING.*$"

"Error Messages
syn match   logError    "TESTBENCH_ERROR.*$"
syn match   logError    "COMPILE_ERROR.*$"
syn match   logError    "\*E.*$"
syn match   logError    "\*F.*$"
syn match   logError    "UVM_ERROR.*$"
syn match   logError    "UVM_FATAL.*$"

" IMGTEC log colours
syn match   logIgnore   /\%x1b\[\d\+m.*\%x1b\[0m/ contains=logIMGCol
syn match   logImgCol   /GENERATED/  contained
syn match   logImgCol   /Cadence .* version \d\+\.\d\+/  contained



"Set highlight colours
:hi link logError    Error
:hi link logWarning  Statement
":hi link logInfo     Special
:hi link logInfo     Constant
:hi link logAssert   Type
:hi link logIMGCol   Type
:hi link logTBInfo   PreProc
:hi link logColour   Constant
:hi link logIgnore   Ignore
:hi link logConstant Constant

let b:current_syntax = "logfile"
