local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require ("user.lsp.mason")
require ("user.lsp.mason-lspconfig")
require ("user.lsp.lspconfig")
require ("user.lsp.emmet-ls")

-- NOTES
-- this is where you call for all plugins regarding the LSP, the user.lsp is the file path
