require("mason-lspconfig").setup()

-- Automatic Install
-- this loops through all of the LSPs installed through Mason, 
-- and then automatically configures the language, 
-- so you dont need to add each one manually
require('mason-lspconfig').setup_handlers {
	function(server_name)
	require('lspconfig')[server_name].setup{}
	end,
}
