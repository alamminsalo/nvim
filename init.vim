" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
" Plug 'gavocanov/vim-js-indent', { 'for': ['javascript'] }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g jshint' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'Robzz/deoplete-omnisharp'
Plug 'tpope/vim-dispatch'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale', { 'do': 'npm install -g jshint' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'nsf/gocode'
Plug 'zchee/deoplete-go'
Plug 'ayu-theme/ayu-vim'
Plug 'maksimr/vim-jsbeautify'

call plug#end()

" deoplete
call deoplete#enable()
let g:deoplete#enable_at_startup=1

filetype plugin indent on
filetype plugin on

" formatting
set nocompatible
set relativenumber
set number
set cursorline
"set smartindent
set sw=2
syntax enable
"set list
"set listchars=tab:>\ 
set t_Co=256

" Fuzz search
" set path+=**
" set wildmenu

" vimgrep next mappings
map <silent> <S-Right> :cnext<CR>
map <silent> <S-Left> :cprevious<CR>

" Tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [ 'jsx', 'javascript.jsx', 'vue', 'qml' ]
let g:tern_show_argument_hints='on_hold'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Use tabbing
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:ctrlp_prompt_mappings = {}
"let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|git\|dist\|www'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|www'

"let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

set termguicolors

colorscheme ayu
" let g:airline_theme = 'ayu'
set background=dark

" Open tree files in new tab
"let NERDTreeMapOpenInTab='<ENTER>'

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

map <silent> <S-C-N> :NERDTree<CR>

" autocmd VimEnter * NERDTree
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
