let g:python_host_prog='/usr/bin/python3'

set nocompatible
filetype off
let mapleader=","


call plug#begin("~/.nvim/bundle")
" Plugin List
Plug 'rking/ag.vim' " searching through :Ag <pattern>
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'Yggdroot/indentLine' " This plugin is used for displaying thin vertical lines at each indentation level for code indented with spaces
Plug 'jlanzarotta/bufexplorer' " use \bt to toggle buffers
Plug 'bigeagle/molokai'  " color theme
Plug 'vim-airline/vim-airline'  " line at the bottom
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic' " linter
Plug 'https://github.com/AndrewRadev/linediff.vim' "Linediff
Plug 'https://github.com/digitaltoad/vim-pug' " Jade / PUG syntax

Plug 'benekastah/neomake'
Plug 'afternoon/vim-phpunit'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' " https://github.com/plasticboy/vim-markdown.git
Plug 'shawncplus/phpcomplete.vim'
Plug 'shougo/deoplete.nvim'
Plug 'SevereOverfl0w/deoplete-github'
Plug 'Shougo/neco-vim'
Plug 'tpope/vim-rhubarb'
"Plug 'floobits/floobits-neovim'


Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/DrawIt'
Plug 'terryma/vim-multiple-cursors'
"Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
"Plug 'embear/vim-localvimrc'
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
Plug 'tpope/vim-fugitive'
"Plug 'sudar/vim-arduino-syntax'
"Plug 'zaiste/tmux.vim'
"Plug 'lepture/vim-jinja'
"Plug 'cespare/vim-toml'
""Plug 'mxw/vim-jsx'
"Plug 'isRuslan/vim-es6'
"Plug 'bigeagle/sieve.vim'

"Plug 'caio/querycommandcomplete.vim'
Plug 'justinmk/vim-gtfo'

Plug '~/.nvim/bundle/colorpicker'
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
nmap <F8> :make docs<cr>
nmap <f9> :make tests<cr>
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


source ~/.nvim/config/airline.vim
source ~/.nvim/config/tagbar.vim
source ~/.nvim/config/nerdtree.vim
source ~/.nvim/config/cscope.vim
source ~/.nvim/config/syntastic.vim
source ~/.nvim/config/ctrlp.vim
let g:deoplete#enable_at_startup = 1

" Load local config if exists
if filereadable(expand("~/.nvim/config/local.vim"))
	source ~/.nvim/config/local.vim
endif
