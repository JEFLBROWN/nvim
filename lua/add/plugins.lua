-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath)then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local fn = vim.fn
require('lazy').setup({

	-- Important Plugins
	 'nvim-lua/plenary.nvim',  -- Useful lua functions used by lots of plugins
	 'kyazdani42/nvim-web-devicons', 

	-- Colorschemes
{
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    priority = 1000,
    config = function()
        require("rose-pine").setup({
				dark_variant = 'moon'
			})
        vim.cmd('colorscheme rose-pine')
    end
},
	'sainnhe/everforest',
	'rebelot/kanagawa.nvim',
	'kvrohit/mellow.nvim',
	'savq/melange-nvim',	
	
	'folke/styler.nvim',
	'folke/todo-comments.nvim', 
	
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }},

	{ 
		'folke/zen-mode.nvim', 
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 1,
					width = .75, -- width will be 75% of the editor width
				}
			})
		end,
		},
	'folke/twilight.nvim', 


	'akinsho/toggleterm.nvim', -- toggle a floating terminal 
	'kyazdani42/nvim-tree.lua', -- file explorer sidebar
	'lewis6991/gitsigns.nvim', -- add git signs in the statusbar 
	'lukas-reineke/indent-blankline.nvim', -- add indentation guides for tabs, spaces, and returns 
	
	-- Mechanics --
	'phaazon/hop.nvim',
	'windwp/nvim-autopairs',  -- Autopairs, integrates with both cmp and treesitter
	'numToStr/Comment.nvim',  -- Commenting functionality 
	{ 'echasnovski/mini.surround', version = false },	
	-- 'kylechui/nvim-surround', -- change surrounding characters or add surrounding punctuation 
	"hinell/move.nvim", 			-- mimics VS code line movement
	
	-- Features --
	 'norcalli/nvim-colorizer.lua', 
	 'karb94/neoscroll.nvim',
	
	{
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup ({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    })
  	end,
	},

	-- Completion & Snippets
	 'hrsh7th/nvim-cmp',
	 -- 'hrsh7th/cmp-nvim-lsp', commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
	 'rafamadriz/friendly-snippets',
	 'L3MON4D3/LuaSnip',  -- Snippet Engine
	 'saadparwaiz1/cmp_luasnip',  -- Snippet Completion

-- LSP
	 'williamboman/mason.nvim',
	 'williamboman/mason-lspconfig.nvim', 
	 'neovim/nvim-lspconfig',

	-- Telescope
	 'nvim-telescope/telescope.nvim', 
	-- ({ 'rmagatti/session-lens', dependencies = {'rmagatti/auto-session'}}) 
	 'ThePrimeagen/harpoon',
	 'ahmedkhalf/project.nvim', 

	-- Treesitter
	'nvim-treesitter/nvim-treesitter',

}) -- END LAZY

