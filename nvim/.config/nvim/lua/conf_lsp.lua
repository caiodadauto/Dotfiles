local M = {}

M.config = function()
    local lsp = require('lspconfig')
    local compe = require('compe')

    keymap('n', 'gd', [[:lua vim.lsp.buf.definition()<CR>]])
    keymap('n', '<leader>h', [[:lua vim.lsp.buf.hover()<CR>]])
    keymap('n', '<leader>r', [[:lua vim.lsp.buf.rename()<CR>]])
    keymap('n', '<leader>R', [[:lua vim.lsp.buf.references()<CR>]])
    keymap('n', '[d', [[:lua vim.lsp.diagnostic.goto_prev()<CR>]])
    keymap('n', ']d', [[:lua vim.lsp.diagnostic.goto_next()<CR>]])

---------------------------------------------------------------------------------------
-- From https://github.com/folke/trouble.nvim/issues/52
---------------------------------------------------------------------------------------
    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
        local hl = "LspDiagnosticsSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
-- From https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/lsp/init.lua
---------------------------------------------------------------------------------------
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "",
            spacing = 0,
        },
        signs = true,
        underline = true,
    })

    vim.lsp.protocol.CompletionItemKind = {
        "   (Text) ",
        "   (Method)",
        "   (Function)",
        "   (Constructor)",
        " ﴲ  (Field)",
        "[] (Variable)",
        "   (Class)",
        " ﰮ  (Interface)",
        "   (Module)",
        " 襁 (Property)",
        "   (Unit)",
        "   (Value)",
        " 練 (Enum)",
        "   (Keyword)",
        " ﬌  (Snippet)",
        "   (Color)",
        "   (File)",
        "   (Reference)",
        "   (Folder)",
        "   (EnumMember)",
        " ﲀ  (Constant)",
        " ﳤ  (Struct)",
        "   (Event)",
        "   (Operator)",
        "   (TypeParameter)",
    }

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


    lsp.pyright.setup{ on_attach = require('compe').on_attach,
        settings = {
            python = {
                analysis = {
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "off",
                },
            },
        },
    }
    lsp.texlab.setup{ on_attach = compe.on_attach }
end

return M
