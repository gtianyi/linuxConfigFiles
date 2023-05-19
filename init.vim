" change the leader key from "\" to ";"
let mapleader=";"
"change the local leader key from "\" to ";"
let maplocalleader=";"

"UI config
set number
set nobackup
set noswapfile

"separator word with _
"set iskeyword-=_

" all plugin listed here would be installed automatically
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'tpope/vim-abolish' "subtitute preserve case
Plug 'scrooloose/nerdcommenter' 
Plug 'mattn/emmet-vim' 
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'junegunn/fzf', 
Plug 'junegunn/fzf.vim'
Plug 'Chiel92/vim-autoformat' 
Plug 'vim-airline/vim-airline' 
Plug 'vim-scripts/DoxygenToolkit.vim' 
call plug#end()            

"indicate nvim python engine 
"let g:python3_host_prog = '$HOME/miniconda3/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" repgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
" use the current working directory (cwd) for ripgrep
let g:rg_derive_root='true'

" keymap for ripgrep and fzf
" start ripgrep
nnoremap \ :Rg<CR>
" start ripgrep with the work under current cursor
nnoremap <Leader>rg :Rg <C-R><C-W><CR>
" start fzf
nnoremap <C-T> :Files<cr>
" start fzf to serch for buffers
nnoremap <Leader>b :Buffers<cr>
" start fzf to serch for text in the current file
nnoremap <Leader>s :BLines<cr>
" start fzf to serch for the word under current cursor in the current file 
nnoremap <Leader>sc :BLines <C-R><C-W><cr>

"fzf layout
let g:fzf_layout = { 'down': '~90%' }

"search setting
set incsearch 
set nohlsearch
set ignorecase
set smartcase

" color
syntax enable
colorscheme nova
"colorscheme onehalflight

" Using Autoformat for c++, cmakelist, python, json and shell scipt 
map <leader>f :Autoformat<CR>
let g:formatdef_buildifier="'buildifier'"
"let g:autoformat_verbosemode=1

"tab space
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent 

"folding
set foldenable
set foldlevelstart=10  " default folding level when buffer is opened
set foldnestmax=10     " maximum nested fold
set foldmethod=syntax  " fold based on indentation

"copy to clipboard
set clipboard+=unnamedplus

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" enable spell check on html
autocmd FileType html setlocal spell
autocmd FileType html setlocal textwidth=74

" Doxygen
let g:DoxygenToolkit_briefTag_pre="@brief One sentence summary of the function.  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_commentType="C++"
let g:DoxygenToolkit_compactDoc="yes"
let g:DoxygenToolkit_authorName="Tianyi Gu"
let g:DoxygenToolkit_licenseTag="My own license"
map <Leader>dg :Dox<CR>

source $HOME/.config/nvim/coc.vim
