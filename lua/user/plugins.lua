local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	-- Themes
	use({ "sainnhe/everforest" })
	-- use({ "catppuccin/nvim", as = "catppuccin" }) -- variety
	-- use ({ "EdenEast/nightfox.vim" }) -- variety
	use ({ "sam4llis/nvim-tundra" }) -- dark blue, doesn't work with lualine
	-- use ({"rebelot/kanagawa.nvim" }) -- Purple
  use({ "rose-pine/neovim" }) -- dark violet

	-- Important Plugins
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "kyazdani42/nvim-web-devicons" })

	-- UI --
	-- use({ "sitiom/nvim-numbertoggle" })
	use({ "folke/todo-comments.nvim" })
	use({ "folke/twilight.nvim" })
	use({ "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true }})
	use({ "folke/zen-mode.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ 'lewis6991/gitsigns.nvim' })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	
	-- Mechanics --
	use({ "phaazon/hop.nvim" })
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "kylechui/nvim-surround" })
	
	-- Features --
	use({ 'echasnovski/mini.nvim', branch = 'stable' })
	-- use({ "uga-rosa/ccc.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ 'karb94/neoscroll.nvim'})
	-- CMP & Snippets
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "L3MON4D3/LuaSnip" }) -- Snippet Engine
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippet Completion
	use({ "rafamadriz/friendly-snippets" })

	-- LSP
	use({ "williamboman/mason.nvim" }) 
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ 'rmagatti/session-lens', requires = 'rmagatti/auto-session' })
	use({ "ThePrimeagen/harpoon" })
	use({ "ahmedkhalf/project.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter"})

 -- TIMEOUT -- 
	-- use({ "ggandor/leap.nvim" })


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
