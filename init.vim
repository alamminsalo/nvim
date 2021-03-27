" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'chrisbra/csv.vim'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'elzr/vim-json'
Plug 'fholgado/minibufexpl.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript'] }
Plug 'rust-lang/rust.vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'srivathsanmurali/OpenAPIValidate.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'cseelus/vim-colors-tone'
Plug 'matveyt/vim-modest'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'aonemd/kuroi.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'mustache/vim-mustache-handlebars'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

call plug#end()

" Use deoplete.
"set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
"
" NVIM LANGUAGE CLIENT
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

" ALE
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_linters = {
      \ 'rust': ['cargo'],
      \ 'yaml': ['swaglint'],
      \ 'cs': ['OmniSharp'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ }
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'java': ['google_java_format'],
\}
let g:ale_fix_on_save = 1
let g:ale_java_google_java_format_executable='/usr/local/bin/google-java-format'
let g:ale_java_google_java_format_options='--aosp'

let g:rustfmt_autosave = 1

filetype on
filetype plugin indent on
filetype plugin on

" formatting
set nocompatible
set relativenumber
set number
set nocursorline
"set smartindent
set sw=2
"set list
"set listchars=tab:>\ 

" Fuzz search
" set path+=**
" set wildmenu

" vimgrep next mappings
map <silent> <S-Right> :cnext<CR>
map <silent> <S-Left> :cprevious<CR>

" Tern
"let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = '0'
"let g:tern#filetypes = [ 'jsx', 'javascript.jsx', 'vue', 'qml' ]
"let g:tern_show_argument_hints='on_hold'

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Use tabbing
"autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:ctrlp_prompt_mappings = {}
"let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|git\|dist\|www'
"let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|target\|www'

"let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

" Open tree files in new tab

let mapleader = ','
"fzf as ctrlp
nnoremap <leader>p :GFiles<CR>
"grepper
nnoremap <leader>o :Grepper<cr>
let g:grepper = {
    \ 'tools': ['rg', 'git'],
    \ }

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <M-O> :GrepperRg -S --ignore-file ~/.config/nvim/ignorefile<SPACE>
nnoremap <M-P> :GFiles <CR>
nnoremap <C-T> :TagbarToggle<CR>
nnoremap <leader>v <cmd>CHADopen<cr>

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

"let g:formatterpath = ['/usr/local/bin/tidy']
"let g:javascript_plugin_flow=1
"let g:jsx_ext_required = 0

"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1

let g:autotagTagsFile="tags"

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
let g:python2_host_prog  = '/usr/bin/python2'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"let g:ale_sign_error = '!'
"let g:ale_sign_warning = '?'
let g:vim_json_syntax_conceal = 0

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" omnisharp
let g:OmniSharp_server_stdio = 1

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:go_gometalinter_enable=['staticcheck']

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" theme
syntax enable
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
color spaceduck

let g:lightline = {
          \ 'colorscheme': 'spaceduck',
          \ }
