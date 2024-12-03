set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
syntax on

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'romainl/vim-cool'
Plug 'chaoren/vim-wordmotion'
Plug 'jlanzarotta/bufexplorer'
Plug 'ervandew/supertab'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'ntpeters/vim-better-whitespace'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'sindrets/winshift.nvim'
Plug 'ekalinin/Dockerfile.vim'
call plug#end()


" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
" Enable autocompletion:
set wildmenu
set wildmode=longest,list,full
set wildignorecase
set wildignore=*.git/*,*.tags,tags,*.o,*.class,.pyc,.swp
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" split navigations
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

inoremap <C-J> <Esc><C-W>j
inoremap <C-K> <Esc><C-W>k
inoremap <C-L> <Esc><C-W>l
inoremap <C-H> <Esc><C-W>h

tnoremap <C-J> <C-\><C-n><C-W>j
tnoremap <C-K> <C-\><C-n><C-W>k
tnoremap <C-L> <C-\><C-n><C-W>l
tnoremap <C-H> <C-\><C-n><C-W>h


nnoremap <M-Q> <Nop>
inoremap <C-Z> <Esc><C-Z>
inoremap jk <C-\><C-n>
inoremap JK <C-\><C-n>
tnoremap jk <C-\><C-n>
tnoremap JK <C-\><C-n>
tnoremap <C-D> <Nop>
tnoremap <Esc> <C-\><C-n>

nnoremap pdb O__import__("pdb").set_trace()<Esc>
inoremap pdb __import__("pdb").set_trace()

nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
" homerours
let mapleader = ' '
let maplocalleader = ' '

nnoremap Q q
" Yank to the end of the line (homerours)
nnoremap Y y$

" Copy to system clipboard (homerours)
vnoremap <leader>y "+y

" Save
nnoremap <leader>w :w<cr>
nnoremap <leader>W :noautocmd w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>x :x<cr>

" Folds
nnoremap <backspace> za
vnoremap <backspace> zf

" Tabs
nnoremap <leader>tb :tabnew<cr>
nnoremap <S-H> gT
nnoremap <S-L> gt

" Open, source .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>tt <C-W>T

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

nmap " :NERDTreeToggle<CR>

set colorcolumn=89

set linebreak
set autoread
set hidden
set smartcase
set history=1000
set undolevels=1000
set nobackup
set noswapfile

cmap w!! w !sudo tee % >/dev/null

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'a"'  :0,
      \ 'i''' :0,
      \ 'a''' :0,
      \ 'i]'  :0,
      \ 'ib'  :0,
      \ 'ab'  :0,
      \ 'iB'  :0,
      \ 'aB'  :0,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

map <leader>k <Plug>(expand_region_expand)
map <leader>j <Plug>(expand_region_shrink)

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | end


" better navigation of command history
" allow next completion after / alternative
" is <C-E> if <C-D> makes to long of a list
if has('nvim-0.5.0')
	cnoremap <expr> / wildmenumode() ? "\<C-Y>" : "/"
else
	cnoremap <expr> / wildmenumode() ? "\<C-E>" : "/"
endif

" Start Win-Move mode:
nnoremap <leader>we <Cmd>WinShift<CR>

let g:shfmt_extra_args = '-i 4'
let g:shfmt_fmt_on_save = 1
