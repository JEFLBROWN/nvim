-- ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
-- │ │├─┘ │ ││ ││││└─┐
-- └─┘┴   ┴ ┴└─┘┘└┘└─┘

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
 local o = vim.opt

o.encoding = "utf-8"								-- encoding displayed
o.clipboard = "unnamedplus"					-- Copy and Paste in/out of Nvim
o.mouse = "a"												-- enables the mouse
o.splitbelow = true									-- horizontal splits always appear below current buffer
o.splitright = true									-- vertical	splits always appear to the right
o.tabstop = 2												-- insert 2 spaces for a tab
o.shiftwidth = 2										-- insert 2	spaces for Indent
o.smarttab = true										-- Makes tabbing better, will realize you have 2 vs 4
o.smartindent = true								-- Makes indenting better
o.autoindent = true									-- Good autoindent
o.laststatus = 2										-- always display status line
o.showtabline = 0										-- Show/Hide Tabs(buffers)
o.updatetime = 300									-- faster completion
o.timeoutlen = 500									-- time to wait for a mapped sequence to complete (in milliseconds)
o.listchars = "trail:·"							-- places these glyphs on tabs and trailing spaces
o.scrolloff = 8											-- padding so	you dont have to go all the way to the bottom to scroll the page
o.sidescrolloff = 8									-- same as above, but with horizontal scrolling
o.termguicolors = true							-- nvim	has its own colorscheme
o.showmode = false									-- hide the	mode 
o.cursorline = true									-- highlight cursor line
o.number = true											-- show	line numbers
o.signcolumn = "yes"								-- always show sign column so it doesnt shift
o.fillchars:append { eob = " " }    -- remove tilde ~
o.relativenumber = true

-- ┌─┐┌┬┐┬ ┬┬  ┌─┐┌─┐
-- └─┐ │ └┬┘│  ├─ └─┐
-- └─┘ ┴  ┴ ┴─┘└─┘└─┘

vim.cmd [[colorscheme rose-pine]] -- set colorscheme
-- vim.cmd [[colorscheme mellow]] -- set colorscheme

-- these are styles that are wrapped in legacy VimL, Lua doesn't have an equivilant command yet, so the vim.cmd[[]] allows you to use the old code in the lua file

-- Italic Comments
vim.cmd[[highlight Comment cterm=italic gui=italic]]
vim.cmd[[highlight Comment ctermfg=darkgray ctermbg=none]]

-- Vertical split column has no background, looks cleaner 
vim.cmd[[highlight VertSplit cterm=none]]

vim.cmd[[hi! link EndOfBuffer Ignore]]

-- hide the ~ by making it the same color as the bkg
-- vim.cmd[[hi! EndOfBuffer ctermfg=black ctermfg=black guiblack=black guifg=black]]

-- these hide the bottom command line
-- vim.cmd[[vim.o.ls = 0]]
-- vim.cmd[[vim.o.ch = 0]]
