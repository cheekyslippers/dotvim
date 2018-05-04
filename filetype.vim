" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.log          setfiletype logfile
  au! BufRead,BufNewFile *.err          setfiletype logfile
  au! BufRead,BufNewFile *.errs         setfiletype logfile
  au! BufRead,BufNewFile *_log          setfiletype logfile
  au! BufRead,BufNewFile *.vhd_dcclean  setfiletype vhdl
  au! BufRead,BufNewFile *.vhdm         setfiletype vhdl
  au! BufRead,BufNewFile *.vunit        setfiletype vhdl
  au! BufRead,BufNewFile *.va           setfiletype verilog
  au! BufRead,BufNewFile *.vams         setfiletype verilogams
  au! BufRead,BufNewFile *.v_et         setfiletype verilog
  au! BufRead,BufNewFile README         setfiletype readme
  au! BufRead,BufNewFile *.do           setfiletype tcl
  au! BufRead,BufNewFile *.rtf          setfiletype perl
  au! BufRead,BufNewFile *.sv           setfiletype verilog_systemverilog
  au! BufRead,BufNewFile *.svh          setfiletype verilog_systemverilog
  au! BufRead,BufNewFile *.scr          setfiletype tcl
  au! BufRead,BufNewFile *cshrc         setfiletype csh
  au! BufRead,BufNewFile *.SHW          setfiletype logfile
  au! BufRead,BufNewFile *.vsif         setfiletype ntf
  au! BufRead,BufNewFile *.vsof         setfiletype ntf
  au! BufRead,BufNewFile *.f            setfiletype tcl
  au! BufRead,BufNewFile *.ecom         setfiletype specman
  au! BufRead,BufNewFile *.waiver       setfiletype waiverfile
augroup END

augroup filetypedetect
        au BufNewFile,BufRead *.wiki     setf twiki
        au BufNewFile,BufRead /tmp/mozex/mozex.textarea*.txt setf twiki
augroup END

