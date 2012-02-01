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
filetype plugin indent on       " required for vundle
set modeline                    " file specific options
set history=1000                " history size
set mouse=a                     " mouse gestures
set encoding=utf-8              " set internal encoding
set scrolloff=4                 " scroll offset
set visualbell                  " use visual bell
set vb t_vb=                    " disable both audible and visible bell

"=== plugins ================================================================

" vundle plugin management
Bundle 'gmarik/vundle'

" molokai theme
Bundle 'mrtazz/molokai.vim'

" nerdtree
Bundle 'scrooloose/nerdtree'

" powerline
Bundle 'Lokaltog/vim-powerline'

" pastie
Bundle 'tpope/vim-pastie'

" search complete
Bundle 'SearchComplete'

" clang
Bundle 'Rip-Rip/clang_complete'

" mustang theme
Bundle 'cschlueter/vim-mustang'

" tComment
Bundle 'tComment'

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
imap    <C-l>       <ESC>

map     <leader>t   :tabnew<CR>
map     <leader>n   :tabnext<CR>
map     <leader>b   :tabprevious<CR>
map     <leader>w   :tabclose<CR>
map     <C-T>       :tabnext<CR>
map     <C-B>       :tabprevious<CR>

map     <leader>m   :Make<CR><CR><CR>

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
