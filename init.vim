let g:python_host_prog='/usr/local/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

"let g:phpqa_messdetector_autorun = 0
"let g:phpqa_codesniffer_autorun = 0
"let g:phpqa_codecoverage_autorun = 0
"let g:phpqa_codecoverage_file = "build/logs/clover.xml"
"
set mouse=a


set nocompatible
set autoread
filetype off
let mapleader=","

set inccommand=split

call plug#begin("~/.nvim/bundle")
" Plugin List
Plug 'rking/ag.vim' " searching through :Ag <pattern>
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'Yggdroot/indentLine' " This plugin is used for displaying thin vertical lines at each indentation level for code indented with spaces
Plug 'jlanzarotta/bufexplorer' " use \bt to toggle buffers
Plug 'bigeagle/molokai'  " color theme
Plug 'vim-airline/vim-airline'  " line at the bottom

Plug 'hashivim/vim-terraform' " github

"Plug 'afternoon/vim-phpunit'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown' " https://github.com/plasticboy/vim-markdown.git

"Plug 'us3r64/vim-phpqa'

"""" 1
"Plug 'shawncplus/phpcomplete.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'shougo/deoplete.nvim'
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:phpcd_php_cli_executable = '/usr/local/bin/php'

Plug 'airblade/vim-gitgutter'

"""" 2
Plug 'scrooloose/nerdtree'

" enable only one below
Plug 'scrooloose/syntastic' " linter
"Plug 'benekastah/neomake' "linter

Plug 'https://github.com/digitaltoad/vim-pug' " Jade / PUG syntax
Plug 'https://github.com/AndrewRadev/linediff.vim' "Linediff
Plug 'majutsushi/tagbar'
nmap <D-y> :TagbarOpenAutoClose<cr>

nmap <D-#> :tabn<cr>
nmap <D-!> :tabp<cr>

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'janko-m/vim-test'

Plug 'vim-php/tagbar-phpctags.vim'
Plug 'StanAngeloff/php.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

nmap <D-p> :Files<cr>
nmap <D-S-p> :Tags<cr>
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"""" 3
"Plug 'Shougo/neco-vim'
"Plug 'tpope/vim-rhubarb'
"Plug 'vim-scripts/DrawIt'
"Plug 'justinmk/vim-gtfo'


"Plug 'joonty/vim-phpqa'
"Plug 'SevereOverfl0w/deoplete-github'
"Plug 'floobits/floobits-neovim'
"Plug 'embear/vim-localvimrc'



"Plug 'terryma/vim-multiple-cursors'
"Plug 'easymotion/vim-easymotion'
"Plug 'jrosiek/vim-mark'
"Plug 'kien/rainbow_parentheses.vim'

"Plug 'mattn/emmet-vim'
"Plug 'hdima/python-syntax'
"Plug 'hynek/vim-python-pep8-indent'
"Plug 'fatih/vim-go'
"Plug 'lervag/vim-latex'
"Plug 'kchmck/vim-coffee-script'
"Plug 'cakebaker/scss-syntax.vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax' 
"Plug 'sudar/vim-arduino-syntax'
"Plug 'zaiste/tmux.vim'
"Plug 'lepture/vim-jinja'
"Plug 'cespare/vim-toml'
""Plug 'mxw/vim-jsx'
"Plug 'isRuslan/vim-es6'
"Plug 'bigeagle/sieve.vim'

"Plug 'caio/querycommandcomplete.vim'

"Plug '~/.nvim/bundle/colorpicker'

call plug#end()

" UI
if !exists("g:vimrc_loaded")
    colorscheme molokai
    let g:molokai_original = 1
" 	set termguicolors
    if has("gui_running")
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
        set gfw=STHeiti\ 9
        set langmenu=en_US
        set linespace=0
        call MacMenu("File.Print", "")
    endif " has
endif " exists(...)

set so=10
set number
syntax on
filetype on
filetype plugin on
filetype indent on

set list lcs=tab:\¦\   

if has("autocmd")  " go back to where you exited
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

set completeopt=longest,menu " preview

"if has('mouse')
"    set mouse=a
"    set selectmode=mouse,key
"    set nomousehide
"endif

set clipboard+=unnamedplus


set autoindent
set modeline
"set cursorline

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set splitbelow
set splitright

set noshowmatch
set matchtime=0
set nobackup
set nowritebackup
set directory=~/.nvim/.swapfiles//

if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

set fenc=utf-8
set fencs=utf-8
set enc=utf-8

"按缩进或手动折叠
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldcolumn=0 "设置折叠区域的宽度
set foldlevelstart=200
set foldlevel=200  " disable auto folding
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vnoremap <Space> zf


set smartcase
set ignorecase
set nohlsearch
set incsearch

nmap T :tabnew<cr>
nmap <S-D-f> :Ag<space>
nmap <F8> :Make docs<cr>
nmap <f9> :TestSuite<cr>
nmap <leader><up> :Ex<cr>
nmap <leader>. :new ~/.config/nvim/init.vim<cr>
nmap <leader>n :new<cr>
noremap <D-s> :w<cr>
inoremap <D-s> <esc>:w<cr>a

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()

function ScriptHeader()
    if &filetype == 'python'
        let header = "#!/usr/bin/env python2"
        let coding = "# -*- coding:utf-8 -*-"
        let future = "from __future__ import print_function, division, unicode_literals"
        let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
    elseif &filetype == 'sh'
        let header = "#!/bin/bash"
    elseif &filetype == 'pug'
        set ts=2
    endif
    let line = getline(1)
    if line == header
        return
    endif
    normal m'
    call append(0,header)
    if &filetype == 'python'
        call append(1, coding)
        call append(2, future)
        call append(4, cfg)
    endif
    normal ''
endfunction


autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

source ~/.nvim/config/airline.vim
source ~/.nvim/config/tagbar.vim
source ~/.nvim/config/nerdtree.vim
source ~/.nvim/config/cscope.vim
source ~/.nvim/config/syntastic.vim
"source ~/.nvim/config/neomake.vim
"source ~/.nvim/config/ctrlp.vim


nmap <silent> <leader>t :TestNearest<CR>


" Set up NeoMake
"autocmd! BufWritePost,BufEnter * Neomake
"let g:neomake_open_list = 2
"let g:neomake_error_sign = { 'text': ">>", 'texthl': 'NeoMakeErrorDefault' }
let test#strategy = 'neovim'

let g:deoplete#enable_at_startup = 1

" Load local config if exists
if filereadable(expand("~/.nvim/config/local.vim"))
	source ~/.nvim/config/local.vim
endif
