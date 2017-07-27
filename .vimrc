set shell=/bin/bash

" Plugins {{{
call plug#begin('~/.vim/bundle')

" Airline: buffer tabline {{{
Plug 'vim-airline/vim-airline'
" Airline
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#fnamemod     = ':t'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}
" EasyAlign {{{
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
" }}}
" FZF {{{
Plug 'junegunn/fzf.vim'
nnoremap <leader>\ :FZF<CR>
" }}}
" Goyo: Center text {{{
Plug 'junegunn/goyo.vim'

let g:goyo_linenr=1
nnoremap <leader>gg :Goyo<CR>
"}}}
" limelight: focus on current paragraph {{{
Plug 'junegunn/limelight.vim'

nnoremap <leader>gl :Limelight!!<CR>
let g:limelight_conceal_ctermfg = 000
"}}}
" Vimtex {{{
Plug 'lervag/vimtex'

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
	\ = '--synctex-forward=@line:0:@tex @pdf'
let g:vimtex_view_general_options_latexmk = ''
let g:vimtex_latexmk_options="-pdf -pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'"

let g:vimtex_quickfix_open_on_warning = 0

let g:tex_flavor = 'latex'

let g:vimtex_fold_enabled = 1

let g:vimtex_complete_close_braces = 1
let g:vimtex_complete_recursive_bib = 1
" }}}
" YouCompleteMe {{{
Plug 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

" Ugly autocommand needed because g:vimtex#re#youcompleteme not imported till
" after plug#end
au VimEnter *.tex 
	\ if !exists('g:ycm_semantic_triggers')
	\ |  let g:ycm_semantic_triggers = {}
    \ |endif
    \ |let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme


" }}}


Plug 'jiangmiao/auto-pairs'
Plug 'ivyl/vim-bling' "Cursor blink on jump
Plug 'julienr/vim-cellmode'
Plug 'kopischke/fish.vim'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'ivanov/vim-ipython'
Plug 'Valloric/MatchTagAlways'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/ZoomWin'

call plug#end()

"}}}

source $VIMRUNTIME/macros/matchit.vim

" Python specific {{{
function! Au_python()
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent
	
	"let &colorcolumn=join(range(81,999),",") " line length warning
	:2mat ErrorMsg '\%81c.' "Highlights column 81 for style guides
endfunction

au BufRead,BufNewFile *.py :call Au_python()  " load settings
au BufWritePre,FileWritePre *.py :%s/\s\+$//g " Delete trailing whitespace
" }}}
" Return cursor to last position when opening a file {{{
if has("autocmd")
  au BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") 
\ | exe "normal! g'\"" 
\ | endif
endif
"}}}
" LaTeX specific{{{
function! Au_latex()
    imap .<Space> .<CR>
	imap ?<Space> ?<CR>
	imap !<Space> !<CR>

	:2mat none

	:set spell spelllang=en_us
	" use 2zg and 2zw to add to dictionary only for local directory
	:setlocal spellfile+=~/.vim/spell/en.utf-8.add
	:setlocal spellfile+=localspell.utf-8.add
	:hi SpellBad ctermfg=black
	:hi SpellLocal ctermfg=black
	:hi SpellRare ctermfg=black
	:hi SpellCap ctermfg=black

	noremap \& :Tabularize /&<CR>
	inoremap <silent> & &<Esc>:call <SID>align()<CR>a
    function! s:align()
	  echom "its a start"
      let p = '^.*&.*&$'
      if exists(':Tabularize') && getline('.') =~# '^.*&' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^&]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*&\s*\zs.*'))
        Tabularize/&/l1
        normal! 0
        call search(repeat('[^&]*&',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
      endif
    endfunction
endfunction

au BufRead,BufNewFile *.tex :call Au_latex()

" General vim syntax option
let g:tex_conceal=""

"}}}

colorscheme elflord

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

" Move between buffers
nnoremap <leader>a :bp<CR>
nnoremap <leader>s :bn<CR>

" Full file select
nnoremap <C-a> ggVG

" quick <ESC>
imap jk <ESC>
" Treat wrapped lines as normal lines when moving
nmap j gj
nmap k gk

" Full file search and replace
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


set backspace=indent,eol,start "Allows normal backspace behavior
set breakindent "line wrap starts at indent level, not 0
set number
set relativenumber
set hlsearch
set smartcase
set tabstop=4
syntax on



let g:closetag_filenames = "*.html,*.xhtml,*.xml"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Quick switch wrapping
map <leader>w :set wrap! <CR>

"silver searcher coloring
let g:ackprg = 'ag --nogroup --nocolor --column'


"allowing mousepad scrolling without going back into the buffer
set mouse=a

set hidden


"Persistant Undo
set undofile
set undodir=~/.vim/undodir

set ignorecase
set smartcase
set incsearch
"let g:UltiSnipsExpandTrigger="<C-g>"
"let g:UltiSnipsJumpForwardTrigger="<C-m>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Left>"


" vim: set foldmethod=marker fmr={{{,}}} foldlevel=0 :
