"{ Plugin installation
"{{ Vim-plug Install and related settings

" Auto-install vim-plug on different systems if it does not exist.
" For Windows, only Windows 10 with curl installed are supported (after
" Windows 10 build 17063, source: http://tinyurl.com/y23972tt).
" The following script to install vim-plug is adapted from vim-plug
" wiki: https://github.com/junegunn/vim-plug/wiki/tips#tips

" Set up directory to install the plugins based on whether you are installing
" neovim system wide or for personal use.
"}}
let g:PLUGIN_HOME='~/.config/nvim/plugged'

call plug#begin(g:PLUGIN_HOME)
    "{{ Autocompletion related plugins
        " Auto-completion
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}

        " Python source for deoplete
        "Plug 'zchee/deoplete-jedi', { 'for': 'python' }

        " Vim source for deoplete
        Plug 'Shougo/neco-vim', { 'for': 'vim' }

        " Insert mode completion
        Plug 'ervandew/supertab'
    "}}
    
    "{{ C/C++
        " c/c++ highlighting
        Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
        " c/c++ easy jump between .c and .h
        Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
    "}}

    "{{ Python-related plugins
        " Python completion, goto definition etc.
        "Plug 'davidhalter/jedi-vim', { 'for': 'python' }

        " Python syntax highlighting and more
        Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

        " Python indent (follows the PEP8 style)
        Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

        " Python code folding
        Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
    "}}

    "{{ Search related plugins
        " Improve vim incsearch
        Plug 'haya14busa/is.vim'

        " Show match number for incsearch
        Plug 'osyo-manga/vim-anzu'

        " Stay after pressing * and search selected text
        Plug 'haya14busa/vim-asterisk'

        " File search, tag search and more
        if has('win32')
            Plug 'Yggdroot/LeaderF'
        else
            Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
        endif

        " Another grep tool (similar to Sublime Text Ctrl+Shift+F)
        Plug 'dyng/ctrlsf.vim'

        " A greping tool
        " Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    "}}

    "{{ UI: Color, theme etc.
        " A list of colorscheme plugin you may want to try. Find what suits you.
        " Plug 'lifepillar/vim-gruvbox8'
        " Plug 'sjl/badwolf'
        " Plug 'ajmwagar/vim-deus'
        " Plug 'sainnhe/vim-color-desert-night'
        " Plug 'YorickPeterse/happy_hacking.vim'
        " Plug 'lifepillar/vim-solarized8'
        " Plug 'sickill/vim-monokai'
        " Plug 'whatyouhide/vim-gotham'
        " Plug 'rakr/vim-one'
        " Plug 'kaicataldo/material.vim'
        Plug 'chriskempson/base16-vim'
 
        " colorful status line and theme
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'mhinz/vim-startify'
    "}}

    "{{ Navigation and tags plugin
        " File explorer for vim
        Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

        " Only install these plugins if ctags are installed on the system
        if executable('ctags')
            " plugin to manage your tags
            Plug 'ludovicchabant/vim-gutentags'
            " show file tags in vim window
            Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle', 'TagbarOpen'] }
        endif

    "}}

    "{{ File editting plugin
        " Snippet engine and snippet template
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'

        " Automatic insertion and deletion of a pair of characters
        Plug 'jiangmiao/auto-pairs'

        " Comment plugin
        Plug 'tpope/vim-commentary'

        " graphcial undo history, see https://github.com/mbbill/undotree
        Plug 'mbbill/undotree'

        " another plugin to show undo history is: http://tinyurl.com/jlsgjy5
        " Plug 'simnalamburt/vim-mundo'

        " Manage your yank history
        if has('win32') || has('macunix')
            Plug 'svermeulen/vim-yoink'
        endif

        " Show marks in sign column for quicker navigation
        Plug 'kshenoy/vim-signature'

        " Handy unix command inside Vim (Rename, Move etc.)
        Plug 'tpope/vim-eunuch'

        " Show the content of register in preview window
        " Plug 'junegunn/vim-peekaboo'
    "}}

    "{{ Linting, formating
        " Syntax check and make
        Plug 'neomake/neomake'

        " Another linting plugin
        " Plug 'w0rp/ale'

        " Auto format tools
        " Plug 'sbdchd/neoformat'
        " Plug 'Chiel92/vim-autoformat'
    "}}

    "{{ Git related plugins
        " Show git change (change, delete, add) signs in vim sign column
        Plug 'mhinz/vim-signify'
        " Another similar plugin
        " Plug 'airblade/vim-gitgutter'

        " Git command inside vim
        Plug 'tpope/vim-fugitive'

        " Git commit browser --- requires fugitive
        Plug 'junegunn/gv.vim', { 'on': 'GV' }
    "}}

    "{{ Text object plugins
        " Additional powerful text object for vim, this plugin should be studied
        " carefully to use its full power
        Plug 'wellle/targets.vim'

        " Add indent object for vim (useful for languages like Python)
        Plug 'michaeljsmith/vim-indent-object'
        "}}

        "{{ LaTeX editting and previewing plugin
        " Only use these plugin on Windows and Mac and when LaTeX is installed
        if ( has('macunix') || has('win32') ) && executable('latex')
            " vimtex use autoload feature of Vim, so it is not necessary to use `for`
            " keyword of vim-plug to try to lazy-load it,
            " see http://tinyurl.com/y3ymc4qd
            Plug 'lervag/vimtex'

            " Plug 'matze/vim-tex-fold', {'for': 'tex'}
            " Plug 'Konfekt/FastFold'
        endif

        " set latex files to line length of 80
        au bufread,bufnewfile *.tex call latexinit()
        function s:latexinit()
            setlocal textwidth=80
            setlocal spell spelllang=en_us
        endfunction
    "}}

    "{{ Misc plugins
        " Highlight yanked region
        Plug 'machakann/vim-highlightedyank'

        " Modern matchit implementation
        Plug 'andymass/vim-matchup'

        " Simulating smooth scroll motions with physcis
        Plug 'yuttie/comfortable-motion.vim'

        "fuzzy finder (file searcher)
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
        
        " better visual guide
        Plug 'yggdroot/indentline'
        
        " git gutter to show changes to file
        Plug 'airblade/vim-gitgutter'
    "}}
    
call plug#end()
"}

"{ Plugin settings
    "{{ Auto-completion related
        """""""""""""""""""""""""""" deoplete settings""""""""""""""""""""""""""
        " Wheter to enable deoplete automatically after start nvim
        let g:deoplete#enable_at_startup = 0

        " Maximum candidate window width
        call deoplete#custom#source('_', 'max_menu_width', 80)

        " Minimum character length needed to activate auto-completion,
        " see https://goo.gl/QP9am2
        call deoplete#custom#source('_', 'min_pattern_length', 1)

        " Whether to disable completion for certain syntax
        " call deoplete#custom#source('_', {
        "     \ 'filetype': ['vim'],
        "     \ 'disabled_syntaxes': ['String']
        "     \ })
        call deoplete#custom#source('_', {
           \ 'filetype': ['python'],
           \ 'disabled_syntaxes': ['Comment']
           \ })

        " Ignore certain sources, because they only cause nosie most of the time
        call deoplete#custom#option('ignore_sources', {
          \ '_': ['around', 'buffer' ]
          \ })

        " Candidate list item number limit
        call deoplete#custom#option('max_list', 30)

        " The number of processes used for the deoplete parallel feature.
        call deoplete#custom#option('num_processes', 16)

        " The delay for completion after input, measured in milliseconds.
        call deoplete#custom#option('auto_complete_delay', 50)

        " Enable deoplete auto-completion
        call deoplete#custom#option('auto_complete', v:true)

        " Automatically close function preview windows after completion
        " see https://goo.gl/Bn5n39
        " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

        " Tab-complete, see https://goo.gl/LvwZZY
        " inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"

        """""""""""""""""""""""""UltiSnips settings"""""""""""""""""""
        " Trigger configuration. Do not use <tab> if you use YouCompleteMe
        let g:UltiSnipsExpandTrigger='<tab>'

        " Shortcut to jump forward and backward in tabstop positions
        let g:UltiSnipsJumpForwardTrigger='<c-j>'
        let g:UltiSnipsJumpBackwardTrigger='<c-k>'

        " Configuration for custom snippets directory, see
        " https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
        let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']

        """""""""""""""""""""""""supertab settings""""""""""""""""""""""""""
        " Auto-close method preview window
        let g:SuperTabClosePreviewOnPopupClose = 1

        " Use the default top to bottom way for scroll, see https://goo.gl/APdo9V
        let g:SuperTabDefaultCompletionType = '<c-n>'

        " Shortcut to navigate forward and backward in completion menu,
        " see https://is.gd/AoSv4m
        let g:SuperTabMappingForward = '<tab>'
        let g:SuperTabMappingBackward = '<s-tab>'
    "}}

    "{{ C/C++ settings
        au bufread,bufnewfile *.c,*.cpp,*.cc call cinit()
        function s:cinit()
            " a - switching between files 
            " header / source
            nnoremap <f4> :a<cr>
            inoremap <f4> <esc>:a<cr>a
            " file under cursor
            nnoremap <f2> :ih<cr>
            inoremap <f2> <esc>:ih<cr>
        endfunction
    "}}
 
    "{{ Python-related
        """""""""""""""""kite settings"""""""""""""""""
        let g:kite_auto_complete=1
 
         """""""""""""""""deoplete-jedi settings"""""""""""""""""""""""""""
         " Whether to show doc string
        "let g:deoplete#sources#jedi#show_docstring = 1
 
        "" For large package, set autocomplete wait time longer
       "let g:deoplete#sources#jedi#server_timeout = 48

       "" Ignore jedi errors during completion
       "let g:deoplete#sources#jedi#ignore_errors = 1

       """""""""""""""""""""""""jedi-vim settings"""""""""""""""""""
       "" Disable autocompletion, because I use deoplete for auto-completion
       "let g:jedi#completions_enabled = 0

       "" Whether to show function call signature
       "let g:jedi#show_call_signatures = '1'

        """""""""""""""""""""""""" semshi settings """""""""""""""""""""""""""""""
        " Do not highlight for all occurances of variable under cursor
        let g:semshi#mark_selected_nodes=0

        " Do not show error sign since neomake is specicialized for that
        let g:semshi#error_sign=v:false

        """""""""""""""""""""""""" simpylFold settings """""""""""""""""""""""""""""""
        " Do not fold docstring
        let g:SimpylFold_fold_docstring = 0
        let g:SimpylFold_fold_import = 0

        let python_highlight_all = 1
    "}}

    "{{ Search related
        """"""""""""""""""""""""""""is.vim settings"""""""""""""""""""""""
        " To make is.vim work together well with vim-anzu and put current match in
        " the center of the window.
        " `zz`: put cursor line in center of the window.
        " `zv`: open a fold to reveal the text when cursor step into it.
        nmap n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)zzzv
        nmap N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)zzzv

        """""""""""""""""""""""""""""vim-anzu settings"""""""""""""""""""""""
        " Do not show search index in statusline since it is shown on command line
        let g:airline#extensions#anzu#enabled = 0

        " Maximum number of words to search
        let g:anzu_search_limit = 500000

        """""""""""""""""""""""""""""vim-asterisk settings"""""""""""""""""""""
        nmap *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
        nmap #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
        nmap g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
        nmap g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

        """""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
        " Search files in popup window
        nnoremap <silent> <leader>f :Leaderf file --popup<CR>

        """"""""""""""""""""""""""""""ctrlsf""""""""""""""""""""""""""""""
        nmap <silent> <Space>F <Plug>CtrlSFPrompt
        vmap <silent> <Space>W <Plug>CtrlSFVwordPath
    "}}

    "{{ Navigation and tags
        """"""""""""""""""""""" nerdtree settings """"""""""""""""""""""""""
        " Toggle nerdtree window and keep cursor in file window,
        " adapted from http://tinyurl.com/y2kt8cy9
        nnoremap <silent> <Space>s :NERDTreeToggle<CR>:wincmd p<CR>

        " Reveal currently editted file in nerdtree widnow,
        " see https://goo.gl/kbxDVK
        nnoremap <silent> <Space>f :NERDTreeFind<CR>

        " Ignore certain files and folders
        let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

        " Automatically show nerdtree window on entering nvim,
        " see https://github.com/scrooloose/nerdtree. But now the cursor
        " is in nerdtree window, so we need to change it to the file window,
        " extracted from https://goo.gl/vumpvo
        " autocmd VimEnter * NERDTree | wincmd l

        " Delete a file buffer when you have deleted it in nerdtree
        let NERDTreeAutoDeleteBuffer = 1

        " Show current root as realtive path from HOME in status bar,
        " see https://github.com/scrooloose/nerdtree/issues/891
        let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

        " Disable bookmark and 'press ? for help' text
        let NERDTreeMinimalUI=0

        """"""""""""""""""""""""""" tagbar settings """"""""""""""""""""""""""""""""""
        " Shortcut to toggle tagbar window
        nnoremap <silent> <Space>t :TagbarToggle<CR>

        """"""""""""""""""""""""""""buffer settings"""""""""""""""""""""""""""""
        " hotkey buffer previous and next
        nnoremap <silent> <Space>n :bn<CR>
        nnoremap <silent> <Space>p :bp<CR>
    "}}

    "{{ File editting
        """"""""""""""""""""""""""""vim-yoink settings"""""""""""""""""""""""""
        if has('win32') || has('macunix')
            " ctrl-n and ctrl-p will not work if you add the TextChanged event to
            " vim-auto-save events
            " nmap <c-n> <plug>(YoinkPostPasteSwapBack)
            " nmap <c-p> <plug>(YoinkPostPasteSwapForward)

            nmap p <plug>(YoinkPaste_p)
            nmap P <plug>(YoinkPaste_P)

            " Cycle the yank stack with the following mappings
            nmap [y <plug>(YoinkRotateBack)
            nmap ]y <plug>(YoinkRotateForward)

            " Do not change the cursor position
            nmap y <plug>(YoinkYankPreserveCursorPosition)
            xmap y <plug>(YoinkYankPreserveCursorPosition)

            " Move cursor to end of paste after multiline paste
            let g:yoinkMoveCursorToEndOfPaste = 0

            " Record yanks in system clipboard
            let g:yoinkSyncSystemClipboardOnFocus = 1
        endif

        """"""""""""""""""""""""""""""vim-signature settings""""""""""""""""""""""""""
        " Change mark highlight to be more visible
        augroup signature_highlight
        autocmd!
        autocmd ColorScheme * highlight SignatureMarkText cterm=bold ctermbg=10
            \ gui=bold guifg=#aeee04
        augroup END
    "}}

    "{{ Linting and formating
        """""""""""""""""""""""""""""" neomake settings """""""""""""""""""""""
        " When to activate neomake
        call neomake#configure#automake('nrw', 50)

        " Change warning signs and color, see https://goo.gl/eHcjSq.
        let g:neomake_warning_sign={'text': '!', 'texthl': 'NeomakeWarningSign'}
        let g:neomake_error_sign={'text': '✗'}

        " Linters enabled for Python source file linting
        let g:neomake_python_enabled_makers = ['pylint']

        " Whether to open quickfix or location list automatically
        let g:neomake_open_list = 0

        " Which linter to use for TeX source files
        let g:neomake_tex_enabled_makers = []
    "}}

    "{{ Git-related
        """""""""""""""""""""""""vim-signify settings""""""""""""""""""""""""""""""
        " The VCS to use
        let g:signify_vcs_list = [ 'git' ]

        " Change the sign for certain operations
        let g:signify_sign_change = '~'
    "}}

    "{{ LaTeX editting
        """"""""""""""""""""""""""""vimtex settings"""""""""""""""""""""""""""""
        if ( has('macunix') || has('win32')) && executable('latex')
            " Set up LaTeX flavor
            let g:tex_flavor = 'latex'

            " Deoplete configurations for autocompletion to work
            call deoplete#custom#var('omni', 'input_patterns', {
                      \ 'tex': g:vimtex#re#deoplete
                      \})

            let g:vimtex_compiler_latexmk = {
                 \ 'build_dir' : 'build',
                 \}

            " TOC settings
            let g:vimtex_toc_config = {
                  \ 'name' : 'TOC',
                  \ 'layers' : ['content', 'todo', 'include'],
                  \ 'resize' : 1,
                  \ 'split_width' : 30,
                  \ 'todo_sorted' : 0,
                  \ 'show_help' : 1,
                  \ 'show_numbers' : 1,
                  \ 'mode' : 2,
                  \}

        endif
    "}}

    "{{ UI: Status line, look
        """""""""""""""""""""""""""vim-airline setting""""""""""""""""""""""""""""""
        " Set airline theme to a random one if it exists
        "let s:candidate_airlinetheme = ['ayu_mirage', 'base16_flat',
        "    \ 'base16_grayscale', 'lucius', 'base16_tomorrow', 'ayu_dark',
        "    \ 'base16_adwaita', 'biogoo', 'distinguished', 'jellybeans',
        "    \ 'luna', 'raven', 'term', 'vice', 'zenburn', 'tomorrow']
        "let s:idx = utils#RandInt(0, len(s:candidate_airlinetheme)-1)
        "let s:theme = s:candidate_airlinetheme[s:idx]

        "if utils#HasAirlinetheme(s:theme)
        "    let g:airline_theme=s:theme
        "endif

        let base16colorspace=256
        colorscheme base16-spacemacs
        " True Color Support if it's avaiable in terminal
        if has("termguicolors")
            set termguicolors
        endif

        " Tabline settings
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

        " Show buffer number for easier switching between buffer,
        " see https://github.com/vim-airline/vim-airline/issues/1149
        let g:airline#extensions#tabline#buffer_nr_show = 1

        " Buffer number display format
        let g:airline#extensions#tabline#buffer_nr_format = '%s. '

        " Whether to show function or other tags on status line
        let g:airline#extensions#tagbar#enabled = 1

        " Skip empty sections if there are nothing to show,
        " extracted from https://vi.stackexchange.com/a/9637/15292
        let g:airline_skip_empty_sections = 1

        " Whether to use powerline symbols, see https://goo.gl/XLY19H.
        let g:airline_powerline_fonts = 0

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.spell = 'Ꞩ'

        " Only show git hunks which are non-zero
        let g:airline#extensions#hunks#non_zero_only = 1

        " Speed up airline
        let g:airline_highlighting_cache = 1
    "}}

    "{{ Misc plugin setting
        """"""""""""""""""" vim-highlightedyank settings """"""""""""""
        " Reverse the highlight color for yanked text for better visuals
        highlight HighlightedyankRegion cterm=reverse gui=reverse

        " Let highlight endures longer
        let g:highlightedyank_highlight_duration = 1000

        """"""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
        " Improve performance
        let g:matchup_matchparen_deferred = 1
        let g:matchup_matchparen_timeout = 100
        let g:matchup_matchparen_insert_timeout = 30

        " Enhanced matching with matchup plugin
        let g:matchup_override_vimtex = 1

        " Whether to enable matching inside comment or string
        let g:matchup_delim_noskips = 0

        " Change highlight color of matching bracket for better visual effects
        augroup matchup_matchparen_highlight
          autocmd!
          autocmd ColorScheme * highlight MatchParen cterm=underline gui=underline
        augroup END

        " Show matching keyword as underlined text to reduce color clutter
        augroup matchup_matchword_highlight
            autocmd!
            autocmd ColorScheme * hi MatchWord cterm=underline gui=underline
        augroup END

        """"""""""""""""""""""""comfortable-motion settings """"""""""""""""""""""
        let g:comfortable_motion_scroll_down_key = 'j'
        let g:comfortable_motion_scroll_up_key = 'k'

        let g:comfortable_motion_no_default_key_mappings = 1
        " scroll based on window height
        nnoremap <silent> <C-d> :call comfortable_motion#flick(winheight(0) * 2)<CR>
        nnoremap <silent> <C-u> :call comfortable_motion#flick(winheight(0) * -2)<CR>
        nnoremap <silent> <C-f> :call comfortable_motion#flick(winheight(0) * 4)<CR>
        nnoremap <silent> <C-b> :call comfortable_motion#flick(winheight(0) * -4)<CR>

        " Mouse settings
        noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
        noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

        " line relative numbers to line
        set number
        set relativenumber
        set hidden
        set mouse=a
        set noshowmode
        set noshowmatch
        set nolazyredraw

        " turn off backup
        set nobackup
        set noswapfile
        set nowritebackup

        " search configuration
        set ignorecase                    " ignore case when searching
        set smartcase                     " turn on smartcase

        " tab and indent configuration
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set autoindent
        set ruler

        set incsearch "incremental search
        set hlsearch "highlight search

        " easy newtab 
        cabb tt :tabnew

        set splitbelow
    "}}
"}



" Private settings not for repo
"let g:private_settings_file_path = $HOME . '/.config/nvim/_init_private.vim'
"if filereadable(g:private_settings_file_path)
"    execute 'source ' . g:private_settings_file_path
"endif
