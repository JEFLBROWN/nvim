local o = vim.opt  -- Access your local variable `o` here if not redefined

-- Function to get the file type icon from mini-icons
local function get_filetype_icon()
  local filetype = vim.bo.filetype
  if filetype == "" then
    return ""
  end

  local icon = require('mini.icons').get_icon(filetype)  -- Adjust based on mini-icons' API
  return icon or ""  -- Fallback icon (generic file icon)
end

-- Function to build the winbar content
local function get_winbar_content()
  local fname = vim.fn.expand("%:t")  -- Get the filename
  if fname == "" then
    return ""
  end

  local icon = get_filetype_icon()  -- Get the filetype icon
  local modified = vim.bo.modified and "●" or ""  -- Indicator if the file is modified

  -- Customize the winbar with icon, filename, and modified indicator
  return string.format("%%=%s %%#PmenuSel# %s %%* %s", icon, fname, modified)
end

-- Set up the winbar after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "PackerComplete",  -- Adjust if using a different plugin manager
  callback = function()
    o.winbar = "%{%v:lua.get_winbar_content()%}"
  end,
})
