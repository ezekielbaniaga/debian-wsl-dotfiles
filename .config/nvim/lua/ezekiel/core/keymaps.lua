vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps 

keymap.set("i", "jk", "<ESC>") -- quickly quit insert mode by typing jk
keymap.set("n", "J", "}") -- prev paragraph
keymap.set("n", "K", "{") -- next paragraph
keymap.set("n", "{", "J") -- join lines
keymap.set("v", "J", "}") -- prev paragraph in visual mode
keymap.set("v", "K", "{") -- next paragraph in visual mode
keymap.set("v", "{", "J") -- join lines in visual mode

keymap.set("n", "<leader>w", ":w<CR>") -- quickly save file
keymap.set("n", "<leader>q", ":q<CR>") -- quickly close file
keymap.set("n", "<leader>wq", ":wq<CR>") -- quickly save and close file

keymap.set("n","<leader>nh", ":nohl<CR>") -- clear search highlight

keymap.set("n", "x", '"_x') -- delete one char using 'x' but does not copy to register

keymap.set("n", "<C-d>", "<C-d>zz") -- add centering for ctrl+d
keymap.set("n", "<C-u>", "<C-u>zz") -- add centering for ctrl+d

keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab


--
-- plugin keymaps
--

-- LSP Saga https://nvimdev.github.io/lspsaga/floaterm/
keymap.set("n", "<leader>z", "<cmd>Lspsaga term_toggle<CR>") -- floating terminal 

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximizes or restores current split window


-- Toggle NVimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader><leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader><leader>ef", ":NvimTreeFindFile<CR>")


-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
