

--Installing lazy

local lazypath = vim.fn.stdpath('data') .. '/site/pack/packer/start/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/folke/lazy.nvim', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  --Installing Plugins form Lazy
----------------------------------------------------------------------------------------------
                --EDITOR RELATED PLUGINS
----------------------------------------------------------------------------------------------
--lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
      -- Load specific config from the 'lualine.lua' file
      require('config.plugins.nvim-lualine')
    end
  },

--autopairs
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      -- Load specific config from the 'lualine.lua' file
      require('nvim-autopairs').setup()
    end
},
--autotags
{
  
  'windwp/nvim-ts-autotag',
  event = "BufReadPre",
  ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue", "xml" },
  config = function()
    require('nvim-ts-autotag').setup()
    end
},
----------------------------------------------------------------------------------------------
                --COLORSCEHEMS
----------------------------------------------------------------------------------------------
--nightowl
  {
    "oxfist/night-owl.nvim",
    config = function()
      require('config.plugins.nvim-night-owl')
    end
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require('config.plugins.nvim-tokyonight')
    end
  },

  {
  "rose-pine/neovim",
	name = "rose-pine",
    config = function()
      require('config.plugins.nvim-rose-pine')
    end
  },
----------------------------------------------------------------------------------------------
                --EXPLORER
----------------------------------------------------------------------------------------------
--oil
{
  'stevearc/oil.nvim',
  config = function()
    require('config.plugins.nvim-oil')
  end
},

----------------------------------------------------------------------------------------------
                --Treesitter
----------------------------------------------------------------------------------------------
--treesitter for syntax highlights
{
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('config.lsp.nvim-treesitter')
  end
},
----------------------------------------------------------------------------------------------
                --LSP Installer and neovim built in lsp manager
----------------------------------------------------------------------------------------------
--Meson to GUI to install language_server-lintter-debugger-formatter for diffrent languages
{
  "williamboman/mason.nvim", --gui installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim", --configs and ensure installed for meson
    "neovim/nvim-lspconfig", --neovim built in lsp
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require('config.lsp.nvim-mason')
  end
},
{
'nvim-java/nvim-java',
  config = function()
    require('java').setup()
  end
},

----------------------------------------------------------------------------------------------
                --AutoCompletion
----------------------------------------------------------------------------------------------
{
  'hrsh7th/nvim-cmp', -- Autocompletion engine
  dependencies = {
  'L3MON4D3/LuaSnip', -- Snippets plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer', -- LSP source for nvim-cmp
  'hrsh7th/cmp-path', -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  "rafamadriz/friendly-snippets",
  },
  config = function()
    require("config.lsp.nvim-completion")
  end
},

----------------------------------------------------------------------------------------------
                --Formatting and Linting
----------------------------------------------------------------------------------------------
{

  'nvimtools/none-ls.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function ()
   require('config.lsp.nvim-none-ls') 
  end
},

})
