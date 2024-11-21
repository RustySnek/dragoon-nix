local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<Leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<Leader>ff", ":Telescope fd<CR>", opts)
keymap("n", "<Leader>fz", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope file_browser path=%:p:h<CR>", opts)
keymap("n", "<Leader>fm", ":Telescope gitmoji<CR>", opts)
keymap("n", "<S-e>", ":lua vim.diagnostic.open_float(0, {scope='line', focusable=true})<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", { noremap = true })
keymap("n", "<A-n>", ":Neogit<CR>", opts)
keymap("n", "<Leader>v", ":vs<CR>", opts)
keymap("n", "<C-h>", ":Telescope colorscheme<CR>", opts)

keymap("n", "<Leader>t", ":lua vim.lsp.buf.hover() vim.lsp.buf.hover()<CR>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
