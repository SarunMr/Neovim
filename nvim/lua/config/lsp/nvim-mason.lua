-- config/lsp/nvim-mason.lua
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = { 
    "bashls",
    "clangd",
    "cssls",
    "html",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "ts_ls",  -- Changed from ts_ls to tsserver
  },
})

require("mason-null-ls").setup({
        ensure_installed = {
          -- Formatters
          "prettier",
          "black",
          "stylua",
          "clang-format",
          
          -- Linters
          "eslint_d",
        },
      })
-- Set up LSP configs
local lspconfig = require('lspconfig') 

local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(client, bufnr) 

end

-- Setup each LSP
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach
})
lspconfig.jdtls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
      completion = {
        enabled = true,
        postfix = { enabled = true },
        guessMethodArguments = false,
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*", 
          "sun.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org"
        },
        -- VS Code defaults to these settings
        maxResults = 50,
        matchCase = "firstLetter"
      },
    },
})
