
-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
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

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local fn = vim.fn
require('lazy').setup({

	-- Themes
	'rose-pine/neovim', -- dark violet
	-- 'sainnhe/everforest', -- green
	-- 'catppuccin/nvim', as = 'catppuccin',  -- variety
	-- 'EdenEast/nightfox.vim',  -- variety
	-- 'sam4llis/nvim-tundra',  -- dark blue, doesn't work with lualine
	-- 'rebelot/kanagawa.nvim',  -- Purple
	-- 'EdenEast/nightfox.nvim',  	
	-- 'kvrohit/mellow.nvim',

	-- Important Plugins
	 'nvim-lua/plenary.nvim',  -- Useful lua functions used by lots of plugins
	 'kyazdani42/nvim-web-devicons', 
	
	-- { 'akinsho/bufferline.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' }}, 
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }},
	 'folke/todo-comments.nvim', 
	 'folke/twilight.nvim', 
	 'folke/zen-mode.nvim', 

	'akinsho/toggleterm.nvim', 
	'kyazdani42/nvim-tree.lua', 
	 'lewis6991/gitsigns.nvim', 
	 'lukas-reineke/indent-blankline.nvim', 
	
	-- Mechanics --
	 'phaazon/hop.nvim',
	 'windwp/nvim-autopairs',  -- Autopairs, integrates with both cmp and treesitter
	 'numToStr/Comment.nvim', 
	 'echasnovski/mini.surround', 
	
	-- Features --
	 'norcalli/nvim-colorizer.lua', 
	 'karb94/neoscroll.nvim',
	
	-- CMP & Snippets
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

