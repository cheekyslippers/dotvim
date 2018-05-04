" Vim syntax file
" Language:      WAIVER files
" Maintainer:    Paul Tiernan
" Date Created:  24th April 2018
"
" Highlights key words in waiver files

"Include case of searches
syn case match


"Key Words
syn keyword   waiverAssert    COV
syn keyword   waiverTBInfo    EXCLUDE
syn keyword   waiverFunc      BLOCK TOGGLE
syn keyword   waiverColour    MODULE GENMODULE 
syn keyword   waiverInfo      RANGE SIGNAL


"Pattern Matching
syn match   waiverComment     "--\s*\<\(COV\>\)\@!.*$"
syn match   waiverComment     "^--\s*$"
syn match   waiverComment     "^--\s*[#-/].*$"
syn match   waiverInc         "tag\d\+"
syn match   waiverFunc        "CONDITION\(\.\d+\)\?"
syn match   waiverComment     "REASON:.*$"
syn match   waiverWarning     "#if [!_A-Z].*$"
syn match   waiverWarning     "#ifdef [!_A-Z].*$"
syn match   waiverWarning     "#ifndef [!_A-Z].*$"
syn match   waiverWarning     "#else.*$"
syn match   waiverWarning     "#endif.*$"
syn match   waiverKey         "`include"


"Set highlight colours
:hi link waiverError    Error
:hi link waiverWarning  Statement
":hi link waiverInfo     Special
:hi link waiverInfo     Constant
:hi link waiverAssert   Type
:hi link waiverIMGCol   Type
:hi link waiverTBInfo   PreProc
:hi link waiverColour   Constant
:hi link waiverIgnore   Ignore
:hi link waiverConstant Constant
:hi link waiverInc      Include
:hi link waiverComment  Comment
:hi link waiverKey      Keyword
:hi link waiverFunc     Function

let b:current_syntax = "waiverfile"
