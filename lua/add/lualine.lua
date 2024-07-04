local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 60
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	icons_enabled = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = false,
	-- icon = "",
}

local location = {
	"location",
	-- padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

require('lualine').setup {
  options = {
    -- theme = "",
    component_separators = { left = "░▒▓", right = "" },
    section_separators = { left = '▓▒░', right = '' },
		diabled_filetypes = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
		lualine_c = {},
		lualine_x = {},
    lualine_y = {'filename', 'branch', 'diff'},
		lualine_z = {'mode'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
	winbar = {},
}




--{ left = '', right = ''},
-- section_separators = { left = '', right = ''},
-- 
-- ░▒▓
-- 
-- 
--	{ 'mode', separator = { left = '', right = '' }, right_padding = 2, },
--{ 'filetype', separator = { left = '', right = '' } },
