-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Tabs & Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Line wrapping
vim.o.wrap = false

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Appearance settings
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.cmdheight = 1
vim.o.scrolloff = 8
vim.o.updatetime = 50
vim.o.colorcolumn = "80"

-- Backups and undofile
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Set undodir path based on platform (Windows vs. Unix-like)
if vim.fn.has('win32') == 1 then
  vim.o.undodir = vim.fn.expand('$USERPROFILE') .. '\\AppData\\Local\\nvim\\undodir'
else
  vim.o.undodir = vim.fn.expand('~/.local/nvim/undodir')
end

-- Ensure undodir exists
if not vim.fn.isdirectory(vim.o.undodir) then
  vim.fn.mkdir(vim.o.undodir, "p")
end

-- Misc settings
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- Auto save on FocusLost or WinLeave
vim.api.nvim_create_autocmd({"FocusLost", "WinLeave"}, {
  pattern = "*",  -- Apply to all buffers
  callback = function()
    -- Only save if the buffer is modified and has a filename
    if vim.bo.modified and vim.fn.expand('%') ~= "" then
      vim.cmd('silent! write')
    end
  end
})

-- Auto change directory when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! lcd %:p:h")
  end
})



