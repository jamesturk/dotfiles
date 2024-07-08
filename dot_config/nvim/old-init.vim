call plug#begin('~/.config/nvim/plugged')
""" nvim 0.5 stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
""" essentials
Plug 'christoomey/vim-tmux-navigator'   " for tmux navigation
Plug 'junegunn/fzf'                     " find files
Plug 'junegunn/fzf.vim'
Plug 'konfekt/FastFold'
Plug 'sheerun/vim-polyglot'             " language features
Plug 'pangloss/vim-javascript'
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
Plug 'OmniSharp/omnisharp-vim'
""" experiment of not using tmux
"Plug 'nikvdp/neomux'       " better vim terminals
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
augroup filetypedetect
  au BufNewFile,BufRead justfile setf make
augroup END
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
let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier'], 'json': ['prettier'], 'c': ['clang-format'], 'cpp': ['clang-format'], 'cs': ['uncrustify'] }
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint'], 'cs' :['OmniSharp']}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_c_uncrustify_options = '-c ~/.config/nvim/uncrustify.cfg -l CS'
let g:airline#extensions#tabline#enabled = 1

""" custom commands

" removes trailing spaces
function! TrimSpace()
  %s/\s*$//
  ''
:endfunction
command! -bar -nargs=0 TrimSpace call TrimSpace()
