
 let g:syntastic_rst_checkers = ['sphinx']

let g:neomake_rst_enabled_makers = ['sphinx']
let g:neomake_verbose=3
"let g:neomake_logfile='/tmp/nm.log'

let g:neomake_list_height = 2     " this doesn't work but hopefully will someday

let g:neomake_open_list = 2
"let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake
" get out of the the quickfix menu... there must be a discrepancy between
" vim/neovim in how the location lists are created
function SwitchBackIfInQuickfix()
  if &buftype == 'quickfix'
    wincmd p
    exe "norm! 6\<C-Y>"
  endif
endfunction
autocmd! User NeomakeFinished :call SwitchBackIfInQuickfix()

let g:neomake_warning_sign = {
  \ 'text': '⚠',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'ErrorMsg',
  \ }
