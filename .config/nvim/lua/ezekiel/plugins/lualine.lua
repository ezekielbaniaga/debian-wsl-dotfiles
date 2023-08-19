local status, lualine = pcall(require, "lualine")
if not status then
    return
end

-- Try more themes here
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
lualine.setup({
    options = {
        theme = 'ayu_dark'
    }
})
