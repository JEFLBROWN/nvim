-- Tiger Iron

-- Jasper Color Scheme for Neovim
vim.opt.termguicolors = true

-- Background and foreground colors
vim.api.nvim_set_hl(0, "Normal", { bg = "#121212", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#a89a80" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c4a579" })

-- Basic groups
vim.api.nvim_set_hl(0, "Comment", { fg = "#3a3f46", italic = true })          -- Muted purple for comments
vim.api.nvim_set_hl(0, "Constant", { fg = "#a48f6d" })                        -- Earthy yellow for constants
vim.api.nvim_set_hl(0, "String", { fg = "#d2b27e" })                          -- Warm amber for strings
vim.api.nvim_set_hl(0, "Identifier", { fg = "#dac8a7" })                      -- Cream for identifiers
vim.api.nvim_set_hl(0, "Statement", { fg = "#b4605d" })                       -- Red for statements
vim.api.nvim_set_hl(0, "Keyword", { fg = "#c4a579" })                         -- Golden yellow for keywords
vim.api.nvim_set_hl(0, "Function", { fg = "#d57f7a" })                        -- Brighter red for functions
vim.api.nvim_set_hl(0, "Type", { fg = "#9987b2" })                            -- Softer purple for types
vim.api.nvim_set_hl(0, "Special", { fg = "#85a3aa" })                         -- Muted cyan for special items

-- UI groups
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#121212", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#18191F", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2a2f36" })
vim.api.nvim_set_hl(0, "Search", { bg = "#66583e", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "incsearch", { bg = "#826f4e", fg = "#dac8a7" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })                          -- Highlighted selection

-- Modes

vim.api.nvim_set_hl(0, "visual", { bg = "#2a2f36" })                          -- Highlighted selection

-- Diagnostics
vim.api.nvim_set_hl(0, "error", { fg = "#d57f7a" })
vim.api.nvim_set_hl(0, "warningmsg", { fg = "#c4a579" })
vim.api.nvim_set_hl(0, "Todo", { bg = "#2a2f36", fg = "#e4d6be", bold = true })

-- Diff highlighting
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1e2e1e", fg = "#96aa83" })         -- Green for added lines
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2a2f36", fg = "#6b888d" })      -- Cyan for changed lines
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3a1f1f", fg = "#b4605d" })      -- Red for deleted lines
vim.api.nvim_set_hl(0, "DiffText", { bg = "#3a3f46", fg = "#dac8a7", bold = true })

-- Additional highlight groups
vim.api.nvim_set_hl(0, "Title", { fg = "#d57f7a", bold = true })
vim.api.nvim_set_hl(0, "Directory", { fg = "#85a3aa" })
vim.api.nvim_set_hl(0, "Warning", { fg = "#c4a579", bold = true })
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#dac8a7", bg = "#2a2f36", bold = true })
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#d57f7a" })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#c4a579" })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "#85a3aa" })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "#9987b2" })

-- -- LSP
-- ---@lsp.type.variable.lua links to @variable priority: 125
-- ---@lsp.mod.global.lua links to @lsp priority: 126
-- ---@lsp.typemod.variable.global.lua links to @lsp priority: 127


-- {
--     "name": "Jasper",
--     "background": "#121212",
--     "foreground": "#dac8a7",
--     "cursorColor": "#dac8a7",
--     "black": "#121212",
--     "red": "#b4605d",
--     "green": "#7d8b6d",
--     "yellow": "#a48f6d",
--     "blue": "#5a7a9f",
--     "purple": "#88789b",
--     "cyan": "#6b888d",
--     "white": "#dac8a7",
--     "brightBlack": "#2a2f36",
--     "brightRed": "#d57f7a",
--     "brightGreen": "#96aa83",
--     "brightYellow": "#c4a579",
--     "brightBlue": "#657fa9",
--     "brightPurple": "#9987b2",
--     "brightCyan": "#85a3aa",
--     "brightWhite": "#e4d6be"
-- }
