return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- solution for LSP not supported or not found error in Neovim
			local lua_ls_path = "/usr/bin/lua-language-server/bin/lua-language-server"
			require("mason-lspconfig").setup_handlers({
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						cmd = { lua_ls_path }
					})
				end,
			})
		end,
	},
}
