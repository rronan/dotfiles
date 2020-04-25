set tabstop=4       " The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
syntax on

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'sjl/badwolf'
Plug 'roxma/nvim-completion-manager'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'python/black'
Plug 'tpope/vim-commentary'
Plug 'fisadev/vim-isort'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'romainl/vim-cool'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'
Plug 'chaoren/vim-wordmotion'
Plug 'jlanzarotta/bufexplorer'
" Plug 'srstevenson/vim-picker'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'simnalamburt/vim-mundo'
Plug 'christoomey/vim-conflicted'
call plug#end()


" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright


" python folding
let g:SimpylFold_docstring_preview = 1
let g:python_highlight_operators = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1


" Run linter on write
autocmd! BufWritePost * Neomake

let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'W503,E203',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }
let g:neomake_python_enabled_makers = ['pyflakes']

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
nnoremap oimtis ofrom pyronan.pyronan.utils.image import tis, ti<Esc>
inoremap pdb __import__("pdb").set_trace()
inoremap imtis from pyronan.utils.image import tis, ti


nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
" homerours
let mapleader = ' ' 

nnoremap Q q
nnoremap q 11k<cr>
nnoremap m 9j<cr>
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
nnoremap <leader>p :tabn<cr>
nnoremap <leader>o :tabp<cr>
nnoremap <S-H> gT
nnoremap <S-L> gt

" Open, source .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>tt <C-W>T

function! Print()
  :hardcopy > /tmp/vim_print.ps
  !ps2pdf /tmp/vim_print.ps
  !lp -d MFP_C-pro /tmp/vim_print.ps
endfunction

set hlsearch
hi Search ctermbg=LightBlue
hi Search ctermfg=Red

function! s:Template(file)
  execute ':0r /sequoia/data1/rriochet/dotfiles/config/nvim/templates/' . a:file
endfunction
command! -nargs=1 Template call s:Template(<f-args>)

function! Ind2()
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction
command! Ind2 call Ind2()

function! Ind4()
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endfunction
command! Ind4 call Ind4()

autocmd BufWritePre *.py execute ':Isort'
autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.py execute ':Semshi highlight'

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

nmap " :NERDTreeToggle<CR>

" jedi
let g:jedi#show_call_signatures = "1"
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = "<leader>gk"
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


set colorcolumn=89

nmap <silent> <leader>rr :Semshi rename<CR>
nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>
nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>
nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>
let g:semshi#mark_selected_nodes = 2
hi semshiSelected        ctermfg=1 ctermbg=7

nmap <C-n> :GitNextConflict<CR>

let g:hardtime_default_on = 1
let g:hardtime_showmsg = 0
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_maxcount = 5
let g:hardtime_allow_different_key = 1

set linebreak
set wildmenu
set autoread
set hidden
set smartcase
set wildignore+=.pyc,.swp
set history=1000
set undolevels=1000
set nobackup
set noswapfile

cmap w!! w !sudo tee % >/dev/null

function! s:Pyronan()
  execute ':vsp /sequoia/data1/rrriochet/pyronan/pyronan'
endfunction
command! Pyronan call s:Pyronan()


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
