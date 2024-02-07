-- Install the plugin using your preferred plugin manager
-- For example, with packer.nvim:
-- use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}

-- Load the plugin
vim.g.NERDTreeChDirMode = 2 -- Make NERDTree modifiable
vim.g.NERDTreeShowHidden = 1 -- Show hidden files

-- Optional: Key mapping to toggle NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })



