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

-- swap splits, and move the cursor in the left split. this is actually all I'd use, because I think splitting once is enough, so Ikeep the split on the right for reference, and then just move it over to my working LEFT split. Im such a damn genius.
keymap("n", "<C-j>", "<C-W>r <C-W>h", opts)
-- jump window right
keymap("n", "<C-l>", "<C-W>l", opts)
-- jump window left
keymap("n", "<C-h>", "<C-W>h", opts)	


-- close buffer
keymap("n", "<leader>w", ":bd<CR>", opts)

-- Navigate buffers
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<BS>", ":bprevious<CR>", opts)

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

-- Hop --
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
-- Surround --

-- Nvim-Tree --
keymap ("n", "<leader><tab>", "<cmd>NvimTreeToggle<CR>", opts)
keymap ("n", "<leader>`", "<cmd>NvimTreeFocus<CR>", opts)


-- Harpoon --
keymap ("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
-- add a harpoon mark
keymap ("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)


-- Telescope --
keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts) -- finder with preview
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown())<cr>", opts)

