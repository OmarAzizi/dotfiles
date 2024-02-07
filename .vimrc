left.
set encoding=utf-8
set number
syntax on
set nocompatible
filetype off
set relativenumber
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=10
set laststatus=2
set showmode
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
let mapleader = "\<Space>"

call plug#begin()
"NerdTree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdtree'
"auto-pairs
Plug 'jiangmiao/auto-pairs'

Plug 'shmup/vim-sql-syntax'

Plug 'morhetz/gruvbox'

"airline
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

colorscheme sorbet

"NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

"VimAirlines
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Use <Tab> to switch to the next buffer
nnoremap <Tab> :bnext<CR>

" Use <Shift-Tab> to switch to the previous buffer
nnoremap <S-Tab> :bprev<CR>

" Use <Space-x> to close the current buffer
nnoremap <Space>x :bd<CR>

" Map Ctrl-H to switch to the left window
nnoremap <C-h> <C-w>h

" Map Ctrl-L to switch to the right window
nnoremap <C-l> <C-w>l

nnoremap <leader>f :FZF<CR>
nnoremap <leader>h :terminal<CR>
nnoremap <leader>v :vert terminal<CR>

let g:python_highlight_all = 1

let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors	= 0
