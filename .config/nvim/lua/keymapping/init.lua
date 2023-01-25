local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = ","

map("n", "<leader>z", "<cmd>NvimTreeToggle<CR>", opts)

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>", opts)

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>", opts)

-- Fast saving with <leader> and s
map("n", "<leader>w", ":w<CR>", opts)

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>q", ":qa!<CR>", opts)

-- Delete current buffer
map("n", "<leader>d", ":bd<CR>", opts)

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K", opts) -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H", opts) -- change horizontal to vertical

map("n", "<leader>f", "<cmd>Telescope find_files hidden=true previewer=false<CR>", opts) -- change horizontal to vertical
map("n", "<leader>b", "<cmd>Telescope buffers previewer=false<CR>", opts) -- change horizontal to vertical
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts) -- change horizontal to vertical
map("n", "<leader>s", "<cmd>Telescope file_browser files=false hidden=true<CR>", opts) -- change horizontal to vertical
