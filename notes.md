# Notes
## on this config.
this is for future reference because you're going to forget a lot

## you have 2 init files, one for LSP and one for all of nvim 
the lsp is in lua/user/lsp/init.lsp

in the global init, you Have to keep the plugins, opts, and keymap at the top, as well as the other init.lua. this is because it loads top to bottom, so the modules need to all load, THEN their settings per .lua file.

for telescope extensions, you add it to the plugin file, then call the extension in the telescope.lua file. You already "required" telescope so you only need to load the plugin.
