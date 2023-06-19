--  ┬┌─┌─┐┬ ┬┌┬┐┌─┐┌─┐ 
--  ├┴┐├─ └┬┘│││├─┤├─┘ 
--  ┴ ┴└─┘ ┴ ┴ ┴┴ ┴┴  

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap  				-- Shorten function name

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ┌─┐┌┐┌┬ ┬┌─┐┌┐┌┌─┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
-- ├┤ │││├─┤├─┤││││  ├┤ │││├┤ │││ │ └─┐
-- └─┘┘└┘┴ ┴┴ ┴┘└┘└─┘└─┘┴ ┴└─┘┘└┘ ┴ └─┘

keymap("i", "kj", "<ESC>", opts) -- Escape Chord
keymap("n", ";", ":", opts) -- Colon is Semi-Colon
keymap("v", ";", ":", opts)
-- keymap("n", "gf", ":edit <cfile><CR>", opts)		-- open non-existant files

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ┌─┐┌─┐┬  ┬┌┬┐┌─┐
-- └─┐├─┘│  │ │ └─┐
-- └─┘┴  ┴─┘┴ ┴ └─┘

keymap("n", "<leader>v", "<C-w>v", opts)				-- Create a Vertical Split
keymap("n", "<A-Left>", ":vertical resize +3<CR>", opts) -- Resize Vertical Split, make it wider
keymap("n", "<A-Right>" , ":vertical resize -3<CR>", opts) -- Resize Vertical Split, make it smaller
-- keymap("n", "<A-Up>" , ":resize +3<CR>", opts) -- Resize Horizontal Split, make it taller
-- keymap("n", "<A-Down>" , ":resize -3<CR>", opts) -- Resize Horizontal Split, make it shorter
keymap("n", "<leader>x", "<C-W>q", opts) -- Close Split window
keymap("n", "<C-j>", "<C-W>r <C-W>h", opts) -- swap splits and move cursor to the left split. 
keymap("n", "<C-l>", "<C-W>l", opts) -- Jump to the right Split
keymap("n", "<C-h>", "<C-W>h", opts) -- Jump to the Left Split	
-- Jump Between splits
-- keymap("n", "<silent> <C-h>", ":wincmd j<CR>", opts)
-- keymap("n", "<silent> <C-l>", ":wincmd k<CR>", opts)

-- ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐┌─┐
-- ├┴┐│ │├┤ ├┤ ├┤ ├┬┘└─┐
-- └─┘└─┘└  └  └─┘┴└─└─┘

keymap("n", "<leader>w", ":bd<CR>", opts) -- Close Buffer
keymap("n", "<tab>", ":bnext<CR>", opts) -- Next Buffer
keymap("n", "<BS>", ":bprevious<CR>", opts) -- Previous Buffer

keymap("n", "<C-s>", ":w<CR>", opts) -- Save Normal Mode
keymap("i", "<C-s>", ":w<CR>", opts) -- Save Insert mode
keymap("n", "<C-q>", ":wq!<CR>", opts) -- Save & Quit
keymap("n", "<leader>a", "ggVG", opts)	    	-- Select All

-- ┌┬┐┌─┐┬  ┬┌─┐┌┬┐┌─┐┌┐┌┌┬┐
-- ││││ │└┐┌┘├┤ │││├┤ │││ │ 
-- ┴ ┴└─┘ └┘ └─┘┴ ┴└─┘┘└┘ ┴ 

-- Line Movement
keymap('n', '<C-.', '$', opts) -- move to the end of a line
keymap('v', '<C-.', '$', opts)
keymap('x', '<C-.', '$', opts)
keymap('n', '<C-,>', '0', opts) -- move to the beginning of the line
keymap('v', '<C-,>', '0', opts)
keymap('x', '<C-,>', '0', opts)

-- Normal-mode commands
keymap('n', '<A-Up>'    ,':MoveLine -1<CR>', opts)
keymap('n', '<A-Right>' ,':MoveHChar 1<CR>', opts)
keymap('n', '<A-Down>'  ,':MoveLine 1<CR>', opts)
keymap('n', '<A-Left>'  ,':MoveHChar -1<CR>', opts)

-- Visual-mode commands
keymap('x', '<A-Down>' , ':MoveBlock 1<CR>', opts)
keymap('x', '<A-Up>'   , ':MoveBlock -1<CR>', opts)
keymap('v', '<A-Left>' , ':MoveHBlock -1<CR>', opts)
keymap('v', '<A-Right>', ':MoveHBlock 1<CR>', opts)

-- ┌─┐┌─┐┌┐┌
-- ┌─┘├┤ │││
-- └─┘└─┘┘└┘

keymap("n", "<leader>zm", ":ZenMode<CR>", {})

-- Hop --
keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- Nvim-Tree --
keymap ("n", "<leader><tab>", "<cmd>NvimTreeToggle<CR>", opts)
keymap ("n", "<leader>`", "<cmd>NvimTreeFocus<CR>", opts)

-- ┌┬┐┌─┐┬  ┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐
--  │ ├┤ │  ├┤ └─┐│  │ │├─┘├┤ 
--  ┴ └─┘┴─┘└─┘└─┘└─┘└─┘┴  └─┘

keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts) -- finder with preview
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown())<cr>", opts)

-- Harpoon --
keymap ("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
-- add a harpoon mark
keymap ("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
