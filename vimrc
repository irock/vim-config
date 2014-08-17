"============================================================================
" vim config
"============================================================================
"
" This vim configuration uses vundle (https://github.com/gmarik/vundle) for
" managing plugins.
"
"============================================================================

" clear autocommands
autocmd!

"=== vundle =================================================================

set nocompatible                " drop vi compatibility
filetype off                    " required for vundle

set rtp+=~/.vim/bundle/vundle/  " add vundle search path
call vundle#rc()

"=== general ================================================================

syntax on                       " syntax highlighting on.
filetype plugin on              " turn on filetype plugin
filetype plugin indent on       " required for vundle
set modeline                    " file specific options
set history=1000                " history size
set mouse=a                     " mouse gestures
set encoding=utf-8              " set internal encoding
set scrolloff=4                 " scroll offset
set visualbell                  " use visual bell
set vb t_vb=                    " disable both audible and visible bell
set background=dark
set switchbuf+=split

"=== plugins ================================================================

" vundle plugin management
Bundle 'gmarik/vundle'

" molokai theme
Bundle 'mrtazz/molokai.vim'

" solarized theme
Bundle 'altercation/vim-colors-solarized'

" summerfruit256 theme
Bundle 'vim-scripts/summerfruit256.vim'

" nerdtree
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" powerline
Bundle 'Lokaltog/vim-powerline'

" pastie
Bundle 'tpope/vim-pastie'

" mustang theme
Bundle 'cschlueter/vim-mustang'

" tComment
Bundle 'tComment'

" matchit
Bundle 'matchit.zip'

" indent guides
Bundle 'nathanaelkane/vim-indent-guides'

if 0 && v:version >= 703
" A fuzzy code completion engine
Bundle 'Valloric/YouCompleteMe'
endif

" supertab
Bundle 'ervandew/supertab'

" AutoComplPop
Bundle 'AutoComplPop'

if 0
" latex box
Bundle 'LaTeX-Box-Team/LaTeX-Box'
endif

" fugitive
Bundle 'tpope/vim-fugitive'

" detect indent
Bundle 'irock/detectindent'

" hilight trailing whitespace
Bundle 'bronson/vim-trailing-whitespace'

" file-line
Bundle 'file-line'

" visual-star
Bundle 'thinca/vim-visualstar'

" markdown
Bundle 'hallison/vim-markdown'

" date incrementing
Bundle 'tpope/vim-speeddating'

" tagbar
Bundle 'majutsushi/tagbar'

" gitv
Bundle 'gregsexton/gitv'

" wiki for vim
Bundle 'vimwiki'

" Git gutter
Bundle 'airblade/vim-gitgutter'

if 0
" Indexed search
Bundle 'IndexedSearch'
endif

" Ctrl-P
Bundle 'kien/ctrlp.vim'

" A.vim (switch between header and source file easily)
Bundle 'a.vim'

"==== plugin configuration ==================================================

"===== indent guides ========================================================

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"===== detectindent =========================================================

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:detectindent_max_lines_to_analyse = 4096
let g:detectindent_min_indent = 2

" detect indentation by default
autocmd BufRead * :DetectIndent

"===== vimroom ==============================================================

" use full height for text
let g:vimroom_sidebar_height = 0

"===== tagbar ===============================================================

let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_indent = 1

"===== vimwiki ==============================================================

let work_wiki = {}
let work_wiki.path = '~/docs/wiki/work'

let personal_wiki = {}
let personal_wiki.path = '~/docs/wiki/personal'

let g:vimwiki_list = [work_wiki, personal_wiki]

"===== YouCompleteMe ========================================================

"let g:ycm_filetype_specific_completion_to_disable = { 'cpp': 1, }

"==== gitgutter =============================================================

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1

"==== eclim =================================================================

let g:EclimCompletionMethod = 'omnifunc'

let g:acp_behaviorJavaEclimLength = 3
function MeetsForJavaEclim(context)
    return g:acp_behaviorJavaEclimLength >= 0 &&
            \ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
  endfunction
  let g:acp_behavior = {
      \ 'java': [{
        \ 'command': "\<c-x>\<c-u>",
        \ 'completefunc' : 'eclim#java#complete#CodeComplete',
        \ 'meets'        : 'MeetsForJavaEclim',
      \ }]
    \ }

"=== appearance =============================================================

let s:colorschemes = ['molokai', 'hemisu', 'summerfruit256', 'solarized']
let s:colorschemes_idx = 0

function! s:LoadColorscheme()
    execute 'colorscheme '.s:colorschemes[s:colorschemes_idx]
endfunction

function! s:ShiftColorscheme()
    let s:colorschemes_idx = (s:colorschemes_idx + 1) % len(s:colorschemes)
    call s:LoadColorscheme()
endfunction

set showmatch                   " jump to matching bracket and back when inserted
set matchtime=3                 " time for showmatch
set wildmenu                    " command line completion
set ruler                       " show the ruler
set laststatus=2                " always show status line.
set showcmd                     " show command in last line
set nocursorline                " don't hilight the current line (faster)
set number                      " use absolute line numbers
set wrap                        " wrap long lines
set splitright                  " open new vsplit windows to the right

" close popup menu automatically
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent!
    \ pclose|endif

let g:solarized_termcolors=256  " use 256 colors for solarized colorscheme

"=== indentation ============================================================

set autoindent                  " copy indentation from current line to new line
set cindent                     " follow C indenting rules
set tabstop=2                   " number of spaces that a tab is replaced with
set shiftwidth=2                " number of spaces to use with autoindent
set softtabstop=2               " number of spaces that a <Tab> counts for while
                                " performing editing operations
set smarttab                    " replace tabs at start of line with spaces.
set expandtab                   " use spaces instead of hard '\t' tabs

set cinkeys-=0#                 " don't reset indentation when inserting a #

"=== searching ==============================================================

set hlsearch                    " highlighting of search terms.
set incsearch                   " go to first match when typing
set ignorecase                  " case insensitive search
set smartcase                   " if search contains mixed case, do a case sensitive
                                " search
set gdefault                    " use /g by default when doing replaces.

"=== code completion ========================================================

set completeopt=longest,menuone

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o>"
imap <C-@> <C-Space>

"=== mappings ===============================================================

let     mapleader=","           " use <comma> as leader
let     maplocalleader=";"      " use <semicolon> as local leader

imap    <C-l>       <ESC>

map     <leader>tt  :tabnew<cr>
map     <leader>n   :tabnext<cr>
map     <leader>b   :tabprevious<cr>
map     <leader>tw  :tabclose<cr>
map     <leader>e   :NERDTreeTabsToggle<cr>
map     <leader>tb  :TagbarToggle<cr>
map     <leader>c   :TComment
map     <leader>p   :r! cat<cr>

" Make with quickfix
command! -nargs=* Make make <args> | cwindow 3
map     <leader>m   :Make<cr><cr><cr>

command! ShiftColorscheme call s:ShiftColorscheme()
command! LoadColorscheme call s:LoadColorscheme()

map     <C-h>       <C-w>h
map     <C-j>       <C-w>j
map     <C-k>       <C-w>k
map     <C-l>       <C-w>l

map     <Esc>1       :tabnext 1<cr>
map     <Esc>2       :tabnext 2<cr>
map     <Esc>3       :tabnext 3<cr>
map     <Esc>4       :tabnext 4<cr>
map     <Esc>5       :tabnext 5<cr>
map     <Esc>6       :tabnext 6<cr>
map     <Esc>7       :tabnext 7<cr>
map     <Esc>8       :tabnext 8<cr>
map     <Esc>9       :tabnext 9<cr>
map     <Esc>0       :tabnext 10<cr>

nnoremap <leader><space> :noh<cr>
nnoremap <leader>jd :JavaSearchContext<cr>
nnoremap <leader>jh :JavaDocSearch<cr>
nnoremap <leader>ji :JavaImport<cr>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
inoremap jj <ESC>
nnoremap <leader>c :TComment<cr>
vnoremap <leader>c :TComment<cr>

"=== filetypes ==============================================================

autocmd BufRead,BufNewFile *.asm set ft=nasm
autocmd BufRead,BufNewFile *.tex set ft=tex

"=== hilighting =============================================================

function! s:InitColors()
  augroup InitColors
  au!
  hi IndentGuidesOdd  guibg=none ctermbg=235
  hi IndentGuidesEven guibg=none ctermbg=236
  hi Normal ctermbg=234
  hi Pmenu ctermbg=237 ctermfg=254
  hi PmenuSel ctermbg=214 ctermfg=234

  hi SpellBad ctermbg=none ctermfg=red " incorrect spelling
  hi CursorLine cterm=none term=none gui=none
  autocmd VimEnter * :hi ExtraWhitespace ctermbg=238 guibg=#382424
  augroup END
endfunction

autocmd ColorScheme * :call s:InitColors()

" Load colorscheme last, to be sure all hooks have been initialized
call s:LoadColorscheme()

"=== utilities ==============================================================

"==== create dirs on save ===================================================

function WriteCreatingDirs()
  execute ':silent !mkdir -p %:h'
  write
endfunction

command W call WriteCreatingDirs()
