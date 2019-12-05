syntax on


set nocompatible
set smartindent
set shiftwidth=4
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set cursorline
set expandtab
set encoding=UTF-8
set spell

" For cags
set autochdir
set tags+=tags;


set mouse=a

filetype off

"python pep8 indentations
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=5 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

" different settings for fullstack
au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'

" Utility
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
" Plugin 'inkarkat/vim-spellcheck'


" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'


" Generic Programming Support
" Plugin 'jakedouglas/exuberant-ctags' "Looks like repos is no longer
" available at github
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'tobyS/vmustache'
Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'neomake/neomake'

" Markdown / Writting
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'

" shell support
Plugin 'shougo/vimshell.vim'

" Python indentations
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-python/python-syntax'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'

" Basic indentation
Plugin 'Yggdroot/indentLine'

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
"Plugin 'w0rp/ale'
Plugin 'dense-analysis/ale'


" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
Plugin 'tpope/vim-surround'

" Clang completion
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'Shougo/deoplete-clangx'
" Plugin 'zchee/deoplete-jedi'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'

let python_highlight_all=1




call vundle#end()
"-------------- PLUGINS END --------------------
filetype plugin indent on


" highlight whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"---- IndentLine Settings ---
let g:indentLine_enabled = 0
let g:indentLine_char = '⡁'
let g:indentLine_leadingSpaceChar = '␣'
let g:indentLine_leadingSpaceEnabled = 0
map <silent><C-l> :call FlipSpace()<CR>
imap <silent><C-l> <ESC>:call FlipSpace()<CR>i<RIGHT>
set listchars=eol:¬,tab:‣╌,trail:␣,extends:>,precedes:<
func! FlipSpace()
    if match(&runtimepath, 'vim-lengthmatters') != -1
        IndentLinesToggle
        LeadingSpaceToggle
    endif
    set list!
endfunc

"--- ALE settings ---
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'


" ---- DEOPLETE - C LANG - complete settings ---
" let g:deoplete#enable_at_startup = 1

" --- NEOCOMPLETE -
let g:neocomplete#enable_at_startup = 1

"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeWinSize=20


"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


"-------- TAGS SETTINGS --------------------------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2
let Tlist_Use_Right_Window = 1


nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2


"-------ctrlp settings------
let g:ctrlp_root_markers = ['.ctrlp']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }


"-------YCM settings--------
" let ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
