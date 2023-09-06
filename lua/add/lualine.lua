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
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

require('lualine').setup {
  options = {
    theme = "rose-pine",
    component_separators = { left = "░▒▓", right = "" },
    section_separators = { left = '▓▒░', right = '' },
		diabled_filetypes = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
		lualine_c = {},
		lualine_x = { 'filename' },
    lualine_y = {'branch', 'diff'},
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

local function modes()
	return mode_map[vim.api.nvim_get_mode().mode] or "__"
end

local mode_map = {
	["n"] = "N",
	["no"] = "O·P",
	["nov"] = "O·P",
	["noV"] = "O·P",
	["no\22"] = "O·P",
	["niI"] = "N·I",
	["niR"] = "N·R",
	["niV"] = "N",
	["nt"] = "N·T",
	["v"] = "V",
	["vs"] = "V",
	["V"] = "V·L",
	["Vs"] = "V·L",
	["\22"] = "V·B",
	["\22s"] = "V·B",
	["s"] = "S",
	["S"] = "S·L",
	["\19"] = "S·B",
	["i"] = "I",
	["ic"] = "I·C",
	["ix"] = "I·X",
	["R"] = "R",
	["Rc"] = "R·C",
	["Rx"] = "R·X",
	["Rv"] = "V·R",
	["Rvc"] = "RVC",
	["Rvx"] = "RVX",
	["c"] = "C",
	["cv"] = "EX",
	["ce"] = "EX",
	["r"] = "R",
	["rm"] = "M",
	["r?"] = "C",
	["!"] = "SH",
	["t"] = "T",
}


--{ left = '', right = ''},
-- section_separators = { left = '', right = ''},
-- 
-- ░▒▓
-- 
-- 
--	{ 'mode', separator = { left = '', right = '' }, right_padding = 2, },
--{ 'filetype', separator = { left = '', right = '' } },
