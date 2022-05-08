local M = {}

M.config = function()
    local dashboard = {
        active = false,
        search_handler = "telescope",
        custom_header = {
'            ░░                                                                  ░░     ',
'                                                                                       ',
'                                                                                       ',
'      ░░                                ░░  ██                                         ',
'  ░░                                        ██                              ░░░░       ',
'                                          ▓▓▓▓▓▓                                       ',
'                                        ▓▓▓▓▓▓▓▓▓▓                                     ',
'                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                   ',
'                                      ▓▓▒▒▓▓▓▓▒▒▓▓▓▓                                   ',
'                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                   ',
'                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                   ',
'                                      ░░░░▒▒░░░░░░░░                                   ',
'                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                   ',
'                                      ▓▓▒▒▒▒▓▓▒▒▒▒▓▓                                   ',
'                                      ▓▓▒▒▒▒██▒▒▒▒▓▓                                   ',
'                                    ████▓▓▓▓▓▓██▓▓▓▓██      ░░                         ',
'                                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██                               ',
'                                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██                             ',
'                                ▓▓▓▓▓▓██▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓                             ',
'        ░░                      ▓▓▓▓▓▓░░████████████░░████                        ░░   ',
'                                ▓▓    ▓▓░░░░░░▓▓░░░░    ▓▓                             ',
'                                                                                       ',
'                                                                                       ',
'                                                                                       ',
'                        ▒▒                ▒▒    ▒▒          ▒▒    ▒▒                   ',

                                -- '      ██    ██    ██      ',
                                -- '    ██      ██  ██        ',
                                -- '    ██    ██    ██        ',
                                -- '      ██  ██      ██      ',
                                -- '      ██    ██    ██      ',
                                -- '                          ',
                                -- '  ████████████████████    ',
                                -- '  ██                ██████',
                                -- '  ██                ██  ██',
                                -- '  ██                ██  ██',
                                -- '  ██                ██████',
                                -- '    ██            ██      ',
                                -- '████████████████████████  ',
                                -- '██                    ██  ',
                                -- '  ████████████████████    ',
        -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        },

        custom_section = {
            -- a = {
            --     description = { "  Find File          " },
            --     command = "Telescope find_files",
            -- },
            b = {
                description = { "  Recently Used Files" },
                command = "Telescope oldfiles",
            },
            -- c = {
            --     description = { "  Find Word          " },
            --     command = "Telescope live_grep",
            -- },
            -- d = {
            --     description = { "  Settings           " },
            --     command = [[:lua require('telescope.builtin').find_files( {search_dirs = {vim.fn.expand "$CONFIG_PATH"}} )]]
            -- },
        },

        custom_footer = {
            "Loaded " .. vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)) .. ' plugins',
        },
    }

    vim.g.dashboard_disable_at_vimenter = 0

    vim.g.dashboard_custom_header = dashboard.custom_header

    vim.g.dashboard_default_executive = dashboard.search_handler

    vim.g.dashboard_custom_section = dashboard.custom_section

    vim.g.dashboard_custom_footer = dashboard.custom_footer
end

return M
