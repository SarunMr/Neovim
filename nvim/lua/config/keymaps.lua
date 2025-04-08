

-- Normal mode keybindings
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true }) -- Move to left window
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true }) -- Move to bottom window
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true }) -- Move to top window
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true }) -- Move to right window

vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true }) -- Decrease window height
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true }) -- Increase window height
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true }) -- Decrease window width
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true }) -- Increase window width

vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true }) -- Move line down
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true }) -- Move line up

vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true }) -- Switch to next buffer
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true }) -- Switch to previous buffer

vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Clear search highlighting
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true }) -- Save the file
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true }) -- Quit the file
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true }) -- Close the buffer

vim.api.nvim_set_keymap('n', '<leader>qq', ':q!<CR>', { noremap = true, silent = true }) -- Force quit without saving

-- Visual mode keybindings
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true }) -- Indent left and reselect
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true }) -- Indent right and reselect

vim.api.nvim_set_keymap('v', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true }) -- Move selected lines down
vim.api.nvim_set_keymap('v', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true }) -- Move selected lines up

-- Terminal mode keybindings
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true }) -- Exit terminal mode

-- Additional keybinding for 'make' command
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>!make<CR>', { noremap = true, silent = true }) -- Run the 'make' command in normal mode
