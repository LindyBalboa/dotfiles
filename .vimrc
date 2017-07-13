set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'lervag/vimtex'
Plugin 'fugitive.vim'
Plugin 'vim-flake8'
Plugin 'surround.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways'
Plugin 'ZoomWin'
Plugin 'Yggdroot/indentLine'
Plugin 'kopischke/fish.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

source $VIMRUNTIME/macros/matchit.vim

function! Au_python()
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent
endfunction

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Python specific
au BufRead,BufNewFile *.py :call Au_python()
au BufWritePre,FileWritePre *.py :%s/\s\+$//g " Delete trailing whitespace

function! Au_latex()
    imap .<Space> .<CR>
	imap ?<Space> ?<CR>
	imap !<Space> !<CR>

	:2mat none

	:set spell spelllang=en_us
	" use 2zg and 2zw to add to dictionary only for local directory
	:setlocal spellfile+=~./vim/spell/en.utf-8.add
	:setlocal spellfile+=localspell.utf-8.add
	:hi SpellBad ctermfg=black
	:hi SpellLocal ctermfg=black
	:hi SpellRare ctermfg=black
	:hi SpellCap ctermfg=black
endfunction

" LaTeX specific
au BufRead,BufNewFile *.tex :call Au_latex()

"folding
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml normal zR
let g:xml_syntax_folding=1

"Preserves clipboard upon exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Allows wrapping a word in ",',``
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q`` ciw````<Esc><Left>P
nnoremap <Leader>q* ciw**<Esc>P

" Easier searching
nmap <Space> /
map <silent> <leader><cr> :noh<cr>

"Move between Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Full file search and replace
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Full file select
nnoremap <C-a> ggVG

" quick <ESC>
imap jk <ESC>
set backspace=indent,eol,start "Allows normal backspace behavior
set breakindent "line wrap starts at indent level, not 0
set number
set hlsearch
set smartcase
set tabstop=4
syntax on

"let &colorcolumn=join(range(81,999),",") " line length warning
:2mat ErrorMsg '\%81c.' "Highlights column 81 for style guides

let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

let g:closetag_filenames = "*.html,*.xhtml,*.xml"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Quick switch wrapping
map <leader>w :set wrap! <CR>

"silver searcher coloring
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
	\ = '--synctex-forward=@line:0:@tex @pdf'
let g:vimtex_view_general_options_latexmk = ''

let g:vimtex_quickfix_open_on_warning = 0

let g:tex_flavor = 'latex'
if !exists('g:ycm_semantic_triggers')
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

"allowing mousepad scrolling without going back into the buffer
set mouse=a

let g:tex_conceal=""
