" MIT License. Copyright (c) 2013-2016 Bailey Ling.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

" Due to some potential rendering issues, the use of the `space` variable is
" recommended.
let s:spc = g:airline_symbols.space

" First we define an init function that will be invoked from extensions.vim
function! airline#extensions#ipy#init(ext)

  " Here we define a new part for the plugin.  This allows users to place this
  " extension in arbitrary locations.
  "call airline#parts#define_raw('cats', '%{airline#extensions#ipy#get_cats()}')

  " Next up we add a funcref so that we can run some code prior to the
  " statusline getting modifed.
  call a:ext.add_statusline_func('airline#extensions#ipy#apply')

  " You can also add a funcref for inactive statuslines.
  " call a:ext.add_inactive_statusline_func('airline#extensions#ipy#unapply')
endfunction

" This function will be invoked just prior to the statusline getting modified.
function! airline#extensions#ipy#apply(...)

  " First we check for the filetype.
  if &filetype == "python.jupyter"
    " Let's say we want to append to section_c, first we check if there's
    " already a window-local override, and if not, create it off of the global
    " section_c.
    "let w:airline_section_d = get(w:, 'airline_section_d', g:airline_section_d)

    " Then we just append this extenion to it, optionally using separators.
    "let w:airline_section_d .= s:spc.g:airline_left_alt_sep.s:spc.'%{airline#extensions#ipy#get_cats()}'

    call airline#extensions#append_to_section('x',s:spc.g:airline_right_sep.'%{IPyStatus()}')
  endif
endfunction
