require("oil").setup({
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
delete_to_trash = true,
 view_options = {
    show_hidden = true,
    is_hidden_file = function(name, bufnr)
      local m = name:match("^%.")
      return m ~= nil
    end,
    is_always_hidden = function(name, bufnr)
      return false
    end,
  },
})
--OIL Keymap Custom
vim.keymap.set("n", "<leader>e", function()
        if vim.bo.filetype == "oil" then
          vim.cmd("b#")
        else
          vim.cmd("Oil")
        end
      end, { desc = "Toggle oil file explorer" })
