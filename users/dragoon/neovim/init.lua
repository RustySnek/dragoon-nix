require("options")

require("keymaps")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
vim.g.catppuccin_flavour = "mocha"
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#101317", fg = "#7AB0DF" })
vim.cmd("Catppuccin mocha")
