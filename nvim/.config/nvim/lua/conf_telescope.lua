local M = {}

M.config = function()
    telescope = require('telescope')

    telescope.setup {
        extensions = {
            fzf = {
                -- override the generic sorter; override the file sorter or
                -- "ignore_case" or "respect_case" the default case_mode is "smart_case"
                override_generic_sorter = false, 
                override_file_sorter = true,     
                case_mode = "smart_case",        
            },
        }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    telescope.load_extension('fzf')

    keymap('n', '<leader>p', [[:lua require('telescope.builtin').find_files()<CR>]])
    keymap('n', '<leader>fh', [[:lua require('telescope.builtin').find_files({hidden = true})<CR>]])
    keymap('n', '<leader>fg', [[:lua require('telescope.builtin').live_grep()<CR>]])
    keymap('n', '<leader>fb', [[:lua require('telescope.builtin').buffers()<CR>]])
end

return M
