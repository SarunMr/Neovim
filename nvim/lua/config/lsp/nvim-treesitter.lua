
require'nvim-treesitter.install'.prefer_git = false
require'nvim-treesitter.install'.compliers = {"gcc","clang"}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "c",
    "c_sharp",
    "css",
    "dart",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "nix",
    "powershell",
    "python",
    "python",
    "typescript",
    "yaml",
  },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
