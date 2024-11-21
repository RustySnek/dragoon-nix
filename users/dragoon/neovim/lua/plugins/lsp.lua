return {
	"neovim/nvim-lspconfig",
	config = function()
		local lsp = require("lspconfig")
		lsp.pyright.setup({})
		lsp.lua_ls.setup({})
		lsp.tsserver.setup({})

		lsp.cssls.setup({})

		lsp.html.setup({
			configurationSection = { "html", "css", "javascript", "heex" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		})
	end,
}
