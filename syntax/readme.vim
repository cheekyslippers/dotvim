" Vim syntax file
" Language:      README files
" Maintainer:    Paul Tiernan - Broadcom Corp
" Date Created:  23th Jan 2007 
"
" Highlights stuff in README files



"Include case of searches
syn case match

"Highlight FIXME words:
syn match   logFixme    "FIXME"


"Set highlight colours
:hi link logFixme    Error

