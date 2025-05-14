--  ┬┌─┌─┐┬ ┬┌┬┐┌─┐┌─┐ 
--  ├┴┐├─ └┬┘│││├─┤├─┘ 
--  ┴ ┴└─┘ ┴ ┴ ┴┴ ┴┴  

local opts = { noremap = true, silent = true } -- lua expects this table at the end of the keymap, so lets shorten it.
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap  				-- Shorten function name

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<Space>", "<Nop>", opts)												--Remap space as leader key

keymap("n", ";", ":", opts)																	-- Colon is Semi-Colon in normal mode
keymap("v", ";", ":", opts)																	-- Colon is Semi-Colon in visual mode
keymap("n", "gf", ":edit <cfile><CR>", opts)								-- open non-existant files in new buffer.
keymap("v", "<", "<gv", opts)																-- Stay in indent mode
keymap("v", ">", ">gv", opts)																-- Stay in indent mode
keymap('n', "B", "<C-q>", opts) 														-- Better Visual Block keybind 
keymap('n', "<leader>i", ":Inspect<CR>", opts)


-- Jump to next/prevous LSP diagnostic
keymap("n", "]g", "vim.diagnostic.goto_next", opts)
keymap("n", "[g", "vim.diagnostic.goto_prev" , opts) --TODO go to next and previous LSP diagnostic
-- Create new file
--:new will create a split window with an unnamed buffer.
--:enew will open one in the current window.
--:vnew will open one in a vertically split window.
--:tabnew will open one in a new tab.

-- Split Windows
keymap("n", "<leader>v","<C-w>v", opts)											-- Open a new Vertical Split
keymap("n", "<M-Left>",":vertical resize +9<CR>", opts)			-- Resize Vertical Split, make it wider
keymap("n", "<M-Right>",":vertical resize -1<CR>", opts)		-- Resize Vertical Split, make it smaller
keymap("n", "<A-Up>",":resize +9<CR>", opts)								-- Resize Horizontal Split, make it taller
keymap("n", "<A-Down>",":resize -1<CR>", opts)							-- Resize Horizontal Split, make it shorter
keymap("n", "<leader>w","<C-W>q", opts)											-- Close Split window
keymap("n", "<C-j>","<C-W>r <C-W>h", opts)									-- swap splits and move cursor to the left split. 
keymap("n", "<C-l>","<C-W>l", opts)													-- Jump to the right Split
keymap("n", "<C-h>","<C-W>h", opts)													-- Jump to the Left Split	
keymap("n", "<leader>V","<C-w>t<C-w>H", opts)								-- Horizontal -> Vertical Split Switch
-- TODO add functionality for the rare horizontal split

-- buffers
-- keymap("n", "<leader>bd", ":bd<CR>", opts)								-- Close Buffer *this didn't feel good to type, use :bd instead
keymap("n", "<tab>", ":bnext<CR>", opts)										-- Next Buffer
keymap("n", "<BS>", ":bprevious<CR>", opts)									-- Previous Buffer

keymap("n", "<C-s>", ":w<CR>", opts)												-- Save Normal Mode
keymap("n", "<C-a>", "ggVG", opts)													-- Select All
-- keymap("n", "<C-q>", ":wq!<CR>", opts)										-- Save & Quit

keymap("n", "<leader>z", ":ZenMode<CR>",opts) 							-- Zen

keymap("n","-",":lua MiniFiles.open()<CR>",opts)						-- Mini Files

---------------------------------------------------
-- Telescope
---------------------------------------------------

-- projects
keymap("n", "<leader>/", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>", opts)
-- keymap("n", "<leader>i", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts) -- finder with preview
keymap("n", "<leader>m", "<cmd>lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown())<cr>", opts)
keymap('n', '<C-p>',"<cmd>lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)

---------------------------------------------------
-- Harpoon
---------------------------------------------------
keymap ("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap ("n", "<C-m>", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts) -- Add mark
keymap ("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts) -- navigates to file 1
keymap ("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts) -- navigates to file 2
keymap ("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts) -- navigates to file 3
keymap ("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts) -- navigates to file 4
