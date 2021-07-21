local M = {}

M.config = function()
    require "compe".setup {
        source = {
            path = { kind = "   (Path)" },
            buffer = { kind = " ﬘  (Buffer)" },
            calc = { kind = "   (Calc)" },
            luasnip = { kind = " ﬌  (Snippet)" },
            nvim_lsp = { kind = "   (LSP)" },
            spell = { kind = "   (Spell)" },
            tags = false,
            nvim_lua = false,
            ultisnips = false,
            treesitter = false,
            snippets_nvim = false,
            vim_dadbod_completion = false,
        },
    }

    vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", { noremap = true, silent = true, expr = true })

---------------------------------------------------------------------------------------
-- From https://github.com/hrsh7th/nvim-compe#how-to-use-tab-to-navigate-completion-menu
---------------------------------------------------------------------------------------
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    -- Use (s-)tab to:
    --- move to prev/next item in completion menuone
    --- jump to prev/next snippet's placeholder
    _G.tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-n>"
        -- elseif vim.fn['vsnip#available'](1) == 1 then
        --     return t "<Plug>(vsnip-expand-or-jump)"
        elseif check_back_space() then
            return t "<Tab>"
        else
            return vim.fn['compe#complete']()
        end
    end
    _G.s_tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-p>"
        elseif vim.fn['vsnip#jumpable'](-1) == 1 then
            return t "<Plug>(vsnip-jump-prev)"
        else
            -- If <S-Tab> is not working in your terminal, change it to <C-h>
            return t "<S-Tab>"
        end
    end
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
    local ls = require("luasnip")

    ls.config.set_config(
        {
            history = true,
            updateevents = "TextChanged,TextChangedI"
        }
    )
    require("luasnip/loaders/from_vscode").load()

    cmd[[
        imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-Tab>' 
        snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
        snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
        imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
        smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    ]]
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

end

return M
