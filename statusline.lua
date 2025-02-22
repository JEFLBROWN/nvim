local statusline_augroup = vim.api.nvim_create_augroup("native_statusline", { clear = true })
local icons = require 'mini.icons'
local M = {}

local function get_highlight_color(hl_group, color_type) -- this is a general color function, gets the foreground and background
  local hl = vim.api.nvim_get_hl(0, { name = hl_group })
  return hl[color_type] and string.format("#%06x", hl[color_type]) or nil --The "#%06x" format in the code is a string format specifier that converts a number to a six-digit hexadecimal color code, prefixed with #.
end

function M.get_or_create_hl(hl)
    local hl_name = 'Statusline' .. hl

    if not statusline_hls[hl] then
        -- If not in the cache, create the highlight group using the icon's foreground color
        -- and the statusline's background color.
        local bg_hl = vim.api.nvim_get_hl(0, { name = 'StatusLine' })
        local fg_hl = vim.api.nvim_get_hl(0, { name = hl })
        vim.api.nvim_set_hl(0, hl_name, { bg = ('#%06x'):format(bg_hl.bg), fg = ('#%06x'):format(fg_hl.fg) })
        statusline_hls[hl] = true
    end

    return hl_name
end
-------------------------------
--- Modes
-------------------------------

-- Define mode names
local modes = {
  ['n']      = 'NO',
  ['no']     = 'OP',
  ['nov']    = 'OC',
  ['noV']    = 'OL',
  ['no\x16'] = 'OB',
  ['\x16']   = 'VB',
  ['niI']    = 'IN',
  ['niR']    = 'RE',
  ['niV']    = 'RV',
  ['nt']     = 'NT',
  ['ntT']    = 'TM',
  ['v']      = 'VI',
  ['vs']     = 'VI',
  ['V']      = 'VL',
  ['Vs']     = 'VL',
  ['\x16s']  = 'VB',
  ['s']      = 'SE',
  ['S']      = 'SL',
  ['\x13']   = 'SB',
  ['i']      = 'IN',
  ['ic']     = 'IC',
  ['ix']     = 'IX',
  ['R']      = 'RE',
  ['Rc']     = 'RC',
  ['Rx']     = 'RX',
  ['Rv']     = 'RV',
  ['Rvc']    = 'RC',
  ['Rvx']    = 'RX',
  ['c']      = 'CM',
  ['cv']     = 'CV',
  ['r']      = 'PR',
  ['rm']     = 'PM',
  ['r?']     = 'P?',
  ['!']      = 'SH',
  ['t']      = 'TE',
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

---@return string
function M.filetype()
	return ""
end
-- -- Get the background color of StatusLine to apply to the icon
-- local function get_statusline_bg()
--   local hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
--   return hl.bg and string.format("#%06x", hl.bg) or "NONE"
-- end

-- Function to get the filetype icon with its standard foreground color and StatusLine background
-- local function get_filetype_icon_with_standard_color()
--   if not has_icons then return "", "" end
--
--   local filetype = vim.bo.filetype
--   if filetype == "" then
--     return "", ""
--   end
--
--   -- Retrieve the icon and its recommended highlight group from mini-icons
--   local icon, icon_hl = mini_icons.get('filetype', filetype)
--   icon = icon or ""  -- Fallback icon if none found
--
--   -- Get StatusLine background color
--   local statusline_bg = get_statusline_bg()
--
--   -- Get the foreground color from the icon's highlight group
--   local icon_fg = vim.api.nvim_get_hl(0, { name = icon_hl }).fg
--
--   -- Define a new highlight for the icon with the icon's standard color and StatusLine background
--   vim.api.nvim_set_hl(0, "StatusLineIconColor", { fg = icon_fg, bg = statusline_bg })
--
--   return icon, "StatusLineIconColor"
-- end

-- Function to get the modified indicator if the file is modified
local function get_modified_indicator()
  return vim.bo.modified and "*" or ""  -- Display * if modified, otherwise nothing
end

-- Function to format the filename with icon, color, and modified indicator
local function filename()
  local fname = vim.fn.expand("%:t")  -- Get the filename only
  if fname == "" then
    return ""
  end

  -- Get the filetype icon with customized background and foreground
  local icon, icon_hl = get_filetype_icon_with_standard_color()
  local modified = get_modified_indicator()  -- Get modified indicator

  -- Use the Directory highlight group for filename text with StatusLine background
  local statusline_bg = get_statusline_bg()
  vim.api.nvim_set_hl(0, "StatusLineFilenameDirectory", {
		fg = vim.api.nvim_get_hl(0,
			{ name = "Whitespace" }).fg,
		bg = statusline_bg, bold = true })

  -- Format the filename with icon, filename, and modified indicator, applying highlights
  return string.format("%%#%s#%s%%#StatusLineFilenameDirectory# %s%s %%*", icon_hl, icon, fname, modified)
end

-------------------------------
--- Git
-------------------------------

--- @return string
local function git_branch_icon()
  return "%#GitIcon#󰘬%*"  -- Neutral color for icon using StatusLine
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
    full = full .. icon .. space .. branch
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
    return " %#StatusLine#%•"
    -- return " %#StatusLine#% ○" -- old style "LSP inactive, it fills in when its active"
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return " " .. table.concat(c, ",") .. " "
end

-------------------------------
--- LSP signal dots
-------------------------------

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
    return space .. "%#GitStatusAdd#%*"
    -- return space .. "%#GitStatusAdd#⦿%*"
  end
  return ""
end

--- @return string
local function diagnostics_error()
  local count = get_lsp_diagnostics_count(vim.diagnostic.severity.ERROR)
  if count > 0 then
    return string.format("%%#DiagnosticError#•%s%%*", nada) -- change nada to 'count' and you get the number of diagnostics 
  end

  return ""
end

--- @return string
local function diagnostics_warns()
  local count = get_lsp_diagnostics_count(vim.diagnostic.severity.WARN)
  if count > 0 then
    return string.format("%%#DiagnosticWarn#•%s%%*", nada)
    -- return string.format("%%#DiagnosticWarn#•%s%%*", count) -- old "dot indicator"
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

----- @class LspProgress
----- @field client vim.lsp.Client?
----- @field kind string?
----- @field title string?
----- @field percentage integer?
----- @field message string?
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
local function file_percentage()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_line_count(0)

  return string.format("%%#StatusLineMedium#  %d%%%% %%*", math.ceil(current_line / lines * 100))
end

--- @return string
local function total_lines()
  local lines = vim.fn.line("$")
  return string.format("%%#StatusLineMedium#of %s %%*", lines)
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
      file_percentage(),
      total_lines(),
    })
  end

  if redeable_filetypes[vim.bo.filetype] or vim.o.modifiable == false then
    return table.concat({
      "%=",
      "%=",
      file_percentage(),
      total_lines(),
    })
  end

-- this is the order of the statusline
  local statusline = {
    mode(),
		-- filename(),
	-- M.filetype(),
		"%S ", -- separator
    lsp_status(),
		"%S ", -- separator
		"%=", -- center alignment
    -- filetype(),
    full_git(),
    diagnostics_info(),
    -- lsp_active(),
    lsp_clients(),
    diagnostics_error(),
    diagnostics_warns(),
    diagnostics_hint(),
		"%S ", -- separator
    -- file_percentage(),
    -- total_lines(),
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

-- ◉ lsp is loaded, turns green
-- ○ no lsp loaded
-- the way the statusline works is that you call a bunch of functions (the parts) and then concatonate them as a string in the end. so the stautline is just a list of all the parts you created
