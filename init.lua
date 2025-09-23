local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.opt.termguicolors = true
require("bufferline").setup({})

require('lualine-config')--.setup({})

-- Mini.vim
require('mini.indentscope').setup({
    delay = 0,
    draw = {
      animation = function()
        return 0
      end,
    }
  })
--require('mini.completion').setup({})
require('mini.pairs').setup({})
require('mini.snippets').setup({})

require('codecompanion').setup({
		strategies = {
			chat = {
				adapter = {
					name = 'ollama',
					model = 'deepseek-coder-v2:latest',
				},
			},
			inline = {
        adapter = {
					name = 'ollama',
					model = 'qwen2.5-coder:14b',
				},
				keymaps = {
					accept_change = {
						modes = { n = "ca" },
					},
					reject_change = {
						modes = { n = "cr" },
						opts = { nowait = true },
					},
				}
			},
		},
		--display = {
		--	diff = {
		--		enabled = false,
		--	}
		--}
    opts = {
      placement = "replace" -- "new"|"replace"|"add"|"before"|"chat"
    },
	})

-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }
    end,

    -- Custom config for Lua
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
    end,
  },
})


local cmp = require('cmp')
cmp.setup({
	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        insert({ body = args.body }) -- Insert at cursor
        cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }
      ),
      ['<S-Tab>'] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }
      ),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

require('nvim-treesitter.configs').setup {
  indent = { enable = true },
  highlight = { enable = true },
  ensure_installed = {
    'vim',
    'lua',
    'python',
    'markdown',
    'markdown_inline',
    'python',
    'typescript',
    'javascript',
    'go',
    'rust',
  },
  sync_install = false,
  auto_install = true,
}

-- keymaps
vim.g.mapleader = ','
-- tab cycles buffers
vim.keymap.set("n", "<Tab>", "<cmd>:bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>:bp<CR>", { noremap = true, silent = true })
-- jump to declaration/definition
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local builtin = require('telescope.builtin')

-- Keymaps
vim.keymap.set('n', '<leader>p', builtin.git_files, {})
vim.keymap.set('n', '<leader>o', builtin.live_grep, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

