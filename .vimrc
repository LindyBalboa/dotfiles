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
" FastFold {{{
Plug 'Konfekt/FastFold'
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af' " 'af' = augroups and functions
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
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

function! LLline()
  let g:limelight_bop = "^"	
  let g:limelight_eop = "$"	
endfunction
command LLLine :call LLline()
function! LLpar()
  let g:limelight_bop = '^\s'
  let g:limelight_eop = '\ze\n^\s'
endfunction
command LLpar :call LLpar()
"}}}
" Markdown {{{
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['bash=sh', 'python=python']
Plug 'nelstrom/vim-markdown-folding'

"}}}
" SimpylFold {{{
"Plug 'tmhedberg/SimpylFold'

"set foldtext=MyFoldText()
"function MyFoldText()
"  let line = getline(v:foldstart)
"  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g') "}}}
"  return sub
"endfunction
"}}}

" Stay{{{
" Added this because synctex reverse search from zathura
" caused a buffer update which triggered fold calculation
" But it broke folding on some files and seems to no longer be needed
"Plug 'kopischke/vim-stay'
"set viewoptions=cursor,folds,slash,unix
"}}}
"
" Syntastic {{{
"Plug 'vim-syntastic/syntastic'
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_flake8_args="--ignore=E501,E226"
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" }}}
" Ale {{{
Plug 'w0rp/ale'
let g:ale_enabled = 0
let g:ale_python_flake8_options = '--ignore=E501,E226'
" }}}
" Ultisnips {{{
Plug 'SirVer/ultisnips'
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

let g:UltiSnipsExpandTrigger= "<nop>"
let g:ulti_expand_or_jump_res = 0

function! <SID>ExpandSnippetOrReturn()
  if pumvisible() && has_key(v:completed_item, 'menu') && v:completed_item.menu =~# '^<snip>'
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    endif
  endif
  return "\<CR>"
endfunction

"inoremap <silent> <CR> <C-R>=<SID>ExpandSnippetOrReturn()<CR>
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "<CR>"
" }}}
" Vimtex {{{
Plug 'lervag/vimtex'

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_general_options
	"\ = '--synctex-forward=@line:0:@tex @pdf'
let g:vimtex_view_general_options_latexmk = ''
"let g:vimtex_latexmk_options="-pdf -pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'"
let g:vimtex_view_automatic=1
"let g:vimtex_compiler_method='arara'
"let g:vimtex_compiler_arara = {
"	\ 'backend' : 'jobs',
"	\ 'background' : 1,
"	\ 'options' : ['-v'],
"	\}

let g:vimtex_quickfix_open_on_warning = 0

let g:tex_flavor = 'latex'

let g:vimtex_fold_enabled = 1
"let g:vimtex_fold_manual = 1 " Stops autoupdates of folds. Handled by FastFold. This is necessary for speed.
let g:vimtex_fold_types = {
\    'envs' : {
\       'whitelist' : ['figure','table'],
\       'blacklist' : [],
\    },
\    'sections' : {
\      'sections' : [
\	     'part',
\        'chapter',
\        'section',
\        'subsection',
\        'subsubsection',
\        'paragraph',
\      ],
\      'parts' : [ 
\        'appendix',
\        'frontmatter',
\        'mainmatter',
\        'backmatter',
\      ],
\    },
\}

let g:vimtex_complete_close_braces = 1
let g:vimtex_complete_recursive_bib = 1
" }}}
" YouCompleteMe {{{
Plug 'Valloric/YouCompleteMe'

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_invoke_completion = "<Nul>"

" Ugly autocommand needed because g:vimtex#re#youcompleteme not imported till
" after plug#end
au VimEnter *.tex 
	\ if !exists('g:ycm_semantic_triggers')
	\ |  let g:ycm_semantic_triggers = {}
    \ |endif
    \ |let g:ycm_semantic_triggers.tex = ['{'] " g:vimtex#re#youcompleteme


" }}}

Plug 'vim-scripts/AfterColors.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'ivyl/vim-bling' "Cursor blink on jump
"Plug 'julienr/vim-cellmode'
Plug 'mantiz/vim-plugin-dirsettings'
Plug 'romainl/flattened'
Plug 'kopischke/fish.vim'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways'
Plug 'sickill/vim-monokai'
Plug 'vim-python/python-syntax'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'godlygeek/tabular'
Plug 'szymonmaszke/vimpyter' 
Plug 'vim-scripts/XML-Folding'
Plug 'vim-scripts/ZoomWin'
let g:python_highlight_all = 1

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
Plug 'rainux/vim-desert-warm-256'

call plug#end()

"}}}

source $VIMRUNTIME/macros/matchit.vim
call dirsettings#Install()

" Return cursor to last position when opening a file {{{
if has("autocmd")
  au BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") 
\ | exe "normal! g'\"" 
\ | endif
endif
"}}}

autocmd BufEnter * nested colorscheme elflord

"folding
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml normal zR
"let g:xml_syntax_folding=1

highlight Folded ctermbg=black

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

" Treat wrapped lines as normal lines when moving EXCEPT when prefixed with a number
nnoremap <expr> j v:count ? 'j' : 'gj' 
nnoremap <expr> k v:count ? 'k' : 'gk'

inoremap <C-a> <Home>
inoremap <C-E> <End>

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

" Sensible clipboard copy paste mappings
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Quick switch wrapping
map <leader>w :set wrap! <CR>

"silver searcher coloring
let g:ackprg = 'ag --nogroup --nocolor --column'


"allowing mousepad scrolling without going back into the buffer
set mouse=a

set hidden

" switch mark jumping behavior
nnoremap ' `
nnoremap ` '

" Maintain cursor position when jumping pages
set nostartofline

" netrw seetings
"let g:netrw_liststyle=2

"Persistant Undo
set undofile
set undodir=~/.vim/undodir

set ignorecase
set smartcase
set incsearch
"let g:UltiSnipsExpandTrigger="<C-g>"
"let g:UltiSnipsJumpForwardTrigger="<C-m>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Left>"

" Set indentkeys option again on changed filetype option.
" This fixes TeX \item indentation in combination with YouCompleteMe.
" See https://github.com/Valloric/YouCompleteMe/issues/1244
" You may add more filetypes if necessary.
if exists("g:loaded_fix_indentkeys")
    finish
endif
let g:loaded_fix_indentkeys = 1
autocmd FileType tex,plaintex execute "setlocal indentkeys=" . &indentkeys

filetype plugin indent on

" Function to print item highlight groups
nmap <leader>hg :call SynGroup()<CR>
function! SynGroup()                 
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" more sensible command completion
set wildmode=longest:full,full
set wildmenu

" vim:foldmethod=marker:foldlevel=0
