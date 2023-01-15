local status_ok, styler = pcall(require, "styler")
if not status_ok then
	return
end
-- Packer
use({
  "folke/styler.nvim",
  config = function()
    require("styler").setup({
      themes = {
        markdown = { colorscheme = "gruvbox" },
        help = { colorscheme = "catppuccin-mocha", background = "dark" },
      },
    })
  end,
})
