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
Plug 'VundleVim/Vundle.vim'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
"Plug 'roxma/vim-tmux-clipboard'
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
call plug#end()            

" don't ask for ycm confirmation
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list=1
let g:ycm_filetype_blacklist = { 'tex': 1 ,'html' : 1}
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>n :lnext<CR>
nnoremap <leader>b :lprevious<CR>
" other ycm settings which are used for test
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"search setting
set incsearch 
set nohlsearch
set ignorecase
set smartcase

" color
syntax enable
"set termguicolors
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"colorscheme solarized
colorscheme nova

" Add hook for clang-format
" have to sudo apt install clang-format before use
map <leader>f :py3f ~/.config/nvim/plugged/clang-format.py<cr>
imap <leader>f <c-o>:py3f ~/.config/nvim/plugged/clang-format.py<cr>

" Add hook for python formatter
autocmd FileType python map <leader>f :Neoformat<cr>

" Add python code checker config
let g:neomake_python_enabled_makers = ['pylint']
autocmd FileType python call neomake#configure#automake('nrwi', 500)

" Add hook for clang-rename 
map <leader>r :pyf ~/.config/nvim/plugged/clang-rename.py<cr>

" Add hook for ycm 
nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>x :YcmCompleter FixIt<CR>

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Snips trigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<Right>"
let g:UltiSnipsJumpBackwardTrigger="<Left>"

"tab space
set tabstop=4

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
