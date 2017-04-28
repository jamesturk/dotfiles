call plug#begin('~/.config/nvim/plugged')

""" essentials
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'konfekt/FastFold'
Plug 'vim-airline/vim-airline'
""" IDE-type stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
""" color schemes
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'
call plug#end()

""" colorscheme
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
filetype plugin indent on
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

""" host programs
let g:python_host_prog='/Users/james/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog='/Users/james/.virtualenvs/neovim3/bin/python3'

""" tab settings, 4 space tabs, always.
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

""" modeline
set showcmd    " show partial command in visual mode
set showmode   " show mode on last line
set ruler      " line & column number of cursor

""" other general settings
set title        " set title of window
set number       " show line numbers
set hidden       " allow editing multiple buffers
set scrolloff=5  " keep 5 lines visible above/below cursor
set splitbelow   " make window splits flow more naturally
set splitright
set ignorecase   " ignore case in search
set smartcase    " ...unless we specify capital letters
set incsearch    " highlight as we search
set autochdir    " set pwd to local file, so edit paths are relative
set wildmenu     " nice autocomplete menu
set list         " show whitespace
set listchars=tab:»\ ,trail:\ 
set virtualedit=block     " allow editing in virtual space in block mode
set formatoptions+=j " Delete comment character when joining commented lines
set colorcolumn=80
set backspace=indent,eol,start
set clipboard=unnamed

""" filetype specific
autocmd filetype go set listchars=tab:\ \ ,trail:\ 
" open folds by default
autocmd filetype python normal zR
autocmd! BufWritePost * Neomake

""" plugin config
let g:neomake_python_enabled_makers = ['flake8']
let g:airline#extensions#tabline#enabled = 1
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#set('jedi', 'debug_enabled', 1)
"call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')

""" custom commands

" removes trailing spaces
function! TrimSpace()
  %s/\s*$//
  ''
:endfunction
command! -bar -nargs=0 TrimSpace call TrimSpace()