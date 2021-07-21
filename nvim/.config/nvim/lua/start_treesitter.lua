local tree = require('nvim-treesitter.configs')

tree.setup {
    ensure_installed = "all",
    ignore_install = { "haskell" },
    highlight = {
        enable = true,
        disable = { "haskell"},
    },
}
