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
require('lazy').setup({ -- Lazy Start

------------------------------------------------------------
-- Dependencies
------------------------------------------------------------

	{	'nvim-lua/plenary.nvim' },  -- Useful lua functions used by lots of plugins
	{ 'nvim-treesitter/nvim-treesitter' },

------------------------------------------------------------
-- Styles
------------------------------------------------------------

	{ 'slugbyte/lackluster.nvim' },
	{ 'sho-87/kanagawa-paper.nvim', lazy = false, priority = 1000, opts = {}, },
	{ 'lewis6991/gitsigns.nvim'}, -- add git signs in the statusbar 
	{ 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}, },
	{ 'chentoast/marks.nvim', event = "VeryLazy", opts = {}, },
	{ 'brenoprata10/nvim-highlight-colors', opts ={}, },
	{ 'Domeee/mosel.nvim' },
	{ 'LunarVim/darkplus.nvim' },
	{ 'AlexvZyl/nordic.nvim'},
	{ 'sainnhe/gruvbox-material'},
------------------------------------------------------------
-- Folke
------------------------------------------------------------

	{ 'folke/zen-mode.nvim' },
	{ 'folke/twilight.nvim', opts = {}, },
	{ "folke/flash.nvim",
		--search labels, enhanced character motions, and Treesitter integration.
		event = "VeryLazy",
	 	---@type Flash.Config
	 	opts = {},
	 	-- stylua: ignore
	 	keys = {
	 		{ "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "F", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	 	},
	},

	{ 'folke/todo-comments.nvim', dependencies = { "nvim-lua/plenary.nvim" }, opts = {}, },

------------------------------------------------------------
-- Mini
------------------------------------------------------------

	{ 'echasnovski/mini.colors', version = '*' },
	{ 'echasnovski/mini.comment', version = '*' },
	{ 'echasnovski/mini.completion', version = '*' },
	{ 'echasnovski/mini.files', version = false },
	{ 'echasnovski/mini.icons', version = false },
	{ 'echasnovski/mini.move', version= '*' },
	{ 'echasnovski/mini.sessions', version = '*' },
	{ 'echasnovski/mini.starter', version = false },
	{ 'echasnovski/mini.statusline', version = false },
	{ 'echasnovski/mini.surround', version = '*'},

------------------------------------------------------------
-- Mechanics
------------------------------------------------------------

	-- { 'j-hui/fidget.nvim', opts = {}, },
	{ 'karb94/neoscroll.nvim', },
	{ 'windwp/nvim-autopairs'},  -- Autopairs, integrates with both cmp and treesitter

------------------------------------------------------------
-- Utilities
------------------------------------------------------------

	{ 'akinsho/toggleterm.nvim'}, -- toggle a floating terminal
	-- { 'rktjmp/lush.nvim' }, -- tool to help make a colorscheme
	{ 'SmiteshP/nvim-navic'}, -- winbar context
	{ 'LunarVim/breadcrumbs.nvim' },

------------------------------------------------------------
	-- Completion & Snippets
------------------------------------------------------------

	-- { 'hrsh7th/nvim-cmp'},
	{	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
	},
------------------------------------------------------------
-- Telescope
------------------------------------------------------------

	{ 'nvim-telescope/telescope.nvim',
  	dependencies = {
    	'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-project.nvim',
    	'debugloop/telescope-undo.nvim',
			'ThePrimeagen/harpoon',
  	},
  	config = function()
    	require("telescope").setup({
      	extensions = {
        	undo = {
          -- telescope-undo.nvim config, see below
        },
      },
    })
    	require("telescope").load_extension("undo")
  	end,
	},
	 -- { 'ThePrimeagen/harpoon', }, 

------------------------------------------------------------
-- LSP
------------------------------------------------------------

	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	{
		'MaximilianLloyd/tw-values.nvim',
	   keys = {
	       { "<leader>sv", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
	   	},
	   opts = {
	       border = "rounded", -- Valid window border style,
	       show_unknown_classes = true -- Shows the unknown classes popup
			},
	 	},

}) -- END LAZY
