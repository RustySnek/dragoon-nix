return {
	"NeogitOrg/neogit",
	version = "v0.0.1",
	branch = "nightly",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	opts = { use_magit_keybindings = true },
}
