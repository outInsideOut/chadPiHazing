-- return {
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		config = function()
-- 		-- 	-- solution for LSP not supported or not found error in Neovim
-- 		-- 	local lua_ls_path = "/usr/local/bin/lua-language-server/bin/lua-language-server"
-- 		-- 	require("mason-lspconfig").setup_handlers({
-- 		-- 		["lua_ls"] = function()
-- 		-- 			local lspconfig = require("lspconfig")
-- 		-- 			lspconfig.lua_ls.setup({
-- 		-- 				cmd = { lua_ls_path }
-- 		-- 			})
-- 		-- 		end,
-- 		-- 	})
-- 		-- end,
-- 	  require'lspconfig'.lua_ls.setup {
--   		on_init = function(client)
--     		local path = client.workspace_folders[1].name
--     		if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
--       		return
--     		end
--
--     		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--       		runtime = {
--         		-- Tell the language server which version of Lua you're using
--         		-- (most likely LuaJIT in the case of Neovim)
--         		version = 'LuaJIT'
--       		},
--       		-- Make the server aware of Neovim runtime files
--       		workspace = {
--         		checkThirdParty = false,
--         		library = {
--           		vim.env.VIMRUNTIME
--           		-- Depending on the usage, you might want to add additional paths here.
--           		"/usr/local/bin/lua-language-server/bin/lua-language-server",
--           		-- "${3rd}/luv/library"
--           		-- "${3rd}/busted/library",
--         		}
--         		-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--         		-- library = vim.api.nvim_get_runtime_file("", true)
--       		}
--     		})
--   		end,
--   		settings = {
--     		Lua = {}
--   		}
-- 		}
-- 	},
-- }