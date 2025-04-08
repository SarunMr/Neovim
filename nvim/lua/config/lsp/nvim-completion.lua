local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'ts_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- LuaSnip Setup
local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load() -- Load friendly-snippets

-- nvim-cmp Setup
local cmp = require 'cmp'
cmp.setup {
  max_item_count = 10,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { 
      name = 'luasnip',
      priority = 1000,
    },
    { 
      name = 'nvim_lsp',
      priority = 750,
    },
    { 
      name = 'path',
      priority = 500,
    },
    {
      name= 'buffer',
      priority = 450,
    },
  }),
  formatting = {
    fields = { 'abbr', 'menu', 'kind' },
    format = function(entry, vim_item)
      -- Truncate long items
      local label = vim_item.abbr
      local truncated_label = vim.fn.strcharpart(label, 0, 50)
      if truncated_label ~= label then
        vim_item.abbr = truncated_label .. "..."
      end

      -- Source names
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]

      return vim_item
    end
  },
  sorting = {
    comparators = {
      -- Add comparators that prioritize local variables and methods
      require('cmp').config.compare.locality,
      require('cmp').config.compare.recently_used,
      require('cmp').config.compare.score,
      -- Add more comparators as needed
    },
},
 completion = {
    keyword_length = 2, -- Start suggesting after 3 characters
  } ,
  experimental = {
    ghost_text = true, -- Show inline suggestion
  },
}

-- Optional: Set up additional LuaSnip keybindings
vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)
