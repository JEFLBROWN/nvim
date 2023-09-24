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
	'nvim-treesitter/nvim-treesitter',

-- ┌┬┐┌─┐┬  ┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐
--  │ ├┤ │  ├┤ └─┐│  │ │├─┘├┤ 
--  ┴ └─┘┴─┘└─┘└─┘└─┘└─┘┴  └─┘

	'nvim-telescope/telescope.nvim', 
	'ThePrimeagen/harpoon',
	'nvim-telescope/telescope-project.nvim',
	{ 'nvim-telescope/telescope.nvim',
  	dependencies = {
    	"nvim-lua/plenary.nvim",
    	"debugloop/telescope-undo.nvim",
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
-- ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
-- │  │ ││  │ │├┬┘└─┐
-- └─┘└─┘┴─┘└─┘┴└─└─┘

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

	{ 'sainnhe/everforest', name = 'everforest', },

  { "RaphaeleL/my_vivid" },

-- ┌─┐┌─┐┬  ┬┌─┌─┐
-- ├┤ │ ││  ├┴┐├┤ 
-- └  └─┘┴─┘┴ ┴└─┘

{ "folke/styler.nvim",
  config = function()
    require("styler").setup({
      themes = {
       -- markdown = { colorscheme = "my_vivid" },
        --help = { colorscheme = "rose-pine-main", background = "dark" },
      },
    })
  end,
},


	{ 'folke/zen-mode.nvim', 
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 1,
					width = .60, -- percentage (%) 
						options = {
     					signcolumn = "no", -- disable signcolumn
      				number = false, -- disable number column
      				-- relativenumber = false, -- disable relative numbers
      				-- cursorline = false, -- disable cursorline
      				-- cursorcolumn = false, -- disable cursor column
      				-- foldcolumn = "0", -- disable fold column
      				-- list = false, -- disable whitespace characters
    				},
				},
				plugins = {
						gitsigns = { enabled = false }, -- disables git signs
					kitty = {
						enabled = true,
						font = "+4", -- font size increment
						},
					},
			})
		end,
		},

	{ 'folke/twilight.nvim',
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
    	-- we try to get the foreground from the highlight groups or fallback color
    		color = { "Normal", "#333333" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  		},
			context = 2, -- amount of lines we will try to show around the current line
  		treesitter = true, -- use treesitter when available for the filetype
  		expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    		"function",
    		"method",
    		"table",
    		"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
	},
	
	{ "folke/flash.nvim",
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

-- -- oil	
-- 	{ 'stevearc/oil.nvim',
-- 		config = function()
-- 			require('oil').setup({
--   		opts = {},
--   		-- Optional dependencies
--   		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 		})
-- 		end
-- 	},

-- Mini-files
{ 'echasnovski/mini.files', version = false,
config = function()	
	require('mini.files').setup({
	})
end
	},

-- Mini-Starter
{  'echasnovski/mini.starter', version = false,
	config = function()
	require('mini.starter').setup({
	})
		end	
},
 

-- Features --
	{
  'max397574/better-escape.nvim',
  config = function()
    require("better_escape").setup()
  end,
},
	'norcalli/nvim-colorizer.lua', 
	'karb94/neoscroll.nvim',
	'yuttie/comfortable-motion.vim', --smooth scrolling
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }},
	'lewis6991/gitsigns.nvim', -- add git signs in the statusbar 
	'akinsho/toggleterm.nvim', -- toggle a floating terminal 
	'lukas-reineke/indent-blankline.nvim', -- add indentation guides for tabs, spaces, and returns
	{ 'echasnovski/mini.surround', version = false },	
	{ 'echasnovski/mini.comment', version = '*' },
	-- 'numToStr/Comment.nvim',  -- Commenting functionality 
	"hinell/move.nvim", 			-- mimics VS code line movement
	'windwp/nvim-autopairs',  -- Autopairs, integrates with both cmp and treesitter
-- Completion & Snippets
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',  -- Snippet Engine
	-- 'saadparwaiz1/cmp_luasnip',  -- Snippet Completion
	'rafamadriz/friendly-snippets',
-- ┬  ┌─┐┌─┐
-- │  └─┐├─┘
-- ┴─┘└─┘┴  

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
    	}
		},

}) -- END LAZY

