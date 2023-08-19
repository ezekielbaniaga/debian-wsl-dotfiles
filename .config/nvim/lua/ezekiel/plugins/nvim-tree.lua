local setup,nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

local setup_api, nvimtree_api = pcall(require, "nvim-tree.api")
if not setup_api then
    return
end


-- recommended settings from nvim-tree documentation
vim.g.loaded = 1

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change the arrow colors (open and closed folder)
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
nvimtree.setup({
   renderer = {
       icons = {
           glyphs = {
               folder = {
                   arrow_closed = "→",
                   arrow_open = "↓",
               },
           },
       },
   },
   view = {
       width = 50,
   },
   actions = {
       open_file = {
           window_picker = {
               enable = false,
           },
       },
   },
})

-- opens tree by default
nvimtree_api.tree.open()

