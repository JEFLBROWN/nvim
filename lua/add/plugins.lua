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
-- Styling
------------------------------------------------------------

	{ 'EdenEast/nightfox.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}, }, --- this is to show the lines connecting blocks
	-- { 'brenoprata10/nvim-highlight-colors', opts ={}, },

------------------------------------------------------------
-- Folke
------------------------------------------------------------

	{ 'folke/zen-mode.nvim' },
	{ 'folke/twilight.nvim', opts = {}, },
	{ 'folke/flash.nvim',
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

------------------------------------------------------------
-- Mini
------------------------------------------------------------

	{ 'echasnovski/mini.colors', version = '*' },
	{ 'echasnovski/mini.comment', version = '*' },
	-- { 'echasnovski/mini.completion', version = '*' },
	{ 'echasnovski/mini.files', version = false },
	{ 'echasnovski/mini.icons', version = false },
	{ 'echasnovski/mini.move', version= '*' },
	{ 'echasnovski/mini.sessions', version = '*' },
	{ 'echasnovski/mini.starter', version = false },
	{ 'echasnovski/mini.statusline', version = '*' },
	{ 'echasnovski/mini.surround', version = '*'},

------------------------------------------------------------
-- Utilities
------------------------------------------------------------

	{ 'SmiteshP/nvim-navic'}, -- winbar context
	{ 'LunarVim/breadcrumbs.nvim' },
	{ 'Saghen/blink.cmp' }, -- completion	engine	
	{ 'karb94/neoscroll.nvim', },
	{ 'lewis6991/gitsigns.nvim'}, -- add git signs in the statusbar 
	{ 'chentoast/marks.nvim', event = "VeryLazy", opts = {}, },
{
  "gbprod/yanky.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
},
------------------------------------------------------------ 
--- Picker
------------------------------------------------------------ 

 { "ibhagwan/fzf-lua",
   -- optional for icon support
   dependencies = { "echasnovski/mini.icons" },
   opts = {}
 },

------------------------------------------------------------
-- LSP
------------------------------------------------------------

	{ 'neovim/nvim-lspconfig' },

}) -- END LAZY
