" Vim syntax file
" Language:      Cadence NTF (Nested Text Format) files
" Maintainer:    Paul Tiernan - IMGTEC
" Date Created:  15th Oct 2013
"
" Syntax Highlighting for Cadence NTF files eg vsif

"Ignore case of searches
syn case ignore

"Text Matches
syn match   ntfComment  "\/\/.*$"
syn match   ntfPreProc  "^\s*#include.*$"
syn match   ntfPreProc  "^\s*#define.*$"
syn match   ntfPreProc  "^\s*#ifdef.*$"
syn match   ntfPreProc  "^\s*#ifndef.*$"
syn match   ntfPreProc  "^\s*#if.*$"
syn match   ntfPreProc  "^\s*#elif.*$"
syn match   ntfPreProc  "^\s*#endif.*$"
syn match   ntfConstant "\$[A-Z_]+"
syn region  ntfStr      start=+"+ end=+"+ contains=ntfConstant
syn region  ntfStr      start=+'+ end=+'+ contains=ntfConstant
syn region  ntfTemplate  start="<" end=+>+




"Include case of searches
syn case match

"Generic Keywords
syn keyword ntfPreProc #endif #else

"VSIF Keywords
syn keyword ntfType    session group test extend

"VSOF Keywords
syn keyword ntfType    session_output coverage_model coverage_data run_failure header run


" VSIF Session Container Attributes
syn keyword ntfVsifSessionKeyW create_debug_logs default_dispatch_parameters drm free_hosts master_submission_policy max_runs_in_parallel
syn keyword ntfVsifSessionKeyW model_dir output_mode post_session_dispatch_parameters pre_session_dispatch_parameters post_session_drm
syn keyword ntfVsifSessionKeyW pre_session_drm post_session_script pre_session_script session_description top_dir verification_scope
syn region sessionBlock start="session.*{" end="}" contains=ntfVsifSessionKeyW

" VSIF Test and Group Container Attributes
syn keyword ntfVsifTestGrpKeyW bundle_group repetitions auto_scan_args code_coverage count depends_on details dut_name exit_on gui_mode
syn keyword ntfVsifTestGrpKeyW hdl_files ifv_assertions ifv_effort ifv_engine ifv_halo pre_commands pre_group_script pre_run_script
syn keyword ntfVsifTestGrpKeyW post_commands post_group_script post_run_script post_simulate_script repetitions revision run_mode
syn keyword ntfVsifTestGrpKeyW run_script runs_dispatch_parameters scan_script seed sv_seed sve_name test_command timeout
syn keyword ntfVsifTestGrpKeyW top_files verbosity vplan_ref waveform
syn region testBlock start="test.*{" end="}" contains=ntfVsifTestGrpKeyW,ntfPreProc,ntfComment
syn region testBlock start="group.*{" end="}" contains=ntfVsifTestGrpKeyW,ntfPreProc,ntfComment

" VSOF Header container attributes
syn keyword ntfVsofHeaderKeyW version vmanager_version runner_version
syn region headerBlock start="header.*{" end="}" contains=ntfVsofHeaderKeyW



" VSOF Session_Output container attributes
syn keyword ntfVsofSessionOpKeyW runs_in_session session_dir session_duration session_end_time session_id session_name
syn keyword ntfVsofSessionOpKeyW session_start_time session_status
syn region sessionOutputBlock start="session_output.*{" end="}" contains=ntfVsofSessionOpKeyW

" VSOF Run container attributes
syn keyword ntfVsofRunKeyW compaction coverage_file cpu_time drm_job_id drm_job_name drm_job_status duration end_time first_failure_description
syn keyword ntfVsofRunKeyW first_failure_kind first_failure_log first_failure_module first_failure_time first_failure_tool
syn keyword ntfVsofRunKeyW full_title host_name job_status log_file original_runs rerun_id run_dir run_id start_time
syn keyword ntfVsofRunKeyW simulation_time status system_time test_group test_name user_time vsif
syn region runBlock start=/run.*{/ end=/}/ contains=ntfVsofRunKeyW

" VSOF Run_Faulure container attributes
syn keyword ntfVsofRunFailKeyW context description kind module original_description reference severity time tool
syn region runFailBlock start=/run_failure.*{/ end=/}/ contains=ntfVsofRunFailKeyW



"Set highlight colours
:hi link ntfError               Error
:hi link ntfSpecial             Special
:hi link ntfConstant            Constant
:hi link ntfType                Type
:hi link ntfPreProc             PreProc
:hi link ntfVsifSessionKeyW     Keyword
:hi link ntfVsifTestGrpKeyW     Keyword
:hi link ntfVsofHeaderKeyW      Keyword
:hi link ntfVsofSessionOpKeyW   Keyword
:hi link ntfVsofRunKeyW         Keyword
:hi link ntfVsofRunFailKeyW     Keyword
:hi link ntfComment             Comment
:hi link ntfStr                 String
:hi link ntfTemplate            PreProc

let b:current_syntax = "ntf"
