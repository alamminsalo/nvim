" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript'] }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g jshint' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'


call plug#end()

" deoplete
call deoplete#enable()
let g:deoplete#enable_at_startup=1

filetype plugin indent on

" formatting
set nocompatible
set relativenumber
set number
" set cursorline
"set smartindent
set sw=2
syntax enable
"set list
"set listchars=tab:>\ 
set t_Co=256

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" True color support
set termguicolors

colorscheme gruvbox
set background=dark

" Fuzz search
set path+=**
set wildmenu

" vimgrep next mappings
map <silent> <S-Right> :cnext<CR>
map <silent> <S-Left> :cprevious<CR>

" Tern
let g:tern_request_timeout = 2
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
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme= 'gruvbox'

" Use tabbing
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
