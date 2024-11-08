-- Emberstone AA Compliant Theme for Neovim
vim.opt.termguicolors = true

-- Background and foreground
vim.api.nvim_set_hl(0, "Normal", { bg = "#0F1112", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#a89a80" })

-- Syntax highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = "#88789b", italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = "#a48f6d" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "Statement", { fg = "#b4605d" })
vim.api.nvim_set_hl(0, "Keyword", { fg = "#c4a579" })
vim.api.nvim_set_hl(0, "String", { fg = "#c4a579" })


-- Functions and types
vim.api.nvim_set_hl(0, "Function", { fg = "#d57f7a" })
vim.api.nvim_set_hl(0, "Type", { fg = "#9987b2" })
vim.api.nvim_set_hl(0, "Special", { fg = "#85a3aa" })

-- UI elements
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#0F1112", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c4a579" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2a2f36" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#18191F", fg = "#dac8a7" })

-- Highlights and search
vim.api.nvim_set_hl(0, "Search", { bg = "#66583e", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#826f4e", fg = "#ffffff" })

-- Diagnostics and errors
vim.api.nvim_set_hl(0, "Error", { fg = "#d57f7a" })
vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#c4a579" })
vim.api.nvim_set_hl(0, "Todo", { bg = "#2a2f36", fg = "#e4d6be", bold = true })
