"============================================================================
" vim config
"============================================================================
"
" This vim configuration uses vundle (https://github.com/gmarik/vundle) for
" managing plugins.
"
"============================================================================

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
set t_Co=256                    " force 256 colors

"=== plugins ================================================================

" vundle plugin management
Bundle 'gmarik/vundle'

" molokai theme
Bundle 'mrtazz/molokai.vim'

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

" supertab
Bundle 'ervandew/supertab'

" latex box
Bundle 'LaTeX-Box-Team/LaTeX-Box'

"==== plugin configuration ==================================================

"===== indent guides ========================================================

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234

"===== supertab =============================================================

" the default values seem to be reversed (?)
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

"=== appearance =============================================================

colorscheme molokai             " The colorscheme to use

set showmatch                   " jump to matching bracket and back when inserted
set matchtime=3                 " time for showmatch
set wildmenu                    " command line completion
set ruler                       " show the ruler
set laststatus=2                " always show status line.
set showcmd                     " show command in last line
set cursorline                  " hilight the current line
set number                      " use absolute line numbers
set wrap                        " wrap long lines

" close popup menu automatically
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent!
    \ pclose|endif


"=== indentation ============================================================

set autoindent                  " copy indentation from current line to new line
set smartindent                 " indent new line after e.g. {
set tabstop=4                   " number of spaces that a tab is replaced with
set shiftwidth=4                " number of spaces to use with autoindent
set softtabstop=4               " number of spaces that a <Tab> counts for while
                                " performing editing operations
set smarttab                    " replace tabs at start of line with spaces.
set expandtab                   " use spaces instead of hard '\t' tabs

"=== searching ==============================================================

set hlsearch                    " highlighting of search terms.
set incsearch                   " go to first match when typing
set ignorecase                  " case insensitive search
set smartcase                   " if search contains mixed case, do a case sensitive
                                " search
set gdefault                    " use /g by default when doing replaces.

"=== mappings ===============================================================

let     mapleader=","           " use <comma> as leader
let     maplocalleader=";"      " use <semicolon> as local leader

imap    <C-l>       <ESC>

map     <leader>t   :tabnew<CR>
map     <leader>n   :tabnext<CR>
map     <leader>b   :tabprevious<CR>
map     <leader>w   :tabclose<CR>
map     <leader>m   :Make<CR><CR><CR>
map     <leader>e   :NERDTreeTabsToggle<CR>

map     <C-h>       <C-w>h
map     <C-j>       <C-w>j
map     <C-k>       <C-w>k
map     <C-l>       <C-w>l

map     <Esc>1       :tabnext 1<CR>
map     <Esc>2       :tabnext 2<CR>
map     <Esc>3       :tabnext 3<CR>
map     <Esc>4       :tabnext 4<CR>
map     <Esc>5       :tabnext 5<CR>
map     <Esc>6       :tabnext 6<CR>
map     <Esc>7       :tabnext 7<CR>
map     <Esc>8       :tabnext 8<CR>
map     <Esc>9       :tabnext 9<CR>
map     <Esc>0       :tabnext 10<CR>

nnoremap <leader><space> :noh<cr>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
inoremap jj <ESC>

"=== filetypes ==============================================================

autocmd BufRead,BufNewFile *.asm set ft=nasm
autocmd BufRead,BufNewFile *.tex set ft=tex

"=== hilighting =============================================================

hi SpellBad ctermbg=none ctermfg=red " incorrect spelling
hi CursorLine cterm=none term=none gui=none
