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
	use({ "catppuccin/nvim", as = "catppuccin" })
	
	-- Plugins
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true }})
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "folke/twilight.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "folke/todo-comments.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	-- use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use({ "numToStr/Comment.nvim" })
	use({ "uga-rosa/ccc.nvim" })
	use({ "ggandor/leap.nvim" })
	use({ 'rmagatti/session-lens', requires = 'rmagatti/auto-session' })
	use({ 'lewis6991/gitsigns.nvim' })
	-- use({ "sitiom/nvim-numbertoggle" })
	use({ "kylechui/nvim-surround" })
	use({ "ThePrimeagen/harpoon" })
	use({ "ahmedkhalf/project.nvim" })

	-- CMP & Snippets
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	use({ "L3MON4D3/LuaSnip" }) -- Snippet Engine
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippet Completion
	use({ "rafamadriz/friendly-snippets" })
	-- use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- LSP
	use({ "williamboman/mason.nvim" }) 
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter"})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
