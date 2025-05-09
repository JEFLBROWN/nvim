local statusline_augroup = vim.api.nvim_create_augroup("native_statusline", { clear = true })
local M = {}

local function get_highlight_color(hl_group, color_type) -- this is a general color function, gets the foreground and background
  local hl = vim.api.nvim_get_hl(0, { name = hl_group })
  return hl[color_type] and string.format("#%06x", hl[color_type]) or nil --The "#%06x" format in the code is a string format specifier that converts a number to a six-digit hexadecimal color code, prefixed with #.
end

-------------------------------
--- Modes
-------------------------------
-- Note that: \19 = ^S and \22 = ^V.
-- Define mode names
local modes = {
  ['n']      = 'NO', -- Normal
  ['no']     = 'OP', -- OP-Pending
  ['nov']    = 'OC', -- OP-Pending
  ['noV']    = 'OL', -- OP-Pending
  ['no\x16'] = 'OB', -- OP-Pending
  ['\x16']   = 'VB', -- 
  ['niI']    = 'IN', -- Normal
  ['niR']    = 'RE', -- Normal
  ['niV']    = 'RV', -- Normal
  ['nt']     = 'NT', -- Normal
  ['ntT']    = 'TM', -- Normal
  ['v']      = 'VI', -- Visual
  ['vs']     = 'VI', -- Visual
  ['V']      = 'VL', -- Visual
  ['Vs']     = 'VL', -- Visual
  ['\x16s']  = 'VB', -- Visual 
  ['s']      = 'SE', -- Select
  ['S']      = 'SL', -- Select
  ['\x13']   = 'SB', -- 
  ['i']      = 'IN', -- Insert
  ['ic']     = 'IC', -- Insert
  ['ix']     = 'IX', -- Insert
  ['R']      = 'RE', -- Replace
  ['Rc']     = 'RC', -- Replace
  ['Rx']     = 'RX', -- Replace
  ['Rv']     = 'RV', -- Virt Replace
  ['Rvc']    = 'RC', -- Virt Replace
  ['Rvx']    = 'RX', -- Virt Replace
  ['c']      = 'CM', -- Command
  ['cv']     = 'CV', -- Vim Ex
  ['r']      = 'PR', -- Prompt
  ['rm']     = 'PM', -- More
  ['r?']     = 'P?', -- Confirm
  ['!']      = '$_', -- Shell
  ['t']      = '>_', -- Terminal
}

--- Function to get mode with built-in highlights
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLine#"  -- Default highlight

  if current_mode == "n" then
    mode_color = "%#StatusLine#"           -- Normal mode "%#HighlightColor"
  elseif current_mode == "i" then
    mode_color = "%#StatusLineNC#"         -- Insert mode (use StatusLineNC for contrast)
  elseif current_mode == "v" or current_mode == "V" or current_mode == "^V" then
    mode_color = "%#Visual#"               -- Visual mode
  elseif current_mode == "R" then
    mode_color = "%#DiffAdd#"              -- Replace mode (use DiffAdd as a placeholder)
  elseif current_mode == "c" then
    mode_color = "%#IncSearch#"            -- Command mode
  end

  -- Return the mode string with its color, then reset the highlight to StatusLine
  return string.format("%s %s %%#StatusLine#", mode_color, modes[current_mode] or "??"):upper()
end

-------------------------------
--- Filetype
-------------------------------

--- @return string
local function filetype_icon()
  local filetype = vim.bo.filetype
  if filetype == "" then
    return ""
  end

  -- Retrieve the icon for the current file type from mini-icons
  local icon = require('mini.icons').get_icon(filetype)  -- Adjust based on mini-icons' API

  -- Fallback to filetype name if icon is not found
  return icon or filetype
end

--- @return string
local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end

  -- Concatenate the icon and filename for display
  return filetype_icon() .. " " .. fname .. " "
end

--- @return string
local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  return fname .. " "
end


--- @param type string
--- @return integer
local function get_git_diff(type)
  local gsd = vim.b.gitsigns_status_dict
  if gsd and gsd[type] then
    return gsd[type]
  end
  return 0
end

-------------------------------
--- Git
-------------------------------

-- Function to set custom Git status highlights using default highlight groups
local function set_git_status_highlights()
  local statusline_bg = get_highlight_color("StatusLine", "bg") -- Background from StatusLine
  local add_fg = get_highlight_color("String", "fg")       -- Greenish color from String
  local change_fg = get_highlight_color("LineNr", "fg") -- Yellowish color from diff.delta
  local delete_fg = get_highlight_color("DiffRemoved", "fg")      -- Reddish color from DiffDelete
  local branch_fg = get_highlight_color("Whitespace", "fg") -- Background from StatusLine
  local icon_fg = get_highlight_color("Whitespace", "fg") -- Background from StatusLine

  -- Define new highlight groups with custom foreground and StatusLine background
  vim.api.nvim_set_hl(0, "GitStatusAdd", { fg = add_fg, bg = statusline_bg })
  vim.api.nvim_set_hl(0, "GitStatusChange", { fg = change_fg, bg = statusline_bg })
  vim.api.nvim_set_hl(0, "GitStatusDelete", { fg = delete_fg, bg = statusline_bg })
  vim.api.nvim_set_hl(0, "GitBranch", { fg = branch_fg, bg = statusline_bg })
  vim.api.nvim_set_hl(0, "GitIcon", { fg = icon_fg, bg = statusline_bg })
end

-- Call this function once to set up the highlight groups
set_git_status_highlights()

-- Functions for Git status indicators in the statusline

--- @return string
local function git_diff_added()
  local added = get_git_diff("added")
  if added > 0 then
    return string.format("%%#GitStatusAdd#%s%%*•", added)
  end
  return ""
end

--- @return string
local function git_diff_changed()
  local changed = get_git_diff("changed")
  if changed > 0 then
    return string.format("%%#GitStatusChange#%s%%*•", changed)
  end
  return ""
end

--- @return string
local function git_diff_removed()
  local removed = get_git_diff("removed")
  if removed > 0 then
    return string.format("%%#GitStatusDelete#%s%%*", removed)
  end
  return ""
end

--- @return string
local function git_branch_icon()
  return "%#GitIcon#%*"  -- Neutral color for icon using StatusLine
end

--- @return string
local function git_branch()
  local branch = vim.b.gitsigns_head
  if branch == "" or branch == nil then
    return ""
  end
  return string.format("%%#GitBranch#%s%%*",branch)  --  color for branch name
end

--- @return string
local function full_git()
  local full = ""
  local space = "%#StatusLine# %*"  -- Neutral space with StatusLine color

  local branch = git_branch()
  if branch ~= "" then
    local icon = git_branch_icon()
    full = full .. space .. icon .. space .. branch .. space
  end

  local added = git_diff_added()
  if added ~= "" then
    full = full .. added .. space
  end

  local changed = git_diff_changed()
  if changed ~= "" then
    full = full .. changed .. space
  end

  local removed = git_diff_removed()
  if removed ~= "" then
    -- full = full .. removed .. space
    full = full .. removed
  end

  return full
end

-------------------------------
--- LSP
-------------------------------

local function lsp_clients()
  local current_buf = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients({ bufnr = current_buf })
  if next(clients) == nil then
    return " %#StatusLine#% "
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return " " .. table.concat(c, "•")
end

--- @param severity integer
---@return integer
local function get_lsp_diagnostics_count(severity)
  if not rawget(vim, "lsp") then
    return 0
  end

  local count = vim.diagnostic.count(0, { serverity = severity })[severity]
  if count == nil then
    return 0
  end

  return count
end


	local nada = "" -- added this myself to pass nothing to diagnostic parameter

--- @return string
local function lsp_active()
  if not rawget(vim, "lsp") then
    return ""
  end

  local current_buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = current_buf })

  local space = "%#StatusLineMedium# %*"

  if #clients > 0 then
    return space .. "%#GitStatusAdd#󰇻%*"
    -- return space .. "%#GitStatusAdd#⦿%*"
  end
  return ""
end

--- @return string
local function diagnostics_error()
  local count = get_lsp_diagnostics_count(vim.diagnostic.severity.ERROR)
  if count > 0 then
    return string.format("%%#DiagnosticError#•%s%%*", nada  ) -- change nada to 'count' and you get the number of diagnostics 
  end

  return ""
end

--- @return string
local function diagnostics_warns()
  local count = get_lsp_diagnostics_count(vim.diagnostic.severity.WARN)
  if count > 0 then
    return string.format("%%#DiagnosticWarn#•%s%%*", nada)
  end

  return ""
end

--- @return string
local function diagnostics_hint()
  local count = get_lsp_diagnostics_count(vim.diagnostic.severity.HINT)
  if count > 0 then
    return string.format("%%#DiagnosticHint#•%s%%*", nada)
  end

  return ""
end

--- @return string
local function diagnostics_info()
  local count = get_lsp_diagnostics_count(vim.diagnostic.severity.INFO)
  if count > 0 then
    return string.format("%%#DiagnosticInfo#•%s%%*", nada)
  end

  return ""
end

----------------------
-- LSP Progress
----------------------

--- @class LspProgress
--- @field client vim.lsp.Client?
--- @field kind string?
--- @field title string?
--- @field percentage integer?
--- @field message string?
local lsp_progress = {
  client = nil,
  kind = nil,
  title = nil,
  percentage = nil,
  message = nil,
}

vim.api.nvim_create_autocmd("LspProgress", {
  group = statusline_augroup,
  desc = "Update LSP progress in statusline",
  pattern = { "begin", "report", "end" },
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    lsp_progress = {
      client = vim.lsp.get_client_by_id(args.data.client_id),
      kind = args.data.params.value.kind,
      message = args.data.params.value.message,
      percentage = args.data.params.value.percentage,
      title = args.data.params.value.title,
    }

    if lsp_progress.kind == "end" then
      lsp_progress.title = nil
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 500)
    else
      vim.cmd.redrawstatus()
    end
  end,
})

--- @return string
local function lsp_status()
  if not rawget(vim, "lsp") then
    return ""
  end

  if vim.o.columns < 120 then
    return ""
  end

  if not lsp_progress.client or not lsp_progress.title then
    return ""
  end

  local title = lsp_progress.title or ""
  local percentage = (lsp_progress.percentage and (lsp_progress.percentage .. "%%")) or ""
  local message = lsp_progress.message or ""

  local lsp_message = string.format("%s", title)

  if message ~= "" then
    lsp_message = string.format("%s %s", lsp_message, message)
  end

  if percentage ~= "" then
    lsp_message = string.format("%s %s", lsp_message, percentage)
  end

  return string.format("%%#StatusLineLspMessages#%s%%* ", lsp_message)
end

-------------------------------
--- File Location Percentage 
-------------------------------

--- @return string
local function total_lines()
  local lines = vim.fn.line("$")
  -- return string.format("%%#StatusLineMedium# L:%s %%*", lines)
  return string.format("%%#StatusLineMedium# 󰉡 %s%%*", lines)
end

-------------------------------
--- Statusline formatting
-------------------------------

StatusLine = {}

StatusLine.inactive = function()
  return table.concat({
    formatted_filetype("StatusLineMode"),
  })
end

local redeable_filetypes = {
  ["qf"] = true,
  ["help"] = true,
  ["tsplayground"] = true,
}

StatusLine.active = function()
  local mode_str = vim.api.nvim_get_mode().mode
  if mode_str == "t" or mode_str == "nt" then
    return table.concat({
      mode(),
      "%=",
      "%=",
      -- file_percentage(),
      total_lines(),
    })
  end

  if redeable_filetypes[vim.bo.filetype] or vim.o.modifiable == false then
    return table.concat({
      "%=",
      "%=",
      -- file_percentage(),
      total_lines(),
    })
  end

-- this is the order of the statusline
  local statusline = {
    mode(),
		filename(),
		"%S ", -- separator
    lsp_status(),
		-- "%S ", -- separator
		"%=", -- center alignment
    -- filetype(),
    diagnostics_info(),
    full_git(),
    -- lsp_clients(),
    -- diagnostics_error(),
    -- diagnostics_warns(),
    -- diagnostics_hint(),
    total_lines(),
    lsp_active(),
		"%S "
  }

  return table.concat(statusline)
end

vim.opt.statusline = "%!v:lua.StatusLine.active()"

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FileType" }, {
  group = statusline_augroup,
  pattern = {
    "TelescopePrompt",
    "fzf",
    "lspinfo",
    "lazy",
    "netrw",
    "mason",
    "noice",
    "qf",
  },
  callback = function()
    vim.opt_local.statusline = "%!v:lua.StatusLine.inactive()"
  end,
})
return M

-- ◉ 󰇻  lsp is loaded, turns green
-- ○ 󰩇  no lsp loaded
-- toe way the statusline works is that you call a bunch of functions (the parts) and then concatonate them as a string in the end. so the stautline is just a list of all the parts you created
