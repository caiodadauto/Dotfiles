local lualine = require("lualine")

local mocha = require("catppuccin.palettes").get_palette("mocha")

local function get_current_filename()
    local bufname = vim.api.nvim_buf_get_name(0)
    return bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or ''
end

local function get_current_filetype()
    return vim.api.nvim_buf_get_option(0, "filetype")
end

local function get_native_lsp()
    local buf_ft = get_current_filetype()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return ""
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return ""
end

local function get_current_buftype()
    return vim.api.nvim_buf_get_option(0, "buftype")
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
    end
end

local function parent_folder()
    local current_buffer = vim.api.nvim_get_current_buf()
    local current_file = vim.api.nvim_buf_get_name(current_buffer)
    local parent = vim.fn.fnamemodify(current_file, ":h:t")
    if parent == "." then
        return ""
    end
    return parent .. "/"
end

local Job = require("plenary.job")
local function get_git_compare()
    -- Get the path of the current directory.
    local curr_dir = vim.api.nvim_buf_get_name(0):match("(.*" .. "/" .. ")")

    -- Run job to get git.
    local result = Job:new({
        command = "git",
        cwd = curr_dir,
        args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
    })
        :sync(100)[1]

    -- Process the result.
    if type(result) ~= "string" then
        return ""
    end
    local ok, ahead, behind = pcall(string.match, result, "(%d+)%s*(%d+)")
    if not ok then
        return ""
    end

    -- No file, so no git.
    if get_current_buftype() == "nofile" then
        return ""
    end
    local string = ""
    if behind ~= "0" then
        string = string .. "󱦳" .. behind
    end
    if ahead ~= "0" then
        string = string .. "󱦲" .. ahead
    end
    return string
end

lualine.setup({
    sections = {
        lualine_a = {
            {
                "mode",
                icon = { "" },
                separator = { right = "█", left = "█" },
            },
        },
        lualine_b = {},
        lualine_c = {
            {
                parent_folder,
                color = { fg = mocha.text },
                icon = { "   ", color = { fg = mocha.text } },
                separator = "",
                padding = 0,
            },
            {
                get_current_filename,
                color = { fg = mocha.text },
                separator = " ",
                padding = 0,
            },
            {
                "branch",
                color = { fg = mocha.text },
                icon = { "  ",  color = { fg = mocha.text } },
                separator = " ",
                padding = 0,
            },
            {
                get_git_compare,
                separator = " ",
                padding = 0,
                color = { fg = mocha.text },
            },
            {
                "diff",
                padding = 0,
                color = { fg = mocha.text },
                icon = { " ", color = { fg = mocha.text } },
                source = diff_source,
                symbols = { added = " ", modified = " ", removed = " " },
                diff_color = {
                    added = { fg = mocha.text },
                    modified = { fg = mocha.text },
                    removed = { fg = mocha.text },
                },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " ", hint = "󱤅 ", other = "󰠠 " },
                colored = true,
                padding = 1,
            },
            {
                get_native_lsp,
                padding = 2,
                separator = " ",
                color = { fg = mocha.text },
                icon = { " ", color = { fg = mocha.text } },
            },
        },
        lualine_y = {},
        lualine_z = {
            {
                "location",
                icon = { "", align = "left" }, --, color = { fg = c.black } },
            },
            {
                "progress",
                icon = { "", align = "left" }, -- color = { fg = c.black } },
                separator = { right = "█", left = "█" },
            },
        },
    },
    options = {
        disabled_filetypes = { "alpha" },
        globalstatus = true,
        section_separators = { left = "█", right = "█" },
        component_separators = { left = "", right = "" },
    },
})
