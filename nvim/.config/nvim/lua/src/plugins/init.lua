local packer = require('packer')
local packer_list = require('src.plugins.list')

packer.init({
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
})

packer.startup(function(use)
    for _, value in ipairs(packer_list) do
        use(value)
    end
end)
