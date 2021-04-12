call plug#begin('~/.config/nvim/plugged')
""" essentials
Plug 'christoomey/vim-tmux-navigator'   " for tmux navigation
Plug 'junegunn/fzf'                     " find files
Plug 'junegunn/fzf.vim'
Plug 'konfekt/FastFold'
Plug 'sheerun/vim-polyglot'             " language features
Plug 'tpope/vim-commentary'             " gc to comment
Plug 'tpope/vim-surround'               " cs - change surround / ds - delete surround
Plug 'tpope/vim-repeat'                 " remap . to repeat plugin commands
""" color schemes
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'
""" IDE-type stuff
Plug 'vim-airline/vim-airline'          " lightweight bottom bar
Plug 'dense-analysis/ale'               " language server features
Plug 'tpope/vim-fugitive'               " :Git
Plug 'tpope/vim-rhubarb'                " :GitBrowse

""" old IDE-type stuff
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " autocomplete
"Plug 'zchee/deoplete-jedi'
"Plug 'nikvdp/neomux'       " better vim terminals
"Plug 'neomake/neomake'     " running outside programs async (linting)
"Plug 'sbdchd/neoformat'    " autoformatting

""" experiment of not using tmux
"Plug 'gcmt/taboo.vim'       " tab renaming/etc.
"Plug 'majutsushi/tagbar'   " tag outline viewer
call plug#end()

""" colorscheme
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
filetype plugin indent on
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

""" tab settings, 2 space tabs, except for Python.
set tabstop=2
set shiftwidth=2
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
autocmd filetype python set colorcolumn=99
autocmd FileType python setlocal shiftwidth=4 tabstop=4
" autocmd! BufWritePost * Neomake

""" better navigation (without tmux)
" nnoremap <silent> <c-h> :wincmd h<CR>
" nnoremap <silent> <c-j> :wincmd j<CR>
" nnoremap <silent> <c-k> :wincmd k<CR>
" nnoremap <silent> <c-l> :wincmd l<CR>
" tnoremap <silent> <c-h> <C-\><C-n>:wincmd h<CR>
" tnoremap <silent> <c-j> <C-\><C-n>:wincmd j<CR>
" tnoremap <silent> <c-k> <C-\><C-n>:wincmd k<CR>
" tnoremap <silent> <c-l> <C-\><C-n>:wincmd l<CR>
" tnoremap <Esc> <C-\><C-n>

""" plugin config
nmap <C-P> :GFiles<CR>
:command Fix ALEFix
let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier'], 'json': ['prettier']}
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:neomake_python_enabled_makers = ['flake8']
let g:airline#extensions#tabline#enabled = 1
let g:deoplete#enable_at_startup = 1
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier']
"call deoplete#custom#set('jedi', 'debug_enabled', 1)
"call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')

""" custom commands

" removes trailing spaces
function! TrimSpace()
  %s/\s*$//
  ''
:endfunction
command! -bar -nargs=0 TrimSpace call TrimSpace()
