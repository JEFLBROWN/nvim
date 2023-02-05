local status_ok, styler = pcall(require, "styler")
if not status_ok then
	return
end

require("styler").setup({
      themes = {
        -- markdown = { colorscheme = "gruvbox" },
        -- help = { colorscheme = "rose-pine", background = "dark" },
      },
    })






