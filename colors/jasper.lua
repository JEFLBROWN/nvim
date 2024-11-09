-- Reset highlighting.
vim.cmd.highlight 'clear'
if vim.fn.exists 'syntax_on' then
    vim.cmd.syntax 'reset'
end
vim.o.termguicolors = true
vim.g.colors_name = 'jasper'

-- "background": "#183a37",
-- "foreground": "#dac8a7",
-- "cursorColor": "#dac8a7",
-- "black": "#121212",
-- "red": "#b4605d",
-- "green": "#7d8b6d",
-- "yellow": "#7A6F4D",
-- "blue": "#5a7a9f",
-- "purple": "#88789b",
-- "cyan": "#6b888d",
-- "white": "#dac8a7",
-- "brightBlack": "#2a2f36",
-- "brightRed": "#d57f7a",
-- "brightGreen": "#96aa83",
-- "brightYellow": "#c4a579",
-- "brightBlue": "#657fa9",
-- "brightPurple": "#9987b2",
-- "brightCyan": "#85a3aa",
-- "brightWhite": "#e4d6be"

-- Foggy Teal - #6a8483
-- Sage Teal - #547f7e
-- Stormy Sea - #4a6b6a
-- Blue Spruce - #3e5c5b
-- Muted Jade - #3a5c55
-- Pacific Teal - #335e5a
-- Dusky Teal - #26484a
-- Slate Teal - #2a3f3f
-- Evergreen - #1f3534
-- Deep Teal - #183a37
--
-- Pale Cyan - #a0d9d9
-- Sky Cyan - #8acccf
-- Dusty Cyan - #6fb7b8
-- Teal Cyan - #5aa6a7
-- Winter Cyan - #4e9494
-- Dark Aqua - #3a7f7f
-- Storm Cyan - #326a6b
-- Ocean Cyan - #295757
-- Seafoam Cyan - #204545
-- Deep Cyan - #183636


local colors = {
    bg = "#0F1112",
    fg = "#A8B7AC",
		black = "#644455",
		comment = "#5A6570",
		grey = "#A9ABAC",
		gutter_fg = "#4B5263",
		menu = "#21222C",
		nontext = "#3B4048",
		selection = "#3C4148",
		visual = "#3E4452",
		white = "#879794",
		bright_white = "#e4d6be",
		blue = "#326a6b",
		bright_blue = "#657fa9",
		cyan = "#6b888d",
		neon_cyan = "#00DFDF",
		bright_cyan = "#85a3aa",
		lavender = "#6272A4",
		transparent_blue = "#19272C",
		green = "#7d8b6d",
		bright_green = "#96aa83",
		transparent_green = "#22372c",
		red = "#9a5a4a",
		bright_red = "#d57f7a",
		orange = "#A63E26",
		transparent_red = "#342231",
		fuchsia = "#7B2358",
		lilac = "#6D5978",
		purple = "#88789b",
		bright_magenta = "#9987b2",
		pink = "#E48CC1",
		yellow = "#FEC406",
		bright_yellow = "#FEFF02",
		transparent_yellow = "#202624"
}

-- Terminal colors
vim.g.terminal_color_0 = colors.transparent_black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.purple
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.selection
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

-- Groups used for my statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs {
    Normal = 'purple',
    Pending = 'pink',
    Visual = 'yellow',
    Insert = 'green',
    Command = 'cyan',
    Other = 'orange',
} do
    statusline_groups['StatuslineMode' .. mode] = { fg = colors.transparent_black, bg = colors[color] }
    statusline_groups['StatuslineModeSeparator' .. mode] = { fg = colors[color], bg = colors.transparent_black }
end
statusline_groups = vim.tbl_extend('error', statusline_groups, {
    StatuslineItalic = { fg = colors.grey, bg = colors.transparent_black, italic = true },
    StatuslineSpinner = { fg = colors.bright_green, bg = colors.transparent_black, bold = true },
    StatuslineTitle = { fg = colors.bright_white, bg = colors.transparent_black, bold = true },
})

---@type table<string, vim.api.keyset.highlight>
local groups = vim.tbl_extend('error', statusline_groups, {
    -- Builtins.
    Boolean = { fg = colors.cyan },
    Character = { fg = colors.green },
    ColorColumn = { bg = colors.selection },
    Comment = { fg = colors.comment, italic = true },
    Conceal = { fg = colors.comment },
    Conditional = { fg = colors.pink },
    Constant = { fg = colors.yellow },
    CurSearch = { fg = colors.black, bg = colors.fuchsia },
    Cursor = { fg = colors.black, bg = colors.white },
    CursorColumn = { bg = colors.transparent_black },
    CursorLine = { bg = colors.transparent_yellow },
    CursorLineNr = { fg = colors.orange, bold = true },
    Define = { fg = colors.purple },
    Directory = { fg = colors.cyan },
    EndOfBuffer = { fg = colors.bg },
    Error = { fg = colors.bright_red },
    ErrorMsg = { fg = colors.bright_red },
    FoldColumn = {},
    Folded = { bg = colors.transparent_black },
    Function = { fg = colors.yellow },
    Identifier = { fg = colors.cyan },
    IncSearch = { link = 'CurSearch' },
    Include = { fg = colors.purple },
    Keyword = { fg = colors.cyan },
    Label = { fg = colors.cyan },
    LineNr = { fg = colors.gutter_fg },
    Macro = { fg = colors.purple },
    MatchParen = { sp = colors.fg, underline = true },
    NonText = { fg = colors.nontext },
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    Number = { fg = colors.orange },
    Pmenu = { fg = colors.white, bg = colors.transparent_blue },
    PmenuSbar = { bg = colors.transparent_blue },
    PmenuSel = { fg = colors.cyan, bg = colors.selection },
    PmenuThumb = { bg = colors.selection },
    PreCondit = { fg = colors.cyan },
    PreProc = { fg = colors.yellow },
    Question = { fg = colors.purple },
    Repeat = { fg = colors.pink },
    Search = { fg = colors.bg, bg = colors.black }, -- highlight color for selected text, in search or whatever
    SignColumn = { bg = colors.bg },
    Special = { fg = colors.green, italic = true },
    SpecialComment = { fg = colors.comment, italic = true },
    SpecialKey = { fg = colors.nontext },
    SpellBad = { sp = colors.bright_red, underline = true },
    SpellCap = { sp = colors.yellow, underline = true },
    SpellLocal = { sp = colors.yellow, underline = true },
    SpellRare = { sp = colors.yellow, underline = true },
    Statement = { fg = colors.purple },
    StatusLine = { fg = colors.white, bg = colors.bg },
    StorageClass = { fg = colors.pink },
    Structure = { fg = colors.yellow },
    Substitute = { fg = colors.fuchsia, bg = colors.orange, bold = true },
    Title = { fg = colors.cyan },
    Todo = { fg = colors.purple, bold = true, italic = true },
    Type = { fg = colors.cyan },
    TypeDef = { fg = colors.yellow },
    Underlined = { fg = colors.cyan, underline = true },
    VertSplit = { fg = colors.white },
    Visual = { bg = colors.visual },
    VisualNOS = { fg = colors.visual },
    WarningMsg = { fg = colors.yellow },
    WildMenu = { fg = colors.transparent_black, bg = colors.white },

    -- -- Treesitter.
    ['@annotation'] = { fg = colors.yellow },
    ['@attribute'] = { fg = colors.cyan },
    ['@boolean'] = { fg = colors.purple },
    ['@character'] = { fg = colors.green },
    ['@constant'] = { fg = colors.purple },
    ['@constant.builtin'] = { fg = colors.purple },
    ['@constant.macro'] = { fg = colors.cyan },
    ['@constructor'] = { fg = colors.cyan },
    ['@error'] = { fg = colors.bright_red },
    ['@function'] = { fg = colors.green },
    ['@function.builtin'] = { fg = colors.cyan },
    ['@function.macro'] = { fg = colors.green },
    ['@function.method'] = { fg = colors.green },
    ['@keyword'] = { fg = colors.pink },
    ['@keyword.conditional'] = { fg = colors.pink },
    ['@keyword.exception'] = { fg = colors.purple },
    ['@keyword.function'] = { fg = colors.cyan },
    ['@keyword.function.ruby'] = { fg = colors.pink },
    ['@keyword.include'] = { fg = colors.pink },
    ['@keyword.operator'] = { fg = colors.blue },
    ['@keyword.repeat'] = { fg = colors.pink },
    ['@label'] = { fg = colors.cyan },
    ['@markup'] = { fg = colors.nontext },
    ['@markup.emphasis'] = { fg = colors.yellow, italic = true },
    ['@markup.heading'] = { fg = colors.nontext, bold = true },
    ['@markup.link'] = { fg = colors.orange, bold = true },
    ['@markup.link.uri'] = { fg = colors.yellow, italic = true },
    ['@markup.list'] = { fg = colors.cyan },
    ['@markup.raw'] = { fg = colors.yellow },
    ['@markup.strong'] = { fg = colors.orange, bold = true },
    ['@markup.underline'] = { fg = colors.orange },
    ['@module'] = { fg = colors.orange },
    ['@number'] = { fg = colors.purple },
    ['@number.float'] = { fg = colors.green },
    ['@operator'] = { fg = colors.blue },
    ['@parameter.reference'] = { fg = colors.orange },
    ['@property'] = { fg = colors.blue },
    ['@punctuation.bracket'] = { fg = colors.fg },
    ['@punctuation.delimiter'] = { fg = colors.fg },
    ['@string'] = { fg = colors.cyan },
    ['@string.escape'] = { fg = colors.cyan },
    ['@string.regexp'] = { fg = colors.bright_red },
    ['@string.special.symbol'] = { fg = colors.purple },
    ['@structure'] = { fg = colors.purple },
    ['@tag'] = { fg = colors.cyan },
    ['@tag.attribute'] = { fg = colors.green },
    ['@tag.delimiter'] = { fg = colors.cyan },
    ['@type'] = { fg = colors.bright_cyan },
    ['@type.builtin'] = { fg = colors.cyan, italic = true },
    ['@type.qualifier'] = { fg = colors.pink },
    ['@variable'] = { fg = colors.cyan },
    ['@variable.builtin'] = { fg = colors.purple },
    ['@variable.member'] = { fg = colors.green },
    ['@variable.parameter'] = { fg = colors.orange },

    -- Semantic tokens.
    ['@class'] = { fg = colors.cyan },
    ['@decorator'] = { fg = colors.cyan },
    ['@enum'] = { fg = colors.cyan },
    ['@enumMember'] = { fg = colors.purple },
    ['@event'] = { fg = colors.cyan },
    ['@interface'] = { fg = colors.cyan },
    ['@lsp.type.class'] = { fg = colors.cyan },
    ['@lsp.type.decorator'] = { fg = colors.green },
    ['@lsp.type.enum'] = { fg = colors.cyan },
    ['@lsp.type.enumMember'] = { fg = colors.purple },
    ['@lsp.type.function'] = { fg = colors.green },
    ['@lsp.type.interface'] = { fg = colors.cyan },
    ['@lsp.type.macro'] = { fg = colors.cyan },
    ['@lsp.type.method'] = { fg = colors.green },
    ['@lsp.type.namespace'] = { fg = colors.orange },
    ['@lsp.type.partransparent_yellow'] = { fg = colors.orange },
    ['@lsp.type.property'] = { fg = colors.blue },
    ['@lsp.type.struct'] = { fg = colors.cyan },
    ['@lsp.type.type'] = { fg = colors.bright_cyan },
    ['@lsp.type.variable'] = { fg = colors.fg },
    ['@modifier'] = { fg = colors.cyan },
    ['@regexp'] = { fg = colors.yellow },
    ['@struct'] = { fg = colors.cyan },
    ['@typeParameter'] = { fg = colors.cyan },

    -- Package manager.
    LazyDimmed = { fg = colors.grey },

    -- LSP.
    DiagnosticDeprecated = { strikethrough = true, fg = colors.fg },
    DiagnosticError = { fg = colors.red },
    DiagnosticFloatingError = { fg = colors.red },
    DiagnosticFloatingHint = { fg = colors.cyan },
    DiagnosticFloatingInfo = { fg = colors.cyan },
    DiagnosticFloatingWarn = { fg = colors.yellow },
    DiagnosticHint = { fg = colors.cyan },
    DiagnosticInfo = { fg = colors.cyan },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnnecessary = { fg = colors.grey, italic = true },
    DiagnosticVirtualTextError = { fg = colors.red, bg = colors.transparent_red },
    DiagnosticVirtualTextHint = { fg = colors.cyan, bg = colors.transparent_blue },
    DiagnosticVirtualTextInfo = { fg = colors.cyan, bg = colors.transparent_blue },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.transparent_yellow },
    DiagnosticWarn = { fg = colors.yellow },
    LspCodeLens = { fg = colors.cyan },
    LspFloatWinBorder = { fg = colors.comment },
    LspInlayHint = { fg = colors.lavender, italic = true },
    LspReferenceRead = { bg = colors.transparent_blue },
    LspReferenceText = {},
    LspReferenceWrite = { bg = colors.transparent_red },
    LspSignatureActiveParameter = { bold = true, underline = true, sp = colors.fg },

    -- Completions.
    CmpItemAbbrDeprecated = { link = 'DiagnosticDeprecated' },
    CmpItemAbbrMatch = { fg = colors.cyan, bg = 'NONE' },
    CmpItemKind = { bg = 'NONE' },
    CmpItemKindClass = { link = '@type' },
    CmpItemKindColor = { link = 'DevIconCss' },
    CmpItemKindConstant = { link = '@constant' },
    CmpItemKindConstructor = { link = '@type' },
    CmpItemKindEnum = { link = '@variable.member' },
    CmpItemKindEnumMember = { link = '@variable.member' },
    CmpItemKindEvent = { link = '@constant' },
    CmpItemKindField = { link = '@variable.member' },
    CmpItemKindFile = { link = 'Directory' },
    CmpItemKindFolder = { link = 'Directory' },
    CmpItemKindFunction = { link = '@function' },
    CmpItemKindInterface = { link = '@type' },
    CmpItemKindKeyword = { link = '@keyword' },
    CmpItemKindMethod = { link = '@function.method' },
    CmpItemKindModule = { link = '@module' },
    CmpItemKindOperator = { link = '@operator' },
    CmpItemKindProperty = { link = '@property' },
    CmpItemKindReference = { link = '@parameter.reference' },
    CmpItemKindSnippet = { link = '@markup' },
    CmpItemKindStruct = { link = '@structure' },
    CmpItemKindText = { link = '@markup' },
    CmpItemKindTypeParameter = { link = '@variable.parameter' },
    CmpItemKindUnit = { link = '@variable.member' },
    CmpItemKindValue = { link = '@variable.member' },
    CmpItemKindVariable = { link = '@variable' },
    CmpItemMenu = { fg = colors.grey },

    -- Dap UI.
    -- DapStoppedLine = { default = true, link = 'Visual' },
    -- DapUIBreakpointsCurrentLine = { fg = colors.bright_green, bold = true },
    -- DapUIBreakpointsInfo = { fg = colors.bright_green },
    -- DapUIBreakpointsPath = { fg = colors.bright_cyan },
    -- DapUIDecoration = { fg = colors.bright_cyan },
    -- DapUIFloatBorder = { fg = colors.bright_cyan },
    -- DapUILineNumber = { fg = colors.bright_cyan },
    -- DapUIModifiedValue = { fg = colors.bright_cyan, bold = true },
    -- DapUIPlayPause = { fg = colors.bright_green },
    -- DapUIRestart = { fg = colors.green },
    -- DapUIScope = { fg = colors.bright_cyan },
    -- DapUISource = { fg = colors.bright_blue },
    -- DapUIStepBack = { fg = colors.cyan },
    -- DapUIStepInto = { fg = colors.cyan },
    -- DapUIStepOut = { fg = colors.cyan },
    -- DapUIStepOver = { fg = colors.cyan },
    -- DapUIStop = { fg = colors.red },
    -- DapUIStoppedThread = { fg = colors.bright_cyan },
    -- DapUIThread = { fg = colors.bright_green },
    -- DapUIType = { fg = colors.bright_blue },
    -- DapUIWatchesEmpty = { fg = colors.pink },
    -- DapUIWatchesError = { fg = colors.pink },
    -- DapUIWatchesValue = { fg = colors.bright_green },
    -- DapUIWinSelect = { fg = colors.bright_cyan, bold = true },
    -- NvimDapVirtualText = { fg = colors.lavender, underline = true },

    -- Diffs.
    DiffAdd = { fg = colors.green, bg = colors.transparent_green },
    DiffChange = { fg = colors.yellow, bg = colors.transparent_yellow },
    DiffDelete = { fg = colors.red, bg = colors.transparent_red },
    DiffText = { fg = colors.bright_white, bg = colors.transparent_black },
    diffAdded = { fg = colors.bright_green, bold = true },
    diffChanged = { fg = colors.bright_yellow, bold = true },
    diffRemoved = { fg = colors.bright_red, bold = true },

    -- Command line.
    MoreMsg = { fg = colors.bright_white, bold = true },
    MsgArea = { fg = colors.cyan },
    MsgSeparator = { fg = colors.lilac },

    -- Winbar styling.
    WinBar = { fg = colors.fg, bg = colors.bg },
    WinBarDir = { fg = colors.bright_magenta, bg = colors.transparent_black, italic = true },
    WinBarNC = { bg = colors.transparent_black },
    WinBarSeparator = { fg = colors.green, bg = colors.transparent_black },

    -- Quickfix window.
    QuickFixLine = { italic = true, bg = colors.transparent_red },

    -- Gitsigns.
    GitSignsAdd = { fg = colors.bright_green },
    GitSignsChange = { fg = colors.cyan },
    GitSignsDelete = { fg = colors.bright_red },
    GitSignsStagedAdd = { fg = colors.orange },
    GitSignsStagedChange = { fg = colors.orange },
    GitSignsStagedDelete = { fg = colors.orange },

    -- Bufferline.
    BufferLineBufferSelected = { bg = colors.bg, underline = true, sp = colors.purple },
    BufferLineFill = { bg = colors.bg },
    TabLine = { fg = colors.comment, bg = colors.bg },
    TabLineFill = { bg = colors.bg },
    TabLineSel = { bg = colors.purple },

    -- When triggering flash, use a white font and make everything in the backdrop italic.
    -- FlashBackdrop = { italic = true },
    -- FlashPrompt = { link = 'Normal' },

    -- Make these titles more visible.
    MiniClueTitle = { bold = true, fg = colors.cyan },
    MiniFilesTitleFocused = { bold = true, fg = colors.cyan },

    -- Nicer yanky highlights.
    YankyPut = { link = 'Visual' },
    YankyYanked = { link = 'Visual' },

    -- Highlight for the Treesitter sticky context.
    TreesitterContextBottom = { underline = true, sp = colors.lilac },

    -- Fzf overrides.
    FzfLuaBorder = { fg = colors.comment },
    FzfLuaHeaderBind = { fg = colors.lavender },
    FzfLuaHeaderText = { fg = colors.pink },
    FzfLuaLiveSym = { fg = colors.fuchsia },
    FzfLuaPreviewTitle = { fg = colors.fg },
    FzfLuaSearch = { bg = colors.transparent_red },

    -- TODOs and notes.
    MiniHipatternsHack = { fg = colors.bg, bg = colors.orange, bold = true },
    MiniHipatternsNote = { fg = colors.bg, bg = colors.bright_green, bold = true },
    MiniHipatternsTodo = { fg = colors.bg, bg = colors.cyan, bold = true },

    -- Notifications.
    MiniNotifyBorder = { fg = colors.comment },

    -- Overseeer.
    OverseerComponent = { link = '@keyword' },

    -- Links.
    HighlightUrl = { underline = true, fg = colors.neon_cyan, sp = colors.neon_cyan },
})

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
