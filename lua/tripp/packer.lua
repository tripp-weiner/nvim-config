-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local is_mac = jit.os == "OSX"

local function path_exists(path)
	return vim.fn.isdirectory(path) == 1 or vim.fn.filereadable(path) == 1
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
					}
				}
			})
		end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "neovim/nvim-lspconfig",
  }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})
	use({
		"mfussenegger/nvim-dap"
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
	})
	if is_mac then
		use({
			"Cliffback/netcoredbg-macOS-arm64.nvim",
			requires = { "mfussenegger/nvim-dap" }
		})
	end
	use({
		"nicholasmata/nvim-dap-cs",
		requires = { "mfussenegger/nvim-dap" }
	})
	use({
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use({
		"github/copilot.vim",
	})
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		requires = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
	})
	local todo_local = os.getenv("HOME") .. "/Documents/workspace/personal/todo.nvim"
	local todo_path = path_exists(todo_local) and todo_local or "TrippW/todo.nvim"
	use({ todo_path })
	use({
		"m4xshen/hardtime.nvim",
		requires = { "MunifTanjim/nui.nvim" },
	})
	use 'rcarriga/nvim-notify'
	use({
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
		-- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		-- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require('render-markdown').setup({})
		end,
	})

 end)
