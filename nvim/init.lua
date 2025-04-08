 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('init')

local function set_line_number_highlights()
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })  -- Regular line number
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#858585" })  -- Line numbers below
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#858585" })  -- Line numbers above
end

local function set_cursor_line_nr_highlight()
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",  -- Trigger for any colorscheme
    callback = function()
        set_line_number_highlights()  -- Set custom line number highlights
        set_cursor_line_nr_highlight()  -- Set custom CursorLineNr color
    end,
})
-- Apply the highlights after a colorscheme is applied
local function apply_colorscheme_and_set_defaults(scheme)
    vim.cmd("colorscheme " .. scheme)
end

apply_colorscheme_and_set_defaults("night-owl")
