" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Plug 'ElmCast/elm-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
"Plug 'bling/vim-airline'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-dispatch'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale', { 'do': 'npm install -g eslint' }
"Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'peterhoeg/vim-qml'
Plug 'vmchale/ion-vim'
Plug 'ntk148v/vim-horizon'
"Plug 'srcery-colors/srcery-vim'
"Plug 'haishanh/night-owl.vim'
"Plug 'ayu-theme/ayu-vim'

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

call plug#end()

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" deoplete
" call deoplete#enable()
"let g:deoplete#enable_at_startup=1

filetype plugin indent on
filetype plugin on

" formatting
set nocompatible
set relativenumber
set number
" set cursorline
set smartindent
set autoindent
set sw=2
syntax enable

" vimgrep next mappings
map <silent> <S-Right> :cnext<CR>
map <silent> <S-Left> :cprevious<CR>

" Tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [ 'elm', 'jsx', 'javascript.jsx', 'vue', 'qml' ]
let g:tern_show_argument_hints='on_hold'

" rust things
let g:autofmt_autosave = 1
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

" Airline
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

" Use tabbing
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"

" Open tree files in new tab
"let NERDTreeMapOpenInTab='<ENTER>'

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
map <silent> <S-C-N> :NERDTree<CR>

" autocmd VimEnter * NERDTree
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set hidden
let g:racer_cmd = "/Users/antti/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }

let mapleader = ','

"fzf as ctrlp
nnoremap <leader>p :Files<CR>

"grepper
nnoremap <leader>o :Grepper<cr>

let g:grepper = {
    \ 'tools': ['rg', 'git'],
    \ }

" set t_Co=256
set termguicolors
colorscheme horizon
"let g:airline_theme = 'srcery'


" Function: display errors from Ale in statusline
" function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf(
"    \ 'W:%d E:%d',
"    \ l:all_non_errors,
"    \ l:all_errors
"    \)
" endfunction
" 
" set laststatus=2
" set statusline=
" set statusline+=\ ‹‹
" set statusline+=\ %f\ %*
" set statusline+=\ ››
" set statusline+=\ %m
" set statusline+=\ %F
" set statusline+=%=
" set statusline+=\ %{LinterStatus()}
" set statusline+=\ ‹‹
" set statusline+=\ %{strftime('%R',getftime(expand('%')))}
" set statusline+=\ ::
" set statusline+=\ %n
" set statusline+=\ ››\ %*
" 
" a basic set up for LanguageClient-Neovim

" << LSP >> {{{

let g:LanguageClient_autoStart = 1
nnoremap <leader>lcs :LanguageClientStart<CR>

" if you want it to turn on automatically
" let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
" }}}
