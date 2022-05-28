local M = {}

M.config = function()
    local lsp = require("lspconfig")
    local coq = require("coq")
    local opts = { silent = true }

    keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        keymap_buf(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        keymap_buf(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        keymap_buf(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        keymap_buf(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        keymap_buf(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        keymap_buf(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        keymap_buf(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        keymap_buf(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        keymap_buf(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    end

    lsp.pyright.setup(coq.lsp_ensure_capabilities({
        settings = {
            python = {
                analysis = {
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "off",
                },
            },
        },
        capabilities = capabilities,
        on_attach = on_attach,
    }))
    lsp.texlab.setup(coq.lsp_ensure_capabilities({}))
    cmd([[ COQnow -s ]])
end

return M
