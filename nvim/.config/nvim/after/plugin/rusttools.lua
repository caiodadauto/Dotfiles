local M = {}

M.setup = function()
    local rt = require('rust-tools')

    rt.setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    }
end

return M
