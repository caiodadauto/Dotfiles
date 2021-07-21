local tree = require('nvim-treesitter.configs')

tree.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
}
