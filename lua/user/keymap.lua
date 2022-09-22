--  ┬┌─┌─┐┬ ┬┌┬┐┌─┐┌─┐ 
--  ├┴┐├─ └┬┘│││├─┤├─┘ 
--  ┴ ┴└─┘ ┴ ┴ ┴┴ ┴┴  
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- Jump Between splits
keymap("n", "<silent> <C-h>", ":wincmd j<CR>", opts)
keymap("n", "<silent> <C-l>", ":wincmd k<CR>", opts)

-- Save
keymap("n", "<C-s>", ":w<CR>", opts)

-- Save and Quit
keymap("n", "<C-q>", ":wq!<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Line Movement
keymap('n', '<A-up>', ':m -2<CR>', opts)
keymap('n', '<A-down>', ':m +1<CR>', opts)
keymap('v', '<A-up>', ':m -2<CR>', opts)
keymap('v', '<A-down>', ':m +1<CR>', opts)
keymap('x', '<A-up>', ':m -2<CR>', opts)
keymap('x', '<A-down>', ':m +1<CR>', opts)

-- Zenmode --
keymap("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

-- Terminal --

-- Commenter --

-- Surround --

-- Nvim-Tree --
keymap ("n", "<leader><tab>", "<cmd>NvimTreeToggle<CR>", opts)
keymap ("n", "<leader>`", "<cmd>NvimTreeFocus<CR>", opts)

-- Telescope --

keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts) -- finder with preview
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>",opts)
