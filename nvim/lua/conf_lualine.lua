local M = {}

M.config = function()
    lualine = require('lualine')
    lualine.setup{
        options = {
            theme = 'nord',
            section_separators = {'', ''},
            component_separators = {' ', ''},
            icons_enabled = true,
            left_padding = 1.4,
        },
        sections = {
            lualine_a = {{'mode', upper = true}},
            lualine_b = {{'branch', icon = ' '}},
            lualine_c = {{ 'filename', file_status = true }},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {{ 'diagnostics', sources = {'nvim_lsp'}}},
            lualine_z = {'location' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
    }
end

return M
