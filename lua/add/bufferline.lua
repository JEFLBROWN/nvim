local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

-- local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup {

	options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
},

	-- highlights = require("catppuccin.groups.integrations.bufferline").get {
	-- 	styles = { "italic", "bold" },
	-- 	custom = {
	-- 		all = {
	-- 			-- fill = { bg = "some color" },
	-- 		},
	-- 		mocha = {
	-- 			background = { fg = mocha.text },
	-- 		},
	-- 		latte = {
	-- 			background = { fg = "#000000" },
	-- 		},
	-- 	}
	-- },


} -- end
