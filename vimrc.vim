" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'evanleck/vim-svelte'
Plug 'tpope/vim-surround'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'Darazaki/indent-o-matic'
Plug 'nvim-mini/mini.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Theme
Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }

" Statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" LLM
Plug 'olimorris/codecompanion.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Rust
Plug 'mrcjkb/rustaceanvim'


call plug#end()

syntax enable
filetype plugin indent off

" formatting
set relativenumber
set number
set nocursorline
set sw=2
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

colorscheme aura-dark
