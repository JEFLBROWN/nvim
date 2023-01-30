local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require ("add.lsp.mason")
require ("add.lsp.mason-lspconfig")
require ("add.lsp.lspconfig")
require ("add.lsp.emmet-ls")

-- NOTES
-- this is where you call for all plugins regarding the LSP, the add.lsp is the file path
