local bo = vim.bo
local api = vim.api
local lsp = vim.lsp
local border = "single"
local keymap = vim.keymap
local diagnostic = vim.diagnostic
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        keymap.set("n", "K", lsp.buf.hover, opts)
        keymap.set("n", "<space>D", lsp.buf.type_definition, opts)
        keymap.set("n", "<space>rn", lsp.buf.rename, opts)
    end,
})

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = border,
})

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
    border = border,
})

diagnostic.config({
    float = { border = border },
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        'ruff_lsp',
        -- "pyright",
        "rust_analyzer",
    },
})

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
        })
    end,
})

require("lspconfig.ui.windows").default_options.border = "single"

local signs = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = "󱤅 ",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
