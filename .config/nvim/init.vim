if has('win32') || has('win64')
  let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
  let g:plugged_home = '~/.vim/plugged'
endif
" Plugins List
call plug#begin(g:plugged_home)
    " UI related
    Plug 'chriskempson/base16-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " C/C++ Highlighting
    Plug 'octol/vim-cpp-enhanced-highlight'
    " C/C++ Easy jump between .c and .h
    Plug 'vim-scripts/a.vim'
    " Better Visual Guide
    Plug 'Yggdroot/indentLine'
    " syntax check
    Plug 'w0rp/ale'
    " Autocomplete
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    " Formater
    Plug 'Chiel92/vim-autoformat'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    "Fuzzy Finder (file searcher)
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    " Ultimate Hyper Git Setup
    Plug 'tpope/vim-fugitive'
    " Git gutter to show changes to file
    Plug 'airblade/vim-gitgutter'
    " latex
    Plug 'lervag/vimtex'
    " python
    Plug 'vim-syntastic/syntastic'
call plug#end()
filetype plugin indent on


" Configurations Part
" UI configuration
syntax on
syntax enable
" colorscheme
let base16colorspace=256
"colorscheme base16-gruvbox-dark-hard
"set background=dark
" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
"line number
set number
"line relative numbers to line
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" Turn off backup
set nobackup
set noswapfile
set nowritebackup
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set ruler


set incsearch "incremental search
set hlsearch "highlight search
"set cursorline
" vim-autoformat



noremap <F3> :Autoformat<CR>
" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  "autocmd Filetype tex call ncm2#register_source({
  "          \ 'name': 'vimtex',
  "          \ 'priority': 8,
  "          \ 'scope': ['tex'],
  "          \ 'mark': 'tex',
  "          \ 'word_pattern': '\w+',
  "          \ 'complete_pattern': g:vimtex#re#ncm2,
  "          \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "          \ })
augroup END
"
" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
"
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" A - switching between files 
" header / source
nnoremap <F4> :A<CR>
inoremap <F4> <ESC>:A<CR>a
" file under cursor
nnoremap <F2> :IH<CR>
inoremap <F2> <ESC>:IH<CR>

" set latex files to line length of 80
au BufRead,BufNewFile *.tex call LatexInit()
function LatexInit()
    setlocal textwidth=80
    setlocal spell spelllang=en_us
endfunction

" alias F to Files for fzf
cabb F Files


" Python Settings
au BufRead,BufNewFile *.py call PyInit() 
function! PyInit() """"""""""""""""""""""""""""""""""""""""""""""""
" Ugly function because python script below is sensitive to indent

" syntax highlighting
let python_highlight_all=1
syntax on

" Enable folding
set foldmethod=indent
set foldlevel=99

" python with virtualenv support
python << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endfunction """"""""""""""""""""""""""""""""""""""""""""""""""""""
