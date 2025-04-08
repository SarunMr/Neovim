local null_ls = require("null-ls")
           
      null_ls.setup({
debug = true, -- Keep this for debugging
        sources = {
          -- Formatters - explicitly set paths for Windows
    -- Formatters
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.clang_format,
    
  },
      })
