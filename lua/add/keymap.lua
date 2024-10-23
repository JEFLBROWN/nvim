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

-- QOL enhancements
-- keymap("i", "kj", "<ESC><Right>", opts) -- Escape Chord
keymap("n", ";", ":", opts) -- Colon is Semi-Colon
keymap("v", ";", ":", opts)
keymap("n", "gf", ":edit <cfile><CR>", opts)		-- open non-existant files

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Split Windows
keymap("n", "<leader>v", "<C-w>v", opts)	-- Create a Vertical Split
keymap("n", "<M-Left>",":vertical resize +6<CR>", opts) -- Resize Vertical Split, make it wider
keymap("n", "<M-Right>" , ":vertical resize -4<CR>", opts) -- Resize Vertical Split, make it smaller
-- keymap("n", "<A-Up>" , ":resize +8<CR>", opts) -- Resize Horizontal Split, make it taller
-- keymap("n", "<A-Down>" , ":resize 2<CR>", opts) -- Resize Horizontal Split, make it shorter
keymap("n", "<leader>x", "<C-W>q", opts) -- Close Split window
keymap("n", "<C-j>", "<C-W>r <C-W>h", opts) -- swap splits and move cursor to the left split. 
keymap("n", "<C-l>", "<C-W>l", opts) -- Jump to the right Split
keymap("n", "<C-h>", "<C-W>h", opts) -- Jump to the Left Split	

-- buffers
keymap("n", "<C-w>", ":bd<CR>", opts) -- Close Buffer
keymap("n", "<tab>", ":bnext<CR>", opts) -- Next Buffer
keymap("n", "<BS>", ":bprevious<CR>", opts) -- Previous Buffer

-- QOL
keymap("n", "<C-s>", ":w<CR>", opts) -- Save Normal Mode
-- keymap("n", "<C-q>", ":wq!<CR>", opts) -- Save & Quit
-- keymap("n", "<C-a>", "ggVG", opts)	    	-- Select All

-- Cursor Movement
keymap("n", "<C-m>", "$", opts) -- move to the end of a line
keymap("v", "<C-m>", "$", opts)
keymap("x", "<C-m>", "$", opts)
keymap("n", "<C-n>", "1", opts) -- move to the beginning of the line
keymap("v", "<C-n>", "1", opts)
keymap("x", "<C-n>", "1", opts)

-- Zen
keymap("n", "<leader>z", ":ZenMode<CR>",opts)

-- Mini Files
keymap("n","-",":lua MiniFiles.open()<CR>",opts)
-- I want to use - to close  fminifiles as well

-- nvim tree
-- keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- ┌┬┐┌─┐┬  ┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐
--  │ ├┤ │  ├┤ └─┐│  │ │├─┘├┤ 
--  ┴ └─┘┴─┘└─┘└─┘└─┘└─┘┴  └─┘

keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>i", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts) -- finder with preview
keymap("n", "<leader>/", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<leader>s", "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<leader>m", "<cmd>lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown())<cr>", opts)

-- projects
keymap('n', '<C-p>',"<cmd>lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)

-- Undo
keymap("n", "<leader>u", "<cmd>Telescope undo<cr>", opts)

-- ┬ ┬┌─┐┬─┐┌─┐┌─┐┌─┐┌┐┌
-- ├─┤├─┤├┬┘├─┘│ ││ ││││
-- ┴ ┴┴ ┴┴└─┴  └─┘└─┘┘└┘

keymap ("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap ("n", "<C-m>", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts) -- Add mark
keymap ("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts) -- navigates to file 1
keymap ("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts) -- navigates to file 2
keymap ("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts) -- navigates to file 3
keymap ("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts) -- navigates to file 4
