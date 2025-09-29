-- =========================
-- Bootstrap lazy.nvim
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- =========================
-- Plugins
-- =========================
require("lazy").setup({
	-- Telescope & dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim", version = "0.1.8", cmd = "Telescope" },

	-- Treesitter & LSP
	"neovim/nvim-lspconfig",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPre" },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				sql = { "sleek" },
				python = {
					--"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
			},
			formatters = require("formatters"),
			format_on_save = {
				timeout_ms = 3000,
				lsp_format = "fallback",
			},
		},
	},

	-- UI
	"nvim-tree/nvim-web-devicons",
	{ "akinsho/bufferline.nvim", version = "*", event = "BufReadPre" },
	"nvim-lualine/lualine.nvim",

	-- Theme
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
		end,
	},

	-- LLM
	"olimorris/codecompanion.nvim",

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",

	-- Pairs / Tags
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	"windwp/nvim-ts-autotag",

	-- Mini.nvim
	{ "nvim-mini/mini.nvim", branch = "main" },
})

-- =========================
-- Colorscheme
-- =========================
vim.cmd.colorscheme("aura-dark")

-- =========================
-- Mason + LSP setup
-- =========================
local servers = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" }
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = servers })

for _, lsp in ipairs(servers) do
	if lsp == "lua_ls" then
		vim.lsp.config(lsp, {
			capabilities = capabilities,
			settings = { Lua = { runtime = { version = "LuaJIT" }, diagnostics = { globals = { "vim", "require" } } } },
		})
	else
		vim.lsp.config(lsp, { capabilities = capabilities })
	end
end

-- =========================
-- Bufferline & Lualine
-- =========================
require("bufferline").setup({})
require("lualine-config")

-- =========================
-- Pairs and autotag
-- =========================
require("nvim-ts-autotag").setup()

-- =========================
-- Mini.nvim modules
-- =========================
require("mini.indentscope").setup({
	draw = { delay = 0, animation = require("mini.indentscope").gen_animation.none(), priority = 50 },
	symbol = "│",
	options = { try_as_border = true },
})
require("mini.git").setup({})
require("mini.snippets").setup({})
require("mini.surround").setup({
	mappings = {
		add = "sa",
		delete = "sd",
		find = "sf",
		find_left = "sF",
		highlight = "sh",
		replace = "sr",
		update_n_lines = "sn",
	},
})

-- =========================
-- CodeCompanion (LLM)
-- =========================
require("codecompanion").setup({
	strategies = {
		chat = { adapter = { name = "ollama", model = "deepseek-coder-v2:latest" } },
		inline = {
			adapter = { name = "ollama", model = "qwen2.5-coder:14b" },
			keymaps = {
				accept_change = { modes = { n = "ca" } },
				reject_change = { modes = { n = "cr" }, opts = { nowait = true } },
			},
		},
	},
	opts = { placement = "replace" },
})

-- =========================
-- nvim-cmp + mini.snippets
-- =========================
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
			insert({ body = args.body })
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "buffer" } }),
})

-- =========================
-- Treesitter
-- =========================
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = { "vim", "lua", "python", "markdown", "typescript", "javascript", "go", "rust", "sql" },
	sync_install = false,
	auto_install = true,
})

-- =========================
-- Leader key
-- =========================
vim.g.mapleader = ","
--vim.g.maplocalleader = ","

-- =========================
-- Basic Neovim options
-- =========================
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.sw = 2

-- =========================
-- Telescope keymaps
-- =========================
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>o", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>l", builtin.git_files, { desc = "Git files" })

-- =========================
-- Other keymaps
-- =========================
vim.keymap.set("n", "<Tab>", "<cmd>bn<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<CR>", { silent = true })

local lsp_keymaps = {
	gD = vim.lsp.buf.declaration,
	gd = vim.lsp.buf.definition,
	K = vim.lsp.buf.hover,
	["<leader>rn"] = vim.lsp.buf.rename,
	["<leader>ca"] = vim.lsp.buf.code_action,
}

for k, v in pairs(lsp_keymaps) do
	vim.keymap.set("n", k, v, { silent = true })
end

-- =========================
-- Diagnostics
-- =========================
vim.diagnostic.config({
	virtual_text = true, -- inline text
	signs = true, -- show in sign column
	underline = true, -- underline errors
	update_in_insert = false,
	severity_sort = true,
})
