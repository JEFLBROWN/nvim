--  ┬┌┐┌┬┌┬┐           
--  │││││ │            
--  ┴┘└┘┴ ┴

-- this is where we require Packer, plugins, and configs
require "user.plugins"
require "user.lualine"
require "user.zenmode"
require "user.nvim-tree"
require "user.toggleterm"
require "user.bufferline"
require "user.catppuccin"
require "user.comment"
require "user.ccc"
require "user.leap"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local o = vim.opt

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
-- │ │├─┘ │ ││ ││││└─┐
-- └─┘┴   ┴ ┴└─┘┘└┘└─┘
 
o.encoding = "utf-8"					-- encoding displayed
o.mouse = "a"									-- enables the mouse
o.splitbelow = true						-- horizontal splits always appear below current buffer
o.splitright = true						-- vertical splits always appear to the right
o.tabstop = 2									-- insert 2 spaces for a tab
o.shiftwidth = 2							-- insert 2 spaces for Indent
o.smarttab = true							-- Makes tabbing better, will realize you have 2 vs 4
o.smartindent = true					-- Makes indenting better
o.autoindent = true						-- Good autoindent
o.laststatus = 2							-- always display status line
o.number = true								-- show line numbers
o.showtabline = 0							-- Show/Hide Tabs(buffers)
o.updatetime = 300						-- faster completion
o.timeoutlen = 500						-- time to wait for a mapped sequence to complete (in milliseconds)
o.clipboard = "unnamedplus"		-- Copy and Paste in/out of Nvim
o.listchars = "trail:·"				-- places these glyphs on tabs and trailing spaces
o.scrolloff = 8               -- padding so you dont have to go all the way to the bottom to scroll the page
o.sidescrolloff = 8           -- same as above, but with horizontal scrolling
o.termguicolors = true				-- nvim has its own colorscheme


-- ┌─┐┌┬┐┬ ┬┬  ┌─┐┌─┐
-- └─┐ │ └┬┘│  ├─ └─┐
-- └─┘ ┴  ┴ ┴─┘└─┘└─┘

vim.cmd [[colorscheme catppuccin]] -- colorscheme

require("bufferline").setup{} --enable bufferline

-- these are styles that are wrapped in legacy VimL, Lua doesn't have an equivilant command yet, so the vim.cmd[[]] allows you to use the old code in the lua file

-- Line Number color
-- vim.cmd[[highlight LineNR ctermfg=darkgray ctermbg=none]]

-- Italic Comments
vim.cmd[[highlight Comment cterm=italic gui=italic]]
vim.cmd[[highlight Comment ctermfg=darkgray ctermbg=none]]

-- Vertical split column has no background, looks cleaner 
vim.cmd[[highlight VertSplit cterm=none]]

vim.cmd[[hi! link EndOfBuffer Ignore]]

--  ┬┌─┌─┐┬ ┬┌┬┐┌─┐┌─┐ 
--  ├┴┐├─ └┬┘│││├─┤├─┘ 
--  ┴ ┴└─┘ ┴ ┴ ┴┴ ┴┴  

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Select All 	 	 	
keymap("n", "<leader>a", "ggVG", opts)

-- open non-existant files
keymap("n", "gf", ":edit <cfile><CR>", opts)

-- Create a Split
keymap("n", "<leader>v", "<C-w>v", opts)
-- keymap("n", "<leader>h", "<C-W>h", opts)

-- Resize Splits
keymap("n", "<A-Left>", ":vertical resize +3<CR>", opts)
keymap("n", "<A-Right>" , ":vertical resize -3<CR>", opts)
-- keymap("n", "<A-Up>" , ":resize +3<CR>", opts)
-- keymap("n", "<A-Down>" , ":resize -3<CR>", opts)

-- Escape chord
keymap("i", "kj", "<ESC>", opts)

-- Quick command
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)


-- BUFFERS --

-- close buffer
keymap("n", "<C-w>", ":bd<CR>", opts)

-- Navigate buffers
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<S-tab>", ":bprevious<CR>", opts)

-- Save
keymap("n", "<C-s>", ":w<CR>", opts)

-- Save and Quit
keymap("n", "<C-q>", ":wq!<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move Text
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

 -- VISUAL MODE --

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Zenmode --
keymap("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

-- Commenter --
keymap("n", "<leader>/", "<cmd>gcc<CR>", opts)

-- Nvim-Tree --
keymap ("n", "<leader><tab>", "<cmd>NvimTreeToggle<CR>", opts)
keymap ("n", "<leader><S>", "<cmd>NvimTreeFocus<CR", opts)

-- Telescope --

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
