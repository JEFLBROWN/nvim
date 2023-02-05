local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { -- one of "all" or a list of languages
		"html", 
		"css", 
		"lua",
		"vim",
		"c",
		"javascript",
		"typescript",
		"markdown",
		"yaml",
	},
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python","html","css" } },
})
