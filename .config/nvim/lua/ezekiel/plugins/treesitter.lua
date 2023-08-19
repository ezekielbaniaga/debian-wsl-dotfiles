-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

local install_status, ts_install = pcall(require, "nvim-treesitter.install")
if not install_status then
    return
end

-- This is the default compilers for treesitter modules
-- `choco install mingw` was executed to have the gcc
-- because clang won't work
-- In Debian, I used 'sudo app install build-essential'
ts_install.compilers = { "clang", "gcc" }

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
    },
    -- enable indentation, disabled by zek because of indentation bug
    indent = { enable = false },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "c",
        "rust",
        "sql",
        "json",
        "java",
        "javascript",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "gitignore",
    },
    -- auto install above language parsers
    auto_install = true,
})

