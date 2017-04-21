call plug#begin('~/.config/nvim/plugged')
""" essentials
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
""" IDE-type stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
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

""" filetype specific
autocmd filetype go set listchars=tab:\ \ ,trail:\ 
" open folds by default
autocmd filetype python normal zR

""" plugin config
let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('jedi', 'debug_enabled', 1)
call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')

""" custom commands

" removes trailing spaces
function! TrimSpace()
  %s/\s*$//
  ''
:endfunction
command! -bar -nargs=0 TrimSpace call TrimSpace()
