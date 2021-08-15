"Gui options that override the standard .vimrc options set for non-gui
"application
"
"Paul Tiernan @ 2006

"Set font to use (some commented if want to use for a change)
"Can type xfontsel from xterm to try out different fonts

"or use the following for gtk2:
"   eg guifont = Courier\ New\ 9
"   eg guifont = Courier\ New/9/-1/5/50/0/0/0/1/0
"   where the separations in order are:
"      1) font family (Courier New)
"      2) point size (10 default)
"      3) pixel size (-1 default)
"      4) style hint (what to do if req family can't be found)
"      5) weight     (50=normal, 25=light, 63=semibold, 75=bold,87=black)
"      6) italic     (0 = no)
"      7) underline  (0 = no)
"      8) strikeout  (0 = no)
"      9) fixedpitch (1 = yes)
"      10) raw       (0 = no)

"   Can also use : as separator:
"   eg  guifont = Courier_New:h11:b1    (h = height, b=bold)

set t_Co=256


if has("gui_gtk2")
  "Use 'fc-list' on command line to see installed fonts
  set guifont=misc\ fixed\ 10
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
"  set guifont=Liberation\ Mono\ 8 
"   set guifont=Monospace\ 8
elseif has("x11")
  "Use 'xlsfonts' on command line to see installed fonts
"  set guifont=-*-rockwell-medium-r-normal-*-*-*-*-*-*-*-*
"  set guifont=-misc-fixed-medium-r-normal-*-*-120-*-*-c-80-iso8859-1
"  set guifont=-misc-fixed-medium-r-normal--10-100-75-75-c-60-iso8859-1
"  set guifont=-misc-fixed-medium-r-normal-*-*-120-*-*-*-*-iso8859-1
"  set guifont=-dt-*-medium-r-normal-msans-*-140-*-*-*-*-*-*
"  set guifont=-bitstream-chart
  set guifont=-*-lucidatypewriter-medium-r-normal-*-*-140-*-*-*-*-iso8859-*
"  set guifont=-adobe-courier-medium-r-*-*-*-120-*-*-*-*-*-*
"  set guifont=-hp-fixed-medium-r-*-*-*-160-*-*-*-*-*-*
"  set guifont=-linotype-medium-r-*-*-*-140-*-*-*-*-*-*
"  set guifont=-monotype-gillsans-medium-r-*-*-*-140-*-*-*-*-*-*
"  set guifont=-ricoh-*-medium-r-*-*-*-160-*-*-*-*-*-*
"  set guifont=-dt-*-medium-r-normal-*-12-100-72-72-m-70-iso8859-1  "xl-cbga-19 from Citrix
else
"  set guifont=Courier_New:h11:cDEFAULT
   set guifont=Bitstream:h11:cDEFAULT
   set guifg=white
   set guibg=#696969
endif

"Set background/visual highlight colours
"highlight Normal guibg=#696969
"highlight Normal guifg=black
"highlight Visual guibg=darkyellow

"colorscheme desert
"colorscheme elflord
colorscheme afterglow


"highlight Normal     ctermfg=White
"highlight Comment    ctermfg=111                     " Blue for comments
"highlight Constant   ctermfg=174                     " Browny red for numbers
"highlight Special    ctermfg=214                     " Orange
"highlight Statement  term=bold ctermfg=136           " Light brown
"highlight Type       ctermfg=35                      " Green
"highlight PreProc    ctermfg=139                     " Purple
"highlight Error      ctermfg=White ctermbg=Red
"highlight Identifier term=none     ctermfg=51        " Light blue
"highlight Keyword    term=bold     ctermfg=228       " Light yellow
"highlight String     ctermfg=lightmagenta            " Magenta
