require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "rust",  "cuda", "dockerfile", "go", "javascript", "sql", "r", "bash", "bibtex", "latex"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
